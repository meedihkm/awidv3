const request = require('supertest');
const mockDatabase = require('../../mocks/database.mock');

// Mock dependencies BEFORE importing app
jest.mock('../../../config/database', () => mockDatabase.mockPool);
jest.mock('bcryptjs', () => ({
    compare: jest.fn().mockResolvedValue(true), // Toujours valide pour ce test
    hash: jest.fn().mockResolvedValue('hashed_password')
}));

// Mock Sentry config to retrieve the mock object with Handlers
jest.mock('../../../config/sentry', () => require('../../mocks/sentry.mock'));

// Import dynamique de l'app pour que les mocks soient pris en compte
const app = require('../../../index');

describe('Auth Routes Integration', () => {
    beforeEach(() => {
        mockDatabase.mockQuery.mockReset();
    });

    describe('POST /api/auth/login', () => {
        it('devrait retourner un token pour des identifiants valides', async () => {
            // Mock user found
            mockDatabase.mockQuery.mockResolvedValueOnce({
                rows: [{
                    id: 1,
                    email: 'test@awid.com',
                    password: 'hashed_password', // Match mock bcrypt
                    organization_id: 1,
                    role: 'admin',
                    active: true,
                    org_active: true // Necessary for login validation
                }]
            });

            // Mock audit log insert (qui peut arriver après)
            mockDatabase.mockQuery.mockResolvedValueOnce({});
            // Save refresh token
            mockDatabase.mockQuery.mockResolvedValueOnce({});

            const res = await request(app)
                .post('/api/auth/login')
                .send({
                    email: 'test@awid.com',
                    password: 'password123'
                });

            if (res.status === 403) {
                console.error('Login Failed 403:', res.body);
            }

            expect(res.status).toBe(200);
            // auth.routes.js: res.json({ success: true, accessToken, ... })
            // So expects 'accessToken'
            expect(res.body).toHaveProperty('accessToken');
            expect(res.body.user).toHaveProperty('email', 'test@awid.com');
        });

        it('devrait retourner 401 si utilisateur non trouvé', async () => {
            // Mock empty result
            mockDatabase.mockQuery.mockResolvedValueOnce({ rows: [] });
            // Audit log failed login
            mockDatabase.mockQuery.mockResolvedValueOnce({});

            const res = await request(app)
                .post('/api/auth/login')
                .send({
                    email: 'unknown@awid.com',
                    password: 'password123'
                });

            expect(res.status).toBe(401);
            // "Identifiants incorrects" is returned by code
            expect(res.body).toHaveProperty('error', 'Identifiants incorrects');
        });
    });
});
