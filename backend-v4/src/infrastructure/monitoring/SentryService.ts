/**
 * Infrastructure: Sentry Service
 * Service de tracking d'erreurs et performance monitoring
 */
export interface SentryConfig {
  dsn: string;
  environment: string;
  release?: string;
  tracesSampleRate?: number;
}

export class SentryService {
  private static instance: SentryService;
  private initialized = false;

  private constructor() {}

  static getInstance(): SentryService {
    if (!SentryService.instance) {
      SentryService.instance = new SentryService();
    }
    return SentryService.instance;
  }

  /**
   * Initialiser Sentry
   */
  initialize(config?: SentryConfig): void {
    if (this.initialized) {
      console.warn('[Sentry] Already initialized');
      return;
    }

    const dsn = config?.dsn || process.env.SENTRY_DSN;
    if (!dsn) {
      console.warn('[Sentry] No DSN provided, skipping initialization');
      return;
    }

    console.log('[Sentry] Initializing...');

    // TODO: Implémenter l'initialisation réelle avec @sentry/node
    // const Sentry = require('@sentry/node');
    // const Tracing = require('@sentry/tracing');
    //
    // Sentry.init({
    //   dsn,
    //   environment: config?.environment || process.env.NODE_ENV || 'development',
    //   release: config?.release || process.env.npm_package_version,
    //   tracesSampleRate: config?.tracesSampleRate || 0.1,
    //   integrations: [
    //     new Sentry.Integrations.Http({ tracing: true }),
    //     new Tracing.Integrations.Express(),
    //     new Tracing.Integrations.Postgres(),
    //   ],
    // });

    this.initialized = true;
    console.log('[Sentry] Initialized successfully');
  }

  /**
   * Capturer une exception
   */
  captureException(error: Error, context?: Record<string, any>): void {
    if (!this.initialized) return;

    console.error('[Sentry] Capturing exception:', error.message);

    // TODO: Implémenter la capture réelle
    // const Sentry = require('@sentry/node');
    // Sentry.captureException(error, {
    //   extra: context,
    // });
  }

  /**
   * Capturer un message
   */
  captureMessage(message: string, level: 'info' | 'warning' | 'error' = 'info'): void {
    if (!this.initialized) return;

    console.log(`[Sentry] Capturing message (${level}):`, message);

    // TODO: Implémenter la capture réelle
    // const Sentry = require('@sentry/node');
    // Sentry.captureMessage(message, level);
  }

  /**
   * Définir le contexte utilisateur
   */
  setUser(user: { id: string; email?: string; username?: string }): void {
    if (!this.initialized) return;

    // TODO: Implémenter le set user réel
    // const Sentry = require('@sentry/node');
    // Sentry.setUser(user);
  }

  /**
   * Définir des tags
   */
  setTag(key: string, value: string): void {
    if (!this.initialized) return;

    // TODO: Implémenter le set tag réel
    // const Sentry = require('@sentry/node');
    // Sentry.setTag(key, value);
  }

  /**
   * Définir un contexte
   */
  setContext(name: string, context: Record<string, any>): void {
    if (!this.initialized) return;

    // TODO: Implémenter le set context réel
    // const Sentry = require('@sentry/node');
    // Sentry.setContext(name, context);
  }

  /**
   * Démarrer une transaction (performance monitoring)
   */
  startTransaction(name: string, op: string): any {
    if (!this.initialized) return null;

    console.log(`[Sentry] Starting transaction: ${name} (${op})`);

    // TODO: Implémenter la transaction réelle
    // const Sentry = require('@sentry/node');
    // return Sentry.startTransaction({ name, op });

    // Mock transaction
    return {
      finish: () => console.log(`[Sentry] Transaction finished: ${name}`),
      setStatus: (status: string) => {},
      setTag: (key: string, value: string) => {},
    };
  }

  /**
   * Middleware Express pour Sentry
   */
  getRequestHandler(): any {
    if (!this.initialized) {
      return (req: any, res: any, next: any) => next();
    }

    // TODO: Implémenter le handler réel
    // const Sentry = require('@sentry/node');
    // return Sentry.Handlers.requestHandler();

    return (req: any, res: any, next: any) => next();
  }

  /**
   * Middleware Express pour les erreurs Sentry
   */
  getErrorHandler(): any {
    if (!this.initialized) {
      return (err: any, req: any, res: any, next: any) => next(err);
    }

    // TODO: Implémenter le handler réel
    // const Sentry = require('@sentry/node');
    // return Sentry.Handlers.errorHandler();

    return (err: any, req: any, res: any, next: any) => {
      this.captureException(err, {
        url: req.url,
        method: req.method,
        userId: req.user?.id,
      });
      next(err);
    };
  }

  /**
   * Helpers pour types d'erreurs spécifiques
   */
  captureAuthError(error: Error, userId?: string): void {
    this.setContext('auth', { userId });
    this.captureException(error);
  }

  capturePaymentError(error: Error, paymentData: any): void {
    this.setContext('payment', paymentData);
    this.captureException(error);
  }

  captureDeliveryError(error: Error, deliveryId: string): void {
    this.setContext('delivery', { deliveryId });
    this.captureException(error);
  }

  captureOrderError(error: Error, orderId: string): void {
    this.setContext('order', { orderId });
    this.captureException(error);
  }

  /**
   * Flush events (utile avant shutdown)
   */
  async flush(timeout: number = 2000): Promise<boolean> {
    if (!this.initialized) return true;

    console.log('[Sentry] Flushing events...');

    // TODO: Implémenter le flush réel
    // const Sentry = require('@sentry/node');
    // return await Sentry.flush(timeout);

    return true;
  }
}

// Export singleton instance
export const sentry = SentryService.getInstance();
