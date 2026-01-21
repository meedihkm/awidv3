const request = require('supertest');
const mockDatabase = require('../mocks/database.mock');
const jwt = require('jsonwebtoken');

// Mocks globaux
jest.mock('../../config/database', () => mockDatabase.mockPool);
jest.mock('bcryptjs', () => ({
    compare: jest.fn().mockResolvedValue(true)
}));
jest.mock('jsonwebtoken', () => ({
    sign: jest.fn().mockReturnValue('mock_token'),
    verify: jest.fn()
}));
jest.mock('../../config/jwt', () => ({
    jwtSecret: 'test-secret',
}));
jest.mock('../../config/sentry', () => require('../mocks/sentry.mock'));

// Import dynamique de l'app
const app = require('../../index');

describe('E2E: Financial & Payments', () => {
    const ADMIN_ID = 200;
    const ORG_ID = 100;

    beforeEach(() => {
        mockDatabase.mockQuery.mockReset();
        // Mock Auth Token
        jwt.verify.mockReturnValue({ id: ADMIN_ID, organizationId: ORG_ID, role: 'admin' });
    });

    it('devrait récupérer le résumé financier journalier', async () => {
        mockDatabase.mockQuery
            // 1. Auth: Get User
            .mockResolvedValueOnce({ rows: [{ id: ADMIN_ID, organization_id: ORG_ID, role: 'admin', active: true, org_active: true }] })
            // 2. Financial Query (Sum orders, Sum paid)
            .mockResolvedValueOnce({
                rows: [{
                    total_orders: 500.50,
                    total_collected: 300.25,
                    order_count: 10
                }]
            });

        const res = await request(app)
            .get('/api/financial/daily')
            .set('Authorization', 'Bearer admin_token');

        expect(res.status).toBe(200);
        expect(res.body.data.total_orders).toBe(500.50);
        expect(res.body.data.total_collected).toBe(300.25);
    });

    it('devrait lister les dettes clients', async () => {
        mockDatabase.mockQuery
            // 1. Auth: Get User
            .mockResolvedValueOnce({ rows: [{ id: ADMIN_ID, organization_id: ORG_ID, role: 'admin', active: true, org_active: true }] })
            // 2. Debts Query
            .mockResolvedValueOnce({
                rows: [
                    { id: 301, name: 'Client A', email: 'a@test.com', debt: 50, order_count: 2 },
                    { id: 302, name: 'Client B', email: 'b@test.com', debt: 20.5, order_count: 1 }
                ]
            });

        const res = await request(app)
            .get('/api/financial/debts')
            .set('Authorization', 'Bearer admin_token');

        expect(res.status).toBe(200);
        expect(res.body.data).toHaveLength(2);
        expect(res.body.data[0].debt).toBe(50);
        expect(res.body.data[0].name).toBe('Client A');
    });
});
