const request = require('supertest');
const mockDatabase = require('../mocks/database.mock');
const jwt = require('jsonwebtoken');

// Mocks globaux
jest.mock('../../config/database', () => mockDatabase.mockPool);
jest.mock('bcryptjs', () => ({
    hash: jest.fn().mockResolvedValue('hashed_password'),
    compare: jest.fn().mockResolvedValue(true)
}));
jest.mock('jsonwebtoken', () => ({
    sign: jest.fn().mockReturnValue('mock_token'),
    verify: jest.fn()
}));
jest.mock('../../config/jwt', () => ({
    jwtSecret: 'test-secret',
    superAdminKey: 'super-secret-key-123',
    accessTokenExpiry: '15m'
}));
jest.mock('../../config/sentry', () => require('../mocks/sentry.mock'));

// Import dynamique de l'app
const app = require('../../index');

describe('E2E: Organization Setup', () => {
    const superAdminKey = 'super-secret-key-123';
    const ADMIN_ID = 200;
    const ORG_ID = 100;

    let adminToken;

    beforeEach(() => {
        mockDatabase.mockQuery.mockReset();
        mockDatabase.mockQuery.mockResolvedValue({ rows: [] });
    });

    it('devrait permettre le flux complet: Création Org -> Login Admin -> Création Produit', async () => {
        // ÉTAPE 1: Création Organisation (Super Admin)
        // ---------------------------------------------

        // Mocks pour /api/super-admin/organizations
        mockDatabase.mockQuery
            // 1. Insert Org
            .mockResolvedValueOnce({
                rows: [{ id: ORG_ID, name: 'Resto Test', type: 'restaurant' }]
            })
            // 2. Insert Admin User
            .mockResolvedValueOnce({
                rows: [{ id: ADMIN_ID, email: 'admin@resto.com' }]
            })
            // 3. Audit Log (ORG_CREATED)
            .mockResolvedValueOnce({ rows: [] });

        const orgData = {
            name: 'Resto Test',
            type: 'restaurant',
            adminEmail: 'admin@resto.com',
            adminPassword: 'password123',
            adminName: 'Admin User'
        };

        const resOrg = await request(app)
            .post('/api/super-admin/organizations')
            .set('x-super-admin-key', superAdminKey)
            .send(orgData);

        expect(resOrg.status).toBe(200);
        expect(resOrg.body.success).toBe(true);

        // ÉTAPE 2: Login Admin
        // --------------------

        // Mocks pour /api/auth/login
        mockDatabase.mockQuery
            // 1. Select User by Email
            .mockResolvedValueOnce({
                rows: [{
                    id: ADMIN_ID,
                    email: 'admin@resto.com',
                    password: 'hashed_password', // Match mock bcrypt
                    organization_id: ORG_ID,
                    role: 'admin',
                    active: true,
                    org_active: true,
                    org_name: 'Resto Test',
                    org_type: 'restaurant'
                }]
            })
            // 2. Insert Refresh Token
            .mockResolvedValueOnce({ rows: [] })
            // 3. Audit Log (LOGIN_SUCCESS)
            .mockResolvedValueOnce({ rows: [] });

        const resLogin = await request(app)
            .post('/api/auth/login')
            .send({
                email: 'admin@resto.com',
                password: 'password123'
            });

        expect(resLogin.status).toBe(200);
        expect(resLogin.body.accessToken).toBe('mock_token');

        // Simulate getting the token
        adminToken = 'mock_token';

        // ÉTAPE 3: Création Produit (Admin)
        // ---------------------------------
        // Set verify to return proper user
        jwt.verify.mockReturnValueOnce({ id: ADMIN_ID, organizationId: ORG_ID });

        // Mocks pour /api/products
        mockDatabase.mockQuery
            // 1. Auth Middleware: Select User by ID
            .mockResolvedValueOnce({
                rows: [{
                    id: ADMIN_ID,
                    organization_id: ORG_ID,
                    role: 'admin',
                    active: true,
                    org_active: true
                }]
            })
            // 2. Controller: Get Max Sort Order
            .mockResolvedValueOnce({
                rows: [{ next_order: 1 }]
            })
            // 3. Controller: Insert Product
            .mockResolvedValueOnce({
                rows: [{ id: 300, name: 'Burger', price: 10.5 }]
            })
            // 4. Audit Log (PRODUCT_CREATED)
            .mockResolvedValueOnce({ rows: [] });

        const productData = {
            name: 'Burger',
            description: 'Delicious',
            price: 10.5,
            category: 'Main',
            image: 'url',
            available: true
        };

        const resProduct = await request(app)
            .post('/api/products')
            .set('Authorization', `Bearer ${adminToken}`)
            .send(productData);

        expect(resProduct.status).toBe(200);
        expect(resProduct.body.data.name).toBe('Burger');
    });
});
