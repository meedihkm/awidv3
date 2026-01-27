/**
 * Infrastructure: Winston Logger
 * Service de logging structuré avec rotation
 */
import path from 'path';
import winston from 'winston';

export class WinstonLogger {
  private static instance: WinstonLogger;
  private logger: winston.Logger;

  private constructor() {
    const logLevel = process.env.LOG_LEVEL || 'info';
    const logDir = process.env.LOG_DIR || 'logs';

    this.logger = winston.createLogger({
      level: logLevel,
      format: winston.format.combine(
        winston.format.timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }),
        winston.format.errors({ stack: true }),
        winston.format.splat(),
        winston.format.json()
      ),
      defaultMeta: {
        service: 'awid-backend',
        environment: process.env.NODE_ENV || 'development',
      },
      transports: [
        // Console transport (development)
        new winston.transports.Console({
          format: winston.format.combine(
            winston.format.colorize(),
            winston.format.printf(({ timestamp, level, message, ...meta }) => {
              let metaStr = '';
              if (Object.keys(meta).length > 0) {
                metaStr = `\n${JSON.stringify(meta, null, 2)}`;
              }
              return `${timestamp} [${level}]: ${message}${metaStr}`;
            })
          ),
        }),

        // File transport - Error logs
        new winston.transports.File({
          filename: path.join(logDir, 'error.log'),
          level: 'error',
          maxsize: 10485760, // 10MB
          maxFiles: 5,
        }),

        // File transport - Combined logs
        new winston.transports.File({
          filename: path.join(logDir, 'combined.log'),
          maxsize: 10485760, // 10MB
          maxFiles: 10,
        }),

        // File transport - Access logs
        new winston.transports.File({
          filename: path.join(logDir, 'access.log'),
          level: 'http',
          maxsize: 10485760, // 10MB
          maxFiles: 7,
        }),
      ],
      exceptionHandlers: [
        new winston.transports.File({
          filename: path.join(logDir, 'exceptions.log'),
        }),
      ],
      rejectionHandlers: [
        new winston.transports.File({
          filename: path.join(logDir, 'rejections.log'),
        }),
      ],
    });

    // Don't log to console in production
    if (process.env.NODE_ENV === 'production') {
      this.logger.remove(this.logger.transports[0]);
    }
  }

  static getInstance(): WinstonLogger {
    if (!WinstonLogger.instance) {
      WinstonLogger.instance = new WinstonLogger();
    }
    return WinstonLogger.instance;
  }

  // Log methods
  error(message: string, meta?: any): void {
    this.logger.error(message, meta);
  }

  warn(message: string, meta?: any): void {
    this.logger.warn(message, meta);
  }

  info(message: string, meta?: any): void {
    this.logger.info(message, meta);
  }

  http(message: string, meta?: any): void {
    this.logger.http(message, meta);
  }

  debug(message: string, meta?: any): void {
    this.logger.debug(message, meta);
  }

  // Structured logging methods
  logRequest(req: any): void {
    this.http('HTTP Request', {
      method: req.method,
      url: req.url,
      ip: req.ip,
      userAgent: req.get('user-agent'),
      userId: req.user?.id,
      organizationId: req.user?.organizationId,
    });
  }

  logResponse(req: any, res: any, duration: number): void {
    this.http('HTTP Response', {
      method: req.method,
      url: req.url,
      statusCode: res.statusCode,
      duration: `${duration}ms`,
      userId: req.user?.id,
    });
  }

  logDatabaseQuery(query: string, duration: number, params?: any): void {
    this.debug('Database Query', {
      query,
      duration: `${duration}ms`,
      params,
    });
  }

  logCacheHit(key: string): void {
    this.debug('Cache Hit', { key });
  }

  logCacheMiss(key: string): void {
    this.debug('Cache Miss', { key });
  }

  logJobStarted(jobId: string, jobType: string): void {
    this.info('Job Started', { jobId, jobType });
  }

  logJobCompleted(jobId: string, jobType: string, duration: number): void {
    this.info('Job Completed', {
      jobId,
      jobType,
      duration: `${duration}ms`,
    });
  }

  logJobFailed(jobId: string, jobType: string, error: Error): void {
    this.error('Job Failed', {
      jobId,
      jobType,
      error: error.message,
      stack: error.stack,
    });
  }

  logWebSocketConnection(socketId: string, userId: string): void {
    this.info('WebSocket Connected', { socketId, userId });
  }

  logWebSocketDisconnection(socketId: string, reason: string): void {
    this.info('WebSocket Disconnected', { socketId, reason });
  }

  logSecurityEvent(event: string, details: any): void {
    this.warn('Security Event', {
      event,
      ...details,
    });
  }

  logPerformanceMetric(metric: string, value: number, unit: string): void {
    this.info('Performance Metric', {
      metric,
      value,
      unit,
    });
  }

  // Get the underlying Winston logger
  getLogger(): winston.Logger {
    return this.logger;
  }
}

// Export singleton instance
export const logger = WinstonLogger.getInstance();
