const request = require('supertest');
const jwt = require('jsonwebtoken'); // Vrai JWT pour générer token
const mockDatabase = require('../../mocks/database.mock');

// Mock Database
jest.mock('../../../config/database', () => mockDatabase.mockPool);

// Mock Config JWT pour être sûr du secret
jest.mock('../../../config/jwt', () => ({
    jwtSecret: 'test-secret-key',
    superAdminKey: 'super-key'
}));

// Mock Sentry config
jest.mock('../../../config/sentry', () => require('../../mocks/sentry.mock'));

const app = require('../../../index');

describe('Orders Routes Integration', () => {
    let adminToken;

    beforeAll(() => {
        // Générer un token valide pour les tests
        adminToken = jwt.sign(
            { id: 1, role: 'admin', organization_id: 10 },
            'test-secret-key',
            { expiresIn: '1h' }
        );
    });

    beforeEach(() => {
        mockDatabase.mockQuery.mockReset();
        // Default safe fallback
        mockDatabase.mockQuery.mockResolvedValue({ info: 'default fallback', rows: [] });
    });

    describe('GET /api/orders', () => {
        it('devrait retourner la liste des commandes pour un admin authentifié', async () => {
            // 1. Auth middleware: User lookup
            mockDatabase.mockQuery.mockResolvedValueOnce({
                rows: [{ id: 1, role: 'admin', organization_id: 10, active: true, org_active: true }]
            });

            // 2. Controller: Count orders query
            mockDatabase.mockQuery.mockResolvedValueOnce({
                rows: [{ count: 2 }]
            });

            // 3. Controller: Get orders list query
            const mockOrders = [
                { id: 100, customer_name: 'Client A', total: 50.00, cafeteria_id: 2, cafeteria_name: 'Cafet', cafeteria_phone: '000', created_at: new Date() },
                { id: 101, customer_name: 'Client B', total: 25.50, cafeteria_id: 2, cafeteria_name: 'Cafet', cafeteria_phone: '000', created_at: new Date() }
            ];
            mockDatabase.mockQuery.mockResolvedValueOnce({ rows: mockOrders });

            // 4. Controller: Get Items for Order 100
            mockDatabase.mockQuery.mockResolvedValueOnce({ rows: [] });

            // 5. Controller: Get Items for Order 101
            mockDatabase.mockQuery.mockResolvedValueOnce({ rows: [] });

            const res = await request(app)
                .get('/api/orders')
                .set('Authorization', `Bearer ${adminToken}`);

            expect(res.status).toBe(200);
            expect(Array.isArray(res.body.data)).toBe(true);
            expect(res.body.data).toHaveLength(2);
            expect(res.body.data[0].id).toBe(100); // Check ID instead of customer_name
            expect(res.body.data[0].cafeteriaId).toBe(2);
        });
    });

    describe('POST /api/orders', () => {
        it('devrait créer une commande valide', async () => {
            // 1. Auth middleware
            mockDatabase.mockQuery.mockResolvedValueOnce({ rows: [{ id: 1, role: 'admin', organization_id: 10, active: true, org_active: true }] });

            // 2. Product Price Check (Loop Item 1)
            mockDatabase.mockQuery.mockResolvedValueOnce({ rows: [{ price: 10 }] });

            // 3. Sequence Number
            mockDatabase.mockQuery.mockResolvedValueOnce({ rows: [{ last_number: 123 }] });

            // 4. Insert Order (Returning *)
            mockDatabase.mockQuery.mockResolvedValueOnce({
                rows: [{ id: 200, status: 'pending', total: 20, order_number: 123, created_at: new Date() }]
            });

            // 5. Product Price Check (Insert Loop Item 1)
            mockDatabase.mockQuery.mockResolvedValueOnce({ rows: [{ price: 10 }] });

            // 6. Insert Order Item 
            mockDatabase.mockQuery.mockResolvedValueOnce({ rows: [] });

            // 7. Audit Log
            mockDatabase.mockQuery.mockResolvedValueOnce({ rows: [] });

            // 8. Get Order Items (for response)
            mockDatabase.mockQuery.mockResolvedValueOnce({
                rows: [{ product_id: '123e4567-e89b-12d3-a456-426614174000', quantity: 2, price: 10 }]
            });

            // Valid UUID for productId to satisfy Zod schema
            const validUUID = '123e4567-e89b-12d3-a456-426614174000';
            const newOrder = {
                items: [
                    { productId: validUUID, quantity: 2 }
                ]
            };

            const res = await request(app)
                .post('/api/orders')
                .set('Authorization', `Bearer ${adminToken}`)
                .send(newOrder);


            expect(res.status).toBe(200);
            expect(res.body.success).toBe(true);
        });
    });
});
