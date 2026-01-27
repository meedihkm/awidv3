/**
 * Infrastructure: Redis Connection
 * Gère la connexion à Redis pour le cache et pub/sub
 */
import { envConfig } from '@/config/env.validation';
import { createClient, RedisClientType } from 'redis';

export class RedisConnection {
  private static instance: RedisConnection;
  private client: RedisClientType | null = null;
  private isConnected = false;

  private constructor() { }

  static getInstance(): RedisConnection {
    if (!RedisConnection.instance) {
      RedisConnection.instance = new RedisConnection();
    }
    return RedisConnection.instance;
  }

  async connect(): Promise<void> {
    if (this.isConnected && this.client) {
      return;
    }

    // Construire l'URL Redis à partir des variables d'environnement
    const redisUrl = `redis://${envConfig.REDIS_HOST}:${envConfig.REDIS_PORT}`;

    const clientOptions: any = {
      url: redisUrl,
      socket: {
        reconnectStrategy: (retries) => {
          if (retries > 10) {
            console.error('Redis: Max reconnection attempts reached');
            return new Error('Max reconnection attempts reached');
          }
          // Exponential backoff: 100ms, 200ms, 400ms, 800ms, etc.
          return Math.min(retries * 100, 3000);
        },
      },
    };

    // Add password only if it's defined
    if (envConfig.REDIS_PASSWORD) {
      clientOptions.password = envConfig.REDIS_PASSWORD;
    }

    this.client = createClient(clientOptions);

    this.client.on('error', (err) => {
      console.error('Redis Client Error:', err);
      this.isConnected = false;
    });

    this.client.on('connect', () => {
      console.log('Redis: Connecting...');
    });

    this.client.on('ready', () => {
      console.log('Redis: Connected and ready');
      this.isConnected = true;
    });

    this.client.on('reconnecting', () => {
      console.log('Redis: Reconnecting...');
      this.isConnected = false;
    });

    this.client.on('end', () => {
      console.log('Redis: Connection closed');
      this.isConnected = false;
    });

    await this.client.connect();
  }

  async disconnect(): Promise<void> {
    if (this.client && this.isConnected) {
      await this.client.quit();
      this.client = null;
      this.isConnected = false;
      console.log('Redis: Disconnected');
    }
  }

  getClient(): RedisClientType {
    if (!this.client || !this.isConnected) {
      throw new Error('Redis client is not connected');
    }
    return this.client;
  }

  isReady(): boolean {
    return this.isConnected && this.client !== null;
  }

  async healthCheck(): Promise<{ status: string; message?: string }> {
    try {
      if (!this.client || !this.isConnected) {
        return { status: 'unhealthy', message: 'Not connected' };
      }
      const result = await this.client.ping();
      return result === 'PONG'
        ? { status: 'healthy' }
        : { status: 'unhealthy', message: 'Ping failed' };
    } catch (error) {
      return {
        status: 'unhealthy',
        message: error instanceof Error ? error.message : 'Unknown error'
      };
    }
  }

  async flushAll(): Promise<void> {
    if (process.env.NODE_ENV === 'production') {
      throw new Error('Cannot flush Redis in production');
    }
    if (this.client && this.isConnected) {
      await this.client.flushAll();
      console.log('Redis: All keys flushed');
    }
  }
}
