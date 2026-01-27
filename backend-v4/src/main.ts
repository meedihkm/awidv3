/**
 * Main Entry Point
 * Point d'entrée de l'application AWID Backend v4
 */
import cors from 'cors';
import express, { Application, NextFunction, Request, Response } from 'express';
import helmet from 'helmet';
import { Server as HTTPServer, createServer } from 'http';
import swaggerJsdoc from 'swagger-jsdoc';
import swaggerUi from 'swagger-ui-express';
import { envConfig } from './config/env.validation';
import { swaggerConfig } from './config/swagger.config';
import { redisConnection } from './infrastructure/cache/RedisConnection';
import { db } from './infrastructure/database/PostgresConnection';
import { logger } from './infrastructure/logging/WinstonLogger';
import { startAllWorkers, stopAllWorkers } from './infrastructure/workers';
import {
  errorHandler,
  notFoundHandler,
} from './presentation/http/middlewares/errorHandler.middleware';
import { generalRateLimiter } from './presentation/http/middlewares/rateLimit.middleware';
import { createV1Routes } from './presentation/http/routes/v1';
import { initializeWebSocket } from './presentation/websocket';

class Server {
  private app: Application;
  private httpServer: HTTPServer;
  private port: number;

  constructor() {
    this.app = express();
    this.httpServer = createServer(this.app);
    this.port = envConfig.PORT;
    this.initializeMiddlewares();
    this.initializeSwagger();
    this.initializeRoutes();
    this.initializeErrorHandling();
  }

  private initializeMiddlewares(): void {
    // Security
    this.app.use(helmet());
    this.app.use(
      cors({
        origin: envConfig.NODE_ENV === 'production' ? ['https://awid.dz'] : '*',
        credentials: true,
      })
    );

    // Body parsing
    this.app.use(express.json({ limit: '10mb' }));
    this.app.use(express.urlencoded({ extended: true, limit: '10mb' }));

    // Rate limiting
    this.app.use(generalRateLimiter);

    // Request logging
    this.app.use((req: Request, _res: Response, next: NextFunction) => {
      logger.info(`${req.method} ${req.path}`, {
        ip: req.ip,
        userAgent: req.headers['user-agent'],
      });
      next();
    });
  }

  private initializeSwagger(): void {
    const swaggerSpec = swaggerJsdoc(swaggerConfig);

    // Swagger UI
    this.app.use(
      '/api/docs',
      swaggerUi.serve,
      swaggerUi.setup(swaggerSpec, {
        customCss: '.swagger-ui .topbar { display: none }',
        customSiteTitle: 'AWID API Documentation',
      })
    );

    // Swagger JSON
    this.app.get('/api/docs.json', (_req: Request, res: Response) => {
      res.setHeader('Content-Type', 'application/json');
      res.send(swaggerSpec);
    });

    logger.info('📚 Swagger documentation initialized at /api/docs');
  }

  private initializeRoutes(): void {
    // Root endpoint
    this.app.get('/', (_req: Request, res: Response) => {
      res.json({
        name: 'AWID Backend API',
        version: '4.0.0',
        status: 'running',
        environment: envConfig.NODE_ENV,
        documentation: '/api/docs',
      });
    });

    // Simple health check for Docker
    this.app.get('/health', (_req: Request, res: Response) => {
      res.status(200).json({ status: 'ok' });
    });

    // Detailed health check endpoint
    this.app.get('/api/health', async (_req: Request, res: Response) => {
      const dbHealth = await db.healthCheck();
      const redisHealth = await redisConnection.healthCheck();

      const isHealthy = dbHealth.status === 'healthy' && redisHealth.status === 'healthy';

      res.status(isHealthy ? 200 : 503).json({
        status: isHealthy ? 'ok' : 'degraded',
        timestamp: new Date().toISOString(),
        uptime: process.uptime(),
        database: dbHealth,
        redis: redisHealth,
      });
    });

    // API routes
    this.app.use(`/api/${envConfig.API_VERSION}`, createV1Routes());
  }

  private initializeErrorHandling(): void {
    // 404 handler
    this.app.use(notFoundHandler);

    // Global error handler
    this.app.use(errorHandler);
  }

  public async start(): Promise<void> {
    try {
      // Connect to database
      logger.info('🔌 Connecting to database...');
      await db.connect();
      logger.info('✅ Database connected successfully');

      // Run migrations
      logger.info('🔄 Running database migrations...');
      const { runMigrations } = await import('./infrastructure/database/migrate');
      await runMigrations();
      logger.info('✅ Migrations completed successfully');

      // Connect to Redis
      logger.info('🔌 Connecting to Redis...');
      await redisConnection.connect();
      logger.info('✅ Redis connected successfully');

      // Start workers
      logger.info('🔧 Starting background workers...');
      await startAllWorkers();
      logger.info('✅ Workers started successfully');

      // Initialize WebSocket
      logger.info('🔌 Initializing WebSocket...');
      initializeWebSocket(this.httpServer);
      logger.info('✅ WebSocket initialized successfully');

      // Start HTTP server
      this.httpServer.listen(this.port, () => {
        logger.info(`
╔════════════════════════════════════════════════════════════╗
║                                                            ║
║   🚀 AWID Backend v4.0 - Server Started                   ║
║                                                            ║
║   Environment: ${envConfig.NODE_ENV.padEnd(44)}║
║   Port:        ${String(envConfig.PORT).padEnd(44)}║
║   API Version: ${envConfig.API_VERSION.padEnd(44)}║
║                                                            ║
║   📍 Health:    http://localhost:${envConfig.PORT}/api/health        ║
║   📚 Docs:      http://localhost:${envConfig.PORT}/api/docs          ║
║   📡 API:       http://localhost:${envConfig.PORT}/api/${envConfig.API_VERSION}            ║
║                                                            ║
╚════════════════════════════════════════════════════════════╝
        `);
      });
    } catch (error) {
      logger.error('❌ Failed to start server:', error);
      process.exit(1);
    }
  }

  public async stop(): Promise<void> {
    logger.info('\n⚠️  Shutting down gracefully...');

    try {
      // Stop workers
      logger.info('🛑 Stopping workers...');
      await stopAllWorkers();
      logger.info('✅ Workers stopped');

      // Disconnect from Redis
      logger.info('🛑 Disconnecting from Redis...');
      await redisConnection.disconnect();
      logger.info('✅ Redis disconnected');

      // Disconnect from database
      logger.info('🛑 Disconnecting from database...');
      await db.disconnect();
      logger.info('✅ Database disconnected');

      // Close HTTP server
      this.httpServer.close(() => {
        logger.info('✅ HTTP server closed');
        process.exit(0);
      });
    } catch (error) {
      logger.error('❌ Error during shutdown:', error);
      process.exit(1);
    }
  }
}

// Create and start server
const server = new Server();

// Handle shutdown signals
process.on('SIGTERM', () => server.stop());
process.on('SIGINT', () => server.stop());

// Handle unhandled errors
process.on('unhandledRejection', (reason, promise) => {
  logger.error('❌ Unhandled Rejection at:', { promise, reason });
  server.stop();
});

process.on('uncaughtException', (error) => {
  logger.error('❌ Uncaught Exception:', error);
  server.stop();
});

// Start server
server.start();
