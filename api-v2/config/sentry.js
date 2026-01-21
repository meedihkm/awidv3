/**
 * Configuration Sentry pour AWID API v2
 * Gestion des erreurs centralisée et APM
 */

const Sentry = require('@sentry/node');
const { nodeProfilingIntegration } = require('@sentry/profiling-node');

// Initialisation de Sentry
const initSentry = (app) => {
    // Ne pas initialiser si pas de DSN (ex: dev local sans monitoring)
    if (!process.env.SENTRY_DSN) {
        console.warn('[Monitoring] SENTRY_DSN non défini - Monitoring désactivé');
        return;
    }

    Sentry.init({
        dsn: process.env.SENTRY_DSN,
        environment: process.env.NODE_ENV || 'development',
        integrations: [
            // enable HTTP calls tracing
            new Sentry.Integrations.Http({ tracing: true }),
            // enable Express.js middleware tracing
            new Sentry.Integrations.Express({ app }),
            nodeProfilingIntegration(),
        ],
        // Performance Monitoring
        tracesSampleRate: process.env.NODE_ENV === 'production' ? 0.2 : 1.0, // Capture 20% en prod, 100% en dev
        // Profiling
        profilesSampleRate: 1.0, // Profiling pour les transactions tracées

        // Filtrage des données sensibles avant envoi
        beforeSend(event) {
            if (event.request) {
                // Filtrer les headers sensibles
                if (event.request.headers) {
                    delete event.request.headers['authorization'];
                    delete event.request.headers['x-super-admin-key'];
                }

                // Filtrer les body sensibles (mots de passe, etc)
                // Note: Sentry le fait souvent par défaut, mais double sécurité
                if (event.request.data) {
                    try {
                        const data = typeof event.request.data === 'string'
                            ? JSON.parse(event.request.data)
                            : event.request.data;

                        if (data.password) data.password = '[REDACTED]';
                        if (data.token) data.token = '[REDACTED]';
                        if (data.creditCard) data.creditCard = '[REDACTED]';

                        event.request.data = JSON.stringify(data);
                    } catch (e) {
                        // Ignorer erreurs de parsing
                    }
                }
            }
            return event;
        },
    });

    console.log('[Monitoring] Sentry initialisé');
};

module.exports = { initSentry, Sentry };
