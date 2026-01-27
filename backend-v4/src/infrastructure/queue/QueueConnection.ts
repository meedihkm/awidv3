/**
 * Infrastructure: Queue Connection
 * Configuration BullMQ pour les jobs asynchrones
 */
import { ConnectionOptions, Queue, QueueEvents, Worker } from 'bullmq';

export class QueueConnection {
  private static instance: QueueConnection;
  private connection: ConnectionOptions;

  private constructor() {
    const redisUrl = process.env.REDIS_URL || 'redis://localhost:6379';
    const url = new URL(redisUrl);

    this.connection = {
      host: url.hostname,
      port: parseInt(url.port) || 6379,
      password: url.password || undefined,
      maxRetriesPerRequest: null,
      enableReadyCheck: false,
    };
  }

  static getInstance(): QueueConnection {
    if (!QueueConnection.instance) {
      QueueConnection.instance = new QueueConnection();
    }
    return QueueConnection.instance;
  }

  getConnection(): ConnectionOptions {
    return this.connection;
  }

  createQueue<T = any>(name: string): Queue<T> {
    return new Queue<T>(name, {
      connection: this.connection,
      defaultJobOptions: {
        attempts: 3,
        backoff: {
          type: 'exponential',
          delay: 1000,
        },
        removeOnComplete: {
          age: 24 * 3600, // Keep completed jobs for 24 hours
          count: 1000, // Keep last 1000 completed jobs
        },
        removeOnFail: {
          age: 7 * 24 * 3600, // Keep failed jobs for 7 days
        },
      },
    });
  }

  createWorker<T = any>(
    name: string,
    processor: (job: any) => Promise<any>,
    concurrency = 5
  ): Worker<T> {
    return new Worker<T>(name, processor, {
      connection: this.connection,
      concurrency,
      limiter: {
        max: 10,
        duration: 1000,
      },
    });
  }

  createQueueEvents(name: string): QueueEvents {
    return new QueueEvents(name, {
      connection: this.connection,
    });
  }
}
