const creditService = require('../../../services/credit.service');
const db = require('../../../config/database');
const notificationService = require('../../../services/notification.service');

// Mock dependencies
jest.mock('../../../config/database');
jest.mock('../../../services/notification.service', () => ({
    sendToRole: jest.fn(),
}));
jest.mock('../../../config/logger', () => ({
    info: jest.fn(),
    error: jest.fn(),
}));

describe('CreditService', () => {
    beforeEach(() => {
        jest.clearAllMocks();
    });

    describe('checkCreditStatus', () => {
        it('should return no_limit if no credit limit set', async () => {
            // Mock db response
            db.query.mockResolvedValue({
                rows: [{ credit_limit: null, current_debt: 500 }]
            });

            const result = await creditService.checkCreditStatus('cust1', 'org1');
            expect(result).toEqual({ status: 'no_limit', level: null, debt: 500 });
        });

        it('should return ok if debt is low', async () => {
            db.query.mockResolvedValue({
                rows: [{ credit_limit: 1000, current_debt: 500 }]
            });

            const result = await creditService.checkCreditStatus('cust1', 'org1');
            expect(result.status).toBe('ok');
            expect(result.ratio).toBe(50);
            expect(result.level).toBeNull();
        });

        it('should return approaching (info) if debt >= 80%', async () => {
            db.query.mockResolvedValue({
                rows: [{ credit_limit: 1000, current_debt: 800 }]
            });

            const result = await creditService.checkCreditStatus('cust1', 'org1');
            expect(result.status).toBe('approaching');
            expect(result.level).toBe('info');
            expect(result.ratio).toBe(80);
        });

        it('should return over_limit (warning) if debt >= 100%', async () => {
            db.query.mockResolvedValue({
                rows: [{ credit_limit: 1000, current_debt: 1000 }]
            });

            const result = await creditService.checkCreditStatus('cust1', 'org1');
            expect(result.status).toBe('over_limit');
            expect(result.level).toBe('warning');
            expect(result.ratio).toBe(100);
        });

        it('should return critical (urgent) if debt >= 120%', async () => {
            db.query.mockResolvedValue({
                rows: [{ credit_limit: 1000, current_debt: 1200 }]
            });

            const result = await creditService.checkCreditStatus('cust1', 'org1');
            expect(result.status).toBe('critical');
            expect(result.level).toBe('urgent');
            expect(result.ratio).toBe(120);
        });
    });

    describe('checkAndNotify', () => {
        it('should not notify if status is ok', async () => {
            // Mock checkCreditStatus via db mock (since it calls db)
            db.query.mockResolvedValueOnce({
                rows: [{ credit_limit: 1000, current_debt: 500 }]
            });

            await creditService.checkAndNotify('cust1', 'org1');
            expect(notificationService.sendToRole).not.toHaveBeenCalled();
        });

        it('should notify if status is approaching', async () => {
            // Mock db query for checkCreditStatus
            db.query.mockResolvedValueOnce({
                rows: [{ credit_limit: 1000, current_debt: 850 }]
            });
            // Mock db query for customer name
            db.query.mockResolvedValueOnce({
                rows: [{ name: 'John Doe' }]
            });

            await creditService.checkAndNotify('cust1', 'org1');

            expect(notificationService.sendToRole).toHaveBeenCalledWith(
                'admin',
                'org1',
                expect.objectContaining({
                    title: '📊 Crédit client',
                    data: expect.objectContaining({
                        type: 'credit_alert',
                        level: 'info',
                        ratio: 85
                    })
                })
            );
        });
    });
});
