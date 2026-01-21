const request = require('supertest');
const jwt = require('jsonwebtoken');
const mockDatabase = require('../../mocks/database.mock');

// Mock Database
jest.mock('../../../config/database', () => {
    const mock = mockDatabase.mockPool;
    mock.getClient = jest.fn().mockResolvedValue({
        query: mockDatabase.mockQuery,
        release: jest.fn()
    });
    return mock;
});

// Mock Config JWT
jest.mock('../../../config/jwt', () => ({
    jwtSecret: 'test-secret-key',
    superAdminKey: 'super-key'
}));

// Mock Sentry
jest.mock('../../../config/sentry', () => require('../../mocks/sentry.mock'));

// Mock Compression (Missing dependency workaround for test)
jest.mock('compression', () => () => (req, res, next) => next(), { virtual: true });

// Mock Bull Board (Missing dependency workaround)
jest.mock('@bull-board/api', () => ({ createBullBoard: jest.fn() }), { virtual: true });
jest.mock('@bull-board/api/bullMQAdapter', () => ({ BullMQAdapter: jest.fn() }), { virtual: true });
jest.mock('@bull-board/express', () => ({ ExpressAdapter: jest.fn().mockImplementation(() => ({ setBasePath: jest.fn(), getRouter: jest.fn().mockReturnValue((req, res, next) => next()) })) }), { virtual: true });
jest.mock('../../../queues', () => ({ queues: [] }));
jest.mock('../../../workers', () => ({ initWorkers: jest.fn() }));

// Mock Services to simplify DB mocks
jest.mock('../../../services/audit.service', () => ({ log: jest.fn() }));
jest.mock('../../../services/notification.service', () => ({ sendToRole: jest.fn() }));

const app = require('../../../index');

describe('Debt Routes Integration', () => {
    let adminToken;

    beforeAll(() => {
        adminToken = jwt.sign(
            { id: 1, role: 'admin', organization_id: 10 },
            'test-secret-key',
            { expiresIn: '1h' }
        );
    });

    beforeEach(() => {
        mockDatabase.mockQuery.mockReset();
        mockDatabase.mockQuery.mockResolvedValue({ info: 'default fallback', rows: [] });
    });

    describe('GET /api/debt/customers/:id/debt', () => {
        it('should return debt details for a customer', async () => {
            // 1. Auth middleware (get user)
            mockDatabase.mockQuery.mockResolvedValueOnce({
                rows: [{ id: 1, role: 'admin', organization_id: 10, active: true, org_active: true }]
            });

            // 2. Total Debt Query
            mockDatabase.mockQuery.mockResolvedValueOnce({
                rows: [{
                    customer_id: 123,
                    customer_name: 'Client',
                    total_debt: 500.00,
                    unpaid_orders: 2
                }]
            });

            // 3. Last Payment Query
            mockDatabase.mockQuery.mockResolvedValueOnce({
                rows: [{ created_at: new Date(), amount: 100.00 }]
            });

            const res = await request(app)
                .get('/api/debt/customers/123/debt')
                .set('Authorization', `Bearer ${adminToken}`);

            expect(res.status).toBe(200);
            expect(res.body.total_debt).toBe(500.00);
            expect(res.body.last_payment_amount).toBe(100.00);
        });
    });

    describe('POST /api/debt/debt-payments', () => {
        it('should record a debt payment successfully', async () => {
            // 1. Auth middleware
            mockDatabase.mockQuery.mockResolvedValueOnce({
                rows: [{ id: 1, role: 'admin', organization_id: 10, active: true, org_active: true }]
            });

            // 2. initial getCustomerDebt (Total Debt Query)
            mockDatabase.mockQuery.mockResolvedValueOnce({
                rows: [{ total_debt: 500.00, customer_name: 'Client' }]
            });
            // 3. initial getCustomerDebt (Last Payment Query)
            mockDatabase.mockQuery.mockResolvedValueOnce({ rows: [] });

            // 4. BEGIN (Transaction)
            mockDatabase.mockQuery.mockResolvedValueOnce({ rows: [] });

            // 5. Insert Debt Payment
            mockDatabase.mockQuery.mockResolvedValueOnce({
                rows: [{ id: 999, amount: 250.00 }]
            });

            // 6. Get Unpaid Orders (Lock/Select)
            mockDatabase.mockQuery.mockResolvedValueOnce({
                rows: [
                    { id: 101, total: 200.00, amount_paid: 0.00, due: 200.00 },
                    { id: 102, total: 300.00, amount_paid: 0.00, due: 300.00 }
                ]
            });

            // 7. Update Order 101 (Full payment 200)
            mockDatabase.mockQuery.mockResolvedValueOnce({ rows: [] });

            // 8. Update Order 102 (Partial payment 50)
            mockDatabase.mockQuery.mockResolvedValueOnce({ rows: [] });

            // 9. COMMIT
            mockDatabase.mockQuery.mockResolvedValueOnce({ rows: [] });

            // 10. new getCustomerDebt (Total Debt Query)
            mockDatabase.mockQuery.mockResolvedValueOnce({
                rows: [{ total_debt: 250.00, customer_name: 'Client' }]
            });
            // 11. new getCustomerDebt (Last Payment Query)
            mockDatabase.mockQuery.mockResolvedValueOnce({ rows: [] });

            const paymentData = {
                customer_id: '123e4567-e89b-12d3-a456-426614174000',
                amount: 250.00,
                payment_type: 'cash',
                note: 'Payment test'
            };

            const res = await request(app)
                .post('/api/debt/debt-payments')
                .set('Authorization', `Bearer ${adminToken}`)
                .send(paymentData);

            expect(res.status).toBe(201);
            expect(res.body.payment.id).toBe(999);
            expect(res.body.new_debt).toBe(250.00);
        });

        it('should fail if amount exceeds debt', async () => {
            // 1. Auth middleware
            mockDatabase.mockQuery.mockResolvedValueOnce({
                rows: [{ id: 1, role: 'admin', organization_id: 10, active: true, org_active: true }]
            });

            // 2. getCustomerDebt (Total Debt Query)
            mockDatabase.mockQuery.mockResolvedValueOnce({
                rows: [{ total_debt: 100.00, customer_name: 'Client' }]
            });
            // 3. Last Payment
            mockDatabase.mockQuery.mockResolvedValueOnce({ rows: [] });

            const res = await request(app)
                .post('/api/debt/debt-payments')
                .set('Authorization', `Bearer ${adminToken}`)
                .send({
                    customer_id: '123e4567-e89b-12d3-a456-426614174000',
                    amount: 200.00, // Exceeds 100
                    payment_type: 'cash'
                });

            expect(res.status).toBe(400);
            expect(res.body.error).toContain('supérieur à la dette');
        });
    });
});
