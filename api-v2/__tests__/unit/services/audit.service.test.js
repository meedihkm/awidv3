const { logAudit, getAuditLogs } = require('../../../services/audit.service');
const { mockQuery } = require('../../mocks/database.mock');

jest.mock('../../../config/database', () => require('../../mocks/database.mock').mockPool);

describe('Audit Service', () => {
    describe('logAudit', () => {
        it('devrait insérer un log d\'audit avec les infos système si pas de req', async () => {
            await logAudit('TEST_ACTION', 1, 10, { info: 'test' });

            expect(mockQuery).toHaveBeenCalledTimes(1);
            // Vérifier que ip et userAgent sont 'system'
            const args = mockQuery.mock.calls[0][1];
            expect(args[4]).toBe('system');
            expect(args[5]).toBe('system');
        });

        it('devrait extraire ip et user-agent de la requête', async () => {
            const mockReq = {
                headers: {
                    'x-forwarded-for': '1.2.3.4',
                    'user-agent': 'TestAgent/1.0'
                }
            };

            await logAudit('TEST_ACTION', 1, 10, {}, mockReq);

            expect(mockQuery).toHaveBeenCalledTimes(1);
            const args = mockQuery.mock.calls[0][1];
            expect(args[4]).toBe('1.2.3.4');
            expect(args[5]).toBe('TestAgent/1.0');
        });

        it('ne devrait pas planter si l\'insertion échoue (catch error non bloquant)', async () => {
            mockQuery.mockRejectedValueOnce(new Error('DB Error'));

            // Ne doit pas throw
            await expect(logAudit('TEST', 1, 1)).resolves.not.toThrow();
        });
    });

    describe('getAuditLogs', () => {
        it('devrait construire la requête SQL correcte sans filtres', async () => {
            // Mock Count Query then Data Query
            mockQuery
                .mockResolvedValueOnce({ rows: [{ count: 0 }] }) // Count
                .mockResolvedValueOnce({ rows: [] });            // Data

            await getAuditLogs(10);

            // Check calls (Count is first, Data is second)
            expect(mockQuery).toHaveBeenCalledTimes(2);

            const dataQuery = mockQuery.mock.calls[1][0];
            const dataParams = mockQuery.mock.calls[1][1];

            expect(dataQuery).toContain('WHERE al.organization_id = $1');
            expect(dataParams[0]).toBe(10);
        });

        it('devrait ajouter les filtres optionnels', async () => {
            // Mock Count Query then Data Query
            mockQuery
                .mockResolvedValueOnce({ rows: [{ count: 0 }] })
                .mockResolvedValueOnce({ rows: [] });

            await getAuditLogs(10, { action: 'LOGIN', userId: 99 });

            // Check calls
            const dataQuery = mockQuery.mock.calls[1][0];
            expect(dataQuery).toContain('action = $');
            expect(dataQuery).toContain('user_id = $');
        });
    });
});
