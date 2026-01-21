const emailWorker = require('./email.worker');
const reportWorker = require('./report.worker');
const cleanupWorker = require('./cleanup.worker');
const recurringWorker = require('./recurring.worker');
const logger = require('../config/logger');

const initWorkers = () => {
    logger.info('Workers initialized');
    // Les workers démarrent automatiquement à l'instanciation
};

module.exports = {
    initWorkers,
    emailWorker,
    reportWorker,
    cleanupWorker,
    recurringWorker
};
