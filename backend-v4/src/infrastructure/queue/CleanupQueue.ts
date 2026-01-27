/**
 * Infrastructure: Cleanup Queue
 * Queue pour les tâches de nettoyage et maintenance
 */
import { Queue } from 'bullmq';
import { QueueConnection } from './QueueConnection';

export interface CleanupJobData {
  type: 'expired-tokens' | 'old-logs' | 'temp-files' | 'cache' | 'sessions' | 'notifications';
  olderThan?: number; // Days
  organizationId?: string;
}

export class CleanupQueue {
  private static instance: CleanupQueue;
  private queue: Queue<CleanupJobData>;

  private constructor() {
    const queueConnection = QueueConnection.getInstance();
    this.queue = queueConnection.createQueue<CleanupJobData>('cleanup');
  }

  static getInstance(): CleanupQueue {
    if (!CleanupQueue.instance) {
      CleanupQueue.instance = new CleanupQueue();
    }
    return CleanupQueue.instance;
  }

  async scheduleCleanup(data: CleanupJobData): Promise<string> {
    const job = await this.queue.add('cleanup', data, {
      priority: 3,
    });
    return job.id || '';
  }

  async cleanExpiredTokens(): Promise<string> {
    return this.scheduleCleanup({
      type: 'expired-tokens',
      olderThan: 7,
    });
  }

  async cleanOldLogs(days: number = 30): Promise<string> {
    return this.scheduleCleanup({
      type: 'old-logs',
      olderThan: days,
    });
  }

  async cleanTempFiles(days: number = 1): Promise<string> {
    return this.scheduleCleanup({
      type: 'temp-files',
      olderThan: days,
    });
  }

  async cleanCache(organizationId?: string): Promise<string> {
    return this.scheduleCleanup({
      type: 'cache',
      organizationId,
    });
  }

  async cleanExpiredSessions(days: number = 30): Promise<string> {
    return this.scheduleCleanup({
      type: 'sessions',
      olderThan: days,
    });
  }

  async cleanOldNotifications(days: number = 90): Promise<string> {
    return this.scheduleCleanup({
      type: 'notifications',
      olderThan: days,
    });
  }

  async scheduleAutomaticCleanup(): Promise<void> {
    // Clean expired tokens daily at 2 AM
    await this.queue.add(
      'cleanup',
      {
        type: 'expired-tokens',
        olderThan: 7,
      },
      {
        repeat: {
          pattern: '0 2 * * *', // Every day at 02:00
        },
        jobId: 'cleanup-expired-tokens',
      }
    );

    // Clean old logs weekly on Sunday at 3 AM
    await this.queue.add(
      'cleanup',
      {
        type: 'old-logs',
        olderThan: 30,
      },
      {
        repeat: {
          pattern: '0 3 * * 0', // Every Sunday at 03:00
        },
        jobId: 'cleanup-old-logs',
      }
    );

    // Clean temp files daily at 4 AM
    await this.queue.add(
      'cleanup',
      {
        type: 'temp-files',
        olderThan: 1,
      },
      {
        repeat: {
          pattern: '0 4 * * *', // Every day at 04:00
        },
        jobId: 'cleanup-temp-files',
      }
    );

    // Clean expired sessions daily at 5 AM
    await this.queue.add(
      'cleanup',
      {
        type: 'sessions',
        olderThan: 30,
      },
      {
        repeat: {
          pattern: '0 5 * * *', // Every day at 05:00
        },
        jobId: 'cleanup-expired-sessions',
      }
    );

    // Clean old notifications monthly on 1st at 6 AM
    await this.queue.add(
      'cleanup',
      {
        type: 'notifications',
        olderThan: 90,
      },
      {
        repeat: {
          pattern: '0 6 1 * *', // 1st of every month at 06:00
        },
        jobId: 'cleanup-old-notifications',
      }
    );
  }

  async cancelAutomaticCleanup(): Promise<void> {
    await this.queue.removeRepeatableByKey('cleanup-expired-tokens');
    await this.queue.removeRepeatableByKey('cleanup-old-logs');
    await this.queue.removeRepeatableByKey('cleanup-temp-files');
    await this.queue.removeRepeatableByKey('cleanup-expired-sessions');
    await this.queue.removeRepeatableByKey('cleanup-old-notifications');
  }

  getQueue(): Queue<CleanupJobData> {
    return this.queue;
  }

  async getJobCounts() {
    return await this.queue.getJobCounts();
  }

  async clean(grace: number = 7 * 24 * 3600 * 1000) {
    await this.queue.clean(grace, 100, 'completed');
    await this.queue.clean(30 * 24 * 3600 * 1000, 100, 'failed');
  }
}
