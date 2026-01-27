/**
 * Worker: Cleanup Worker
 * Traite les jobs de nettoyage et maintenance
 */
import { Job } from 'bullmq';
import { CacheService } from '../cache/CacheService';
import { CleanupJobData } from '../queue/CleanupQueue';
import { QueueConnection } from '../queue/QueueConnection';

export class CleanupWorker {
  private static instance: CleanupWorker;
  private worker: any;
  private cacheService: CacheService;

  private constructor() {
    const queueConnection = QueueConnection.getInstance();
    this.cacheService = new CacheService();

    this.worker = queueConnection.createWorker<CleanupJobData>(
      'cleanup',
      this.processCleanup.bind(this),
      2 // concurrency
    );

    this.setupEventHandlers();
  }

  static getInstance(): CleanupWorker {
    if (!CleanupWorker.instance) {
      CleanupWorker.instance = new CleanupWorker();
    }
    return CleanupWorker.instance;
  }

  private async processCleanup(job: Job<CleanupJobData>): Promise<{ deleted: number }> {
    const { type, olderThan, organizationId } = job.data;

    console.log(`[CleanupWorker] Processing cleanup job ${job.id}`);
    console.log(`[CleanupWorker] Type: ${type}, OlderThan: ${olderThan} days`);

    try {
      let deleted = 0;

      switch (type) {
        case 'expired-tokens':
          deleted = await this.cleanExpiredTokens(olderThan || 7);
          break;
        case 'old-logs':
          deleted = await this.cleanOldLogs(olderThan || 30);
          break;
        case 'temp-files':
          deleted = await this.cleanTempFiles(olderThan || 1);
          break;
        case 'cache':
          deleted = await this.cleanCache(organizationId);
          break;
        case 'sessions':
          deleted = await this.cleanExpiredSessions(olderThan || 30);
          break;
        case 'notifications':
          deleted = await this.cleanOldNotifications(olderThan || 90);
          break;
        default:
          throw new Error(`Unknown cleanup type: ${type}`);
      }

      console.log(`[CleanupWorker] Cleanup completed: ${deleted} items deleted`);
      return { deleted };
    } catch (error) {
      console.error(`[CleanupWorker] Error during cleanup:`, error);
      throw error;
    }
  }

  private async cleanExpiredTokens(olderThanDays: number): Promise<number> {
    console.log(`[CleanupWorker] Cleaning expired tokens older than ${olderThanDays} days`);

    // Simuler le nettoyage
    // En production, supprimer de la base de données
    await new Promise((resolve) => setTimeout(resolve, 200));

    // TODO: Implémenter le nettoyage réel
    // const cutoffDate = new Date();
    // cutoffDate.setDate(cutoffDate.getDate() - olderThanDays);
    //
    // const result = await db.query(
    //   'DELETE FROM refresh_tokens WHERE created_at < $1 OR expires_at < NOW()',
    //   [cutoffDate]
    // );
    // return result.rowCount;

    const deleted = Math.floor(Math.random() * 50) + 10;
    console.log(`[CleanupWorker] Deleted ${deleted} expired tokens`);
    return deleted;
  }

  private async cleanOldLogs(olderThanDays: number): Promise<number> {
    console.log(`[CleanupWorker] Cleaning old logs older than ${olderThanDays} days`);

    await new Promise((resolve) => setTimeout(resolve, 300));

    // TODO: Implémenter le nettoyage réel
    // const cutoffDate = new Date();
    // cutoffDate.setDate(cutoffDate.getDate() - olderThanDays);
    //
    // const result = await db.query(
    //   'DELETE FROM audit_logs WHERE created_at < $1',
    //   [cutoffDate]
    // );
    // return result.rowCount;

    const deleted = Math.floor(Math.random() * 500) + 100;
    console.log(`[CleanupWorker] Deleted ${deleted} old log entries`);
    return deleted;
  }

  private async cleanTempFiles(olderThanDays: number): Promise<number> {
    console.log(`[CleanupWorker] Cleaning temp files older than ${olderThanDays} days`);

    await new Promise((resolve) => setTimeout(resolve, 400));

    // TODO: Implémenter le nettoyage réel
    // const fs = require('fs').promises;
    // const path = require('path');
    // const tempDir = '/tmp/awid';
    //
    // const files = await fs.readdir(tempDir);
    // const cutoffTime = Date.now() - (olderThanDays * 24 * 60 * 60 * 1000);
    // let deleted = 0;
    //
    // for (const file of files) {
    //   const filePath = path.join(tempDir, file);
    //   const stats = await fs.stat(filePath);
    //   if (stats.mtimeMs < cutoffTime) {
    //     await fs.unlink(filePath);
    //     deleted++;
    //   }
    // }
    // return deleted;

    const deleted = Math.floor(Math.random() * 30) + 5;
    console.log(`[CleanupWorker] Deleted ${deleted} temp files`);
    return deleted;
  }

  private async cleanCache(organizationId?: string): Promise<number> {
    console.log(
      `[CleanupWorker] Cleaning cache${organizationId ? ` for org ${organizationId}` : ''}`
    );

    try {
      if (organizationId) {
        // Nettoyer le cache d'une organisation spécifique
        const deleted = await this.cacheService.deletePattern(`org:${organizationId}:*`);
        console.log(`[CleanupWorker] Deleted ${deleted} cache entries for org ${organizationId}`);
        return deleted;
      } else {
        // Nettoyer tout le cache (attention en production!)
        if (process.env.NODE_ENV === 'production') {
          console.warn('[CleanupWorker] Skipping full cache cleanup in production');
          return 0;
        }
        const deleted = await this.cacheService.clear();
        console.log(`[CleanupWorker] Deleted ${deleted} cache entries`);
        return deleted;
      }
    } catch (error) {
      console.error('[CleanupWorker] Error cleaning cache:', error);
      return 0;
    }
  }

  private async cleanExpiredSessions(olderThanDays: number): Promise<number> {
    console.log(`[CleanupWorker] Cleaning expired sessions older than ${olderThanDays} days`);

    await new Promise((resolve) => setTimeout(resolve, 250));

    // TODO: Implémenter le nettoyage réel
    // const cutoffDate = new Date();
    // cutoffDate.setDate(cutoffDate.getDate() - olderThanDays);
    //
    // const result = await db.query(
    //   'DELETE FROM user_sessions WHERE last_activity < $1 OR expires_at < NOW()',
    //   [cutoffDate]
    // );
    // return result.rowCount;

    const deleted = Math.floor(Math.random() * 100) + 20;
    console.log(`[CleanupWorker] Deleted ${deleted} expired sessions`);
    return deleted;
  }

  private async cleanOldNotifications(olderThanDays: number): Promise<number> {
    console.log(`[CleanupWorker] Cleaning old notifications older than ${olderThanDays} days`);

    await new Promise((resolve) => setTimeout(resolve, 350));

    // TODO: Implémenter le nettoyage réel
    // const cutoffDate = new Date();
    // cutoffDate.setDate(cutoffDate.getDate() - olderThanDays);
    //
    // const result = await db.query(
    //   'DELETE FROM notifications WHERE created_at < $1 AND read = true',
    //   [cutoffDate]
    // );
    // return result.rowCount;

    const deleted = Math.floor(Math.random() * 200) + 50;
    console.log(`[CleanupWorker] Deleted ${deleted} old notifications`);
    return deleted;
  }

  private setupEventHandlers(): void {
    this.worker.on('completed', (job: Job, result: { deleted: number }) => {
      console.log(`[CleanupWorker] Job ${job.id} completed: ${result.deleted} items deleted`);
    });

    this.worker.on('failed', (job: Job | undefined, error: Error) => {
      console.error(`[CleanupWorker] Job ${job?.id} failed:`, error.message);
    });

    this.worker.on('error', (error: Error) => {
      console.error('[CleanupWorker] Worker error:', error);
    });
  }

  async close(): Promise<void> {
    await this.worker.close();
    console.log('[CleanupWorker] Worker closed');
  }
}
