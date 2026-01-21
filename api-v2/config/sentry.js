/**
 * Configuration Sentry pour AWID API v2
 * Gestion des erreurs centralisée et APM
 * NOTE: Profiling désactivé pour compatibilité Vercel serverless
 */

const Sentry = require('@sentry/node');

// Flag pour vérifier si Sentry est initialisé
let sentryInitialized = false;

// Stub handlers pour quand Sentry n'est pas configuré
const stubHandlers = {
    requestHandler: () => (req, res, next) => next(),
    tracingHandler: () => (req, res, next) => next(),
    errorHandler: () => (err, req, res, next) => next(err),
};

// Initialisation de Sentry
const initSentry = (app) => {
    // Ne pas initialiser si pas de DSN (ex: dev local sans monitoring)
    if (!process.env.SENTRY_DSN) {
        console.log('[Monitoring] SENTRY_DSN non défini - Monitoring désactivé');
        return;
    }

    try {
        Sentry.init({
            dsn: process.env.SENTRY_DSN,
            environment: process.env.NODE_ENV || 'development',
            integrations: [
                // enable HTTP calls tracing
                new Sentry.Integrations.Http({ tracing: true }),
                // enable Express.js middleware tracing
                new Sentry.Integrations.Express({ app }),
                // NOTE: nodeProfilingIntegration désactivé - incompatible avec Vercel serverless
            ],
            // Performance Monitoring
            tracesSampleRate: process.env.NODE_ENV === 'production' ? 0.2 : 1.0,

            // Filtrage des données sensibles avant envoi
            beforeSend(event) {
                if (event.request) {
                    // Filtrer les headers sensibles
                    if (event.request.headers) {
                        delete event.request.headers['authorization'];
                        delete event.request.headers['x-super-admin-key'];
                    }

                    // Filtrer les body sensibles
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

        sentryInitialized = true;
        console.log('[Monitoring] Sentry initialisé');
    } catch (error) {
        console.error('[Monitoring] Erreur initialisation Sentry:', error.message);
    }
};

// Getter pour les Handlers (retourne stubs si Sentry non initialisé)
const getHandlers = () => {
    if (sentryInitialized && Sentry.Handlers) {
        return Sentry.Handlers;
    }
    return stubHandlers;
};

module.exports = { initSentry, Sentry, getHandlers };

