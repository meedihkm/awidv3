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

describe('E2E: Order & Delivery Flow', () => {
    // User IDs
    const CLIENT_ID = 300;
    const ADMIN_ID = 200;
    const KITCHEN_ID = 400;
    const DELIVERER_ID = 'c1eebc99-9c0b-4ef8-bb6d-6bb9bd380c33';
    const ORG_ID = 100;

    // UUIDs for route validation
    const ORDER_ID = 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11';
    const DELIVERY_ID = 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380b22';

    // Valid Product UUID
    const PROD_UUID = '123e4567-e89b-12d3-a456-426614174000';

    beforeEach(() => {
        mockDatabase.mockQuery.mockReset();
        mockDatabase.mockQuery.mockResolvedValue({ rows: [] }); // Safe default
    });

    it('devrait suivre le cycle: Commande -> Validation -> Cuisine -> Assignation -> Livraison', async () => {
        // ----------------------------------------------------
        // ETAPE 1: Client crée une commande
        // ----------------------------------------------------
        // Mock Auth Token pour Client
        jwt.verify.mockReturnValueOnce({ id: CLIENT_ID, organizationId: ORG_ID });

        mockDatabase.mockQuery
            // 1. Auth: Get User
            .mockResolvedValueOnce({ rows: [{ id: CLIENT_ID, organization_id: ORG_ID, active: true, org_active: true }] })
            // 2. Products Price Check
            .mockResolvedValueOnce({ rows: [{ price: 10 }] })
            // 3. Sequence
            .mockResolvedValueOnce({ rows: [{ last_number: 1 }] })
            // 4. Insert Order
            .mockResolvedValueOnce({ rows: [{ id: ORDER_ID, status: 'pending', total: 10, order_number: 1 }] })
            // 5. Products Price Check (again in loop)
            .mockResolvedValueOnce({ rows: [{ price: 10 }] })
            // 6. Insert Items
            .mockResolvedValueOnce({ rows: [] })
            // 7. Audit Log
            .mockResolvedValueOnce({ rows: [] })
            // 8. Get Items (response)
            .mockResolvedValueOnce({ rows: [{ product_id: PROD_UUID, quantity: 1, price: 10 }] });

        const resClient = await request(app)
            .post('/api/orders')
            .set('Authorization', 'Bearer client_token')
            .send({ items: [{ productId: PROD_UUID, quantity: 1 }] });

        expect(resClient.status).toBe(200);
        expect(resClient.body.data.id).toBe(ORDER_ID);

        // ----------------------------------------------------
        // ETAPE 2: Admin valide la commande (Lock)
        // ----------------------------------------------------
        jwt.verify.mockReturnValueOnce({ id: ADMIN_ID, organizationId: ORG_ID, role: 'admin' });

        mockDatabase.mockQuery
            // 1. Auth: Get User (Admin check)
            .mockResolvedValueOnce({ rows: [{ id: ADMIN_ID, organization_id: ORG_ID, role: 'admin', active: true, org_active: true }] })
            // 2. Check Kitchen Mode (via Org)
            .mockResolvedValueOnce({ rows: [{ kitchen_mode: true }] }) // Active kitchen mode -> result status 'validated'
            // 3. Update Order Status
            .mockResolvedValueOnce({ rows: [] })
            // 4. Audit Log
            .mockResolvedValueOnce({ rows: [] });

        const resAdmin = await request(app)
            .put(`/api/orders/${ORDER_ID}/lock`)
            .set('Authorization', 'Bearer admin_token');

        expect(resAdmin.status).toBe(200);
        expect(resAdmin.body.status).toBe('validated');

        // ----------------------------------------------------
        // ETAPE 3: Cuisine prépare (Validated -> Preparing)
        // ----------------------------------------------------
        jwt.verify.mockReturnValueOnce({ id: KITCHEN_ID, organizationId: ORG_ID, role: 'kitchen' });

        mockDatabase.mockQuery
            // 1. Auth: Get User
            .mockResolvedValueOnce({ rows: [{ id: KITCHEN_ID, organization_id: ORG_ID, role: 'kitchen', active: true, org_active: true }] })
            // 2. Check Order Status
            .mockResolvedValueOnce({ rows: [{ status: 'validated' }] })
            // 3. Update Order
            .mockResolvedValueOnce({ rows: [] })
            // 4. Audit Log
            .mockResolvedValueOnce({ rows: [] });

        const resKitchenPrep = await request(app)
            .put(`/api/orders/${ORDER_ID}/kitchen-status`)
            .set('Authorization', 'Bearer kitchen_token')
            .send({ status: 'preparing' });

        expect(resKitchenPrep.status).toBe(200);

        // ----------------------------------------------------
        // ETAPE 4: Cuisine termine (Preparing -> Ready)
        // ----------------------------------------------------
        jwt.verify.mockReturnValueOnce({ id: KITCHEN_ID, organizationId: ORG_ID, role: 'kitchen' });

        mockDatabase.mockQuery
            // 1. Auth: Get User
            .mockResolvedValueOnce({ rows: [{ id: KITCHEN_ID, organization_id: ORG_ID, role: 'kitchen', active: true, org_active: true }] })
            // 2. Check Order Status
            .mockResolvedValueOnce({ rows: [{ status: 'preparing' }] })
            // 3. Update Order
            .mockResolvedValueOnce({ rows: [] })
            // 4. Audit Log
            .mockResolvedValueOnce({ rows: [] });

        const resKitchenReady = await request(app)
            .put(`/api/orders/${ORDER_ID}/kitchen-status`)
            .set('Authorization', 'Bearer kitchen_token')
            .send({ status: 'ready' });

        expect(resKitchenReady.status).toBe(200);

        // ----------------------------------------------------
        // ETAPE 5: Admin assigne Livreur (Ready -> In Delivery)
        // ----------------------------------------------------
        jwt.verify.mockReturnValueOnce({ id: ADMIN_ID, organizationId: ORG_ID, role: 'admin' });

        mockDatabase.mockQuery
            // 1. Auth: Get User
            .mockResolvedValueOnce({ rows: [{ id: ADMIN_ID, organization_id: ORG_ID, role: 'admin', active: true, org_active: true }] })
            // 2. Select Order (Check if locked/ready)
            .mockResolvedValueOnce({ rows: [{ id: ORDER_ID, status: 'ready' }] })
            // 3. Insert Delivery
            .mockResolvedValueOnce({ rows: [{ id: DELIVERY_ID, status: 'assigned' }] })
            // 4. Update Order (in_delivery)
            .mockResolvedValueOnce({ rows: [] })
            // 5. Audit Log
            .mockResolvedValueOnce({ rows: [] });

        const resAssign = await request(app)
            .post(`/api/orders/${ORDER_ID}/assign`)
            .set('Authorization', 'Bearer admin_token')
            .send({ delivererId: DELIVERER_ID });

        expect(resAssign.status).toBe(200);

        // ----------------------------------------------------
        // ETAPE 6: Livreur livre (In Delivery -> Delivered)
        // ----------------------------------------------------
        jwt.verify.mockReturnValueOnce({ id: DELIVERER_ID, organizationId: ORG_ID, role: 'deliverer' });

        mockDatabase.mockQuery
            // 1. Auth: Get User
            .mockResolvedValueOnce({ rows: [{ id: DELIVERER_ID, organization_id: ORG_ID, role: 'deliverer', active: true, org_active: true }] })
            // 2. Check Delivery Ownership
            .mockResolvedValueOnce({ rows: [{ id: DELIVERY_ID, deliverer_id: DELIVERER_ID }] })
            // 3. Update Delivery
            .mockResolvedValueOnce({ rows: [] })
            // 4. Select Delivery (get Order ID)
            .mockResolvedValueOnce({ rows: [{ order_id: ORDER_ID }] })
            // 5. Update Order (delivered + paid)
            .mockResolvedValueOnce({ rows: [] })
            // 6. Audit Log
            .mockResolvedValueOnce({ rows: [] });

        const resDeliver = await request(app)
            .put(`/api/deliveries/${DELIVERY_ID}/status`)
            .set('Authorization', 'Bearer deliverer_token')
            .send({
                status: 'delivered',
                paymentStatus: 'paid',
                amountCollected: 10
            });

        expect(resDeliver.status).toBe(200);
    });
});
