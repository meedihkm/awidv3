/**
 * Main Entry Point
 * Point d'entrée de l'application AWID Backend v4
 */

console.log('🎬 main.ts: Starting execution...');

import cors from 'cors';
import express, { Application, NextFunction, Request, Response } from 'express';
import helmet from 'helmet';
import { Server as HTTPServer, createServer } from 'http';
import swaggerJsdoc from 'swagger-jsdoc';
import swaggerUi from 'swagger-ui-express';

console.log('✅ main.ts: Basic imports loaded');

import { envConfig } from './config/env.validation';
import { swaggerConfig } from './config/swagger.config';

console.log('✅ main.ts: Config imports loaded');

import { RedisConnection } from './infrastructure/cache/RedisConnection';
import { db } from './infrastructure/database/PostgresConnection';
import { logger } from './infrastructure/logging/WinstonLogger';
import { startAllWorkers, stopAllWorkers } from './infrastructure/workers';

console.log('✅ main.ts: Infrastructure imports loaded');

import {
  errorHandler,
  notFoundHandler,
} from './presentation/http/middlewares/errorHandler.middleware';
import { generalRateLimiter } from './presentation/http/middlewares/rateLimit.middleware';
import { createV1Routes } from './presentation/http/routes/v1';
import { initializeWebSocket } from './presentation/websocket';

console.log('✅ main.ts: All imports loaded successfully');

// Get Redis singleton instance
const redisConnection = RedisConnection.getInstance();

class Server {
  private app: Application;
  private httpServer: HTTPServer;
  private port: number;

  constructor() {
    console.log('🔧 Initializing Server class...');
    this.app = express();
    this.httpServer = createServer(this.app);
    this.port = envConfig.PORT;
    console.log('✅ Server class initialized');

    console.log('🔧 Initializing middlewares...');
    this.initializeMiddlewares();
    console.log('✅ Middlewares initialized');

    console.log('🔧 Initializing Swagger...');
    this.initializeSwagger();
    console.log('✅ Swagger initialized');

    console.log('🔧 Initializing routes...');
    this.initializeRoutes();
    console.log('✅ Routes initialized');

    console.log('🔧 Initializing error handling...');
    this.initializeErrorHandling();
    console.log('✅ Error handling initialized');
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
      console.log('🚀 Starting server...');

      // Connect to database
      console.log('🔌 Connecting to database...');
      logger.info('🔌 Connecting to database...');
      await db.connect();
      console.log('✅ Database connected successfully');
      logger.info('✅ Database connected successfully');

      // Run migrations
      console.log('🔄 Running database migrations...');
      logger.info('🔄 Running database migrations...');
      try {
        const { runMigrations } = await import('./infrastructure/database/migrate');
        await runMigrations();
        console.log('✅ Migrations completed successfully');
        logger.info('✅ Migrations completed successfully');
      } catch (migrationError) {
        console.error('❌ Migration error:', migrationError);
        logger.error('❌ Migration error:', migrationError);
        throw migrationError;
      }

      // Connect to Redis
      console.log('🔌 Connecting to Redis...');
      logger.info('🔌 Connecting to Redis...');
      await redisConnection.connect();
      console.log('✅ Redis connected successfully');
      logger.info('✅ Redis connected successfully');

      // Start workers
      console.log('🔧 Starting background workers...');
      logger.info('🔧 Starting background workers...');
      startAllWorkers();
      console.log('✅ Workers started successfully');
      logger.info('✅ Workers started successfully');

      // Initialize WebSocket
      console.log('🔌 Initializing WebSocket...');
      logger.info('🔌 Initializing WebSocket...');
      initializeWebSocket(this.httpServer);
      console.log('✅ WebSocket initialized successfully');
      logger.info('✅ WebSocket initialized successfully');

      // Start HTTP server
      console.log(`🌐 Starting HTTP server on port ${this.port}...`);
      this.httpServer.listen(this.port, () => {
        const message = `
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
        `;
        console.log(message);
        logger.info(message);
      });
    } catch (error) {
      console.error('❌ Failed to start server:', error);
      logger.error('❌ Failed to start server:', error);

      // Log stack trace
      if (error instanceof Error) {
        console.error('Stack trace:', error.stack);
        logger.error('Stack trace:', error.stack);
      }

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
console.log('🎬 Creating server instance...');
const server = new Server();
console.log('✅ Server instance created');

// Handle shutdown signals
process.on('SIGTERM', () => {
  console.log('⚠️  Received SIGTERM signal');
  server.stop();
});

process.on('SIGINT', () => {
  console.log('⚠️  Received SIGINT signal');
  server.stop();
});

// Handle unhandled errors
process.on('unhandledRejection', (reason, promise) => {
  console.error('❌ Unhandled Rejection at:', { promise, reason });
  logger.error('❌ Unhandled Rejection at:', { promise, reason });
  server.stop();
});

process.on('uncaughtException', (error) => {
  console.error('❌ Uncaught Exception:', error);
  logger.error('❌ Uncaught Exception:', error);
  server.stop();
});

// Start server
console.log('🚀 Calling server.start()...');
server.start().catch((error) => {
  console.error('❌ Fatal error during startup:', error);
  process.exit(1);
});
