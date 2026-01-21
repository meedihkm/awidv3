const jwt = require('jsonwebtoken');
const { authenticate, requireAdmin } = require('../../../middleware/auth');
const { mockQuery } = require('../../mocks/database.mock');

// Mock dependencies
jest.mock('jsonwebtoken');
jest.mock('../../../config/database', () => require('../../mocks/database.mock').mockPool);
jest.mock('../../../config/jwt', () => ({
    jwtSecret: 'test-secret',
    superAdminKey: 'super-secret-key-123'
}));

describe('Auth Middleware', () => {
    let req, res, next;

    // Setup de base pour chaque test
    beforeEach(() => {
        req = {
            headers: {},
        };
        res = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        };
        next = jest.fn();
        mockQuery.mockReset();
        jwt.verify.mockReset();
    });

    describe('authenticate', () => {
        it('devrait retourner 401 si aucun header authorization', async () => {
            await authenticate(req, res, next);
            expect(res.status).toHaveBeenCalledWith(401);
            expect(res.json).toHaveBeenCalledWith({ error: 'Token manquant' });
        });

        it('devrait retourner 401 si le format du header est incorrect', async () => {
            req.headers.authorization = 'Basic token';
            await authenticate(req, res, next);
            expect(res.status).toHaveBeenCalledWith(401);
            expect(res.json).toHaveBeenCalledWith({ error: 'Token manquant' });
        });

        it('devrait retourner 401 si le token est invalide', async () => {
            req.headers.authorization = 'Bearer validtokenbutfails';
            jwt.verify.mockImplementation(() => {
                const error = new Error('invalid');
                error.name = 'JsonWebTokenError';
                throw error;
            });

            await authenticate(req, res, next);
            expect(res.status).toHaveBeenCalledWith(401);
            expect(res.json).toHaveBeenCalledWith({ error: 'Token invalide' }); // Message spécifique capturé
        });

        it('devrait retourner 401 si le token est expiré', async () => {
            req.headers.authorization = 'Bearer expiredtoken';
            jwt.verify.mockImplementation(() => {
                const error = new Error('expired');
                error.name = 'TokenExpiredError';
                throw error;
            });

            await authenticate(req, res, next);
            expect(res.status).toHaveBeenCalledWith(401);
            expect(res.json).toHaveBeenCalledWith({ error: 'Token expiré' });
        });

        it('devrait rejeter un utilisateur non trouvé en DB', async () => {
            req.headers.authorization = 'Bearer validtoken';
            jwt.verify.mockReturnValue({ id: 1 });
            mockQuery.mockResolvedValueOnce({ rows: [] });

            await authenticate(req, res, next);
            expect(res.status).toHaveBeenCalledWith(401);
            expect(res.json).toHaveBeenCalledWith({ error: 'Utilisateur non trouvé' });
        });

        it('devrait rejeter un utilisateur inactif', async () => {
            req.headers.authorization = 'Bearer validtoken';
            jwt.verify.mockReturnValue({ id: 1 });
            mockQuery.mockResolvedValueOnce({
                rows: [{ id: 1, active: false }]
            });

            await authenticate(req, res, next);
            expect(res.status).toHaveBeenCalledWith(403);
            expect(res.json).toHaveBeenCalledWith({ error: 'Compte désactivé' });
        });

        it('devrait authentifier avec succès', async () => {
            req.headers.authorization = 'Bearer validtoken';
            const user = { id: 1, role: 'admin', active: true };
            jwt.verify.mockReturnValue({ id: 1 });
            mockQuery.mockResolvedValueOnce({ rows: [user] });

            await authenticate(req, res, next);

            expect(req.user).toBeDefined();
            expect(req.user.id).toBe(1);
            expect(next).toHaveBeenCalled();
        });
    });

    describe('requireAdmin', () => {
        it('devrait laisser passer un admin', () => {
            req.user = { role: 'admin' };
            requireAdmin(req, res, next);
            expect(next).toHaveBeenCalled();
        });

        it('devrait bloquer un non-admin', () => {
            req.user = { role: 'kitchen' };
            requireAdmin(req, res, next);
            expect(res.status).toHaveBeenCalledWith(403);
            expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ error: expect.stringContaining('Accès admin requis') }));
        });
    });
});
