/**
 * Infrastructure: Report Queue
 * Queue pour la génération de rapports asynchrone
 */
import { Queue } from 'bullmq';
import { QueueConnection } from './QueueConnection';

export interface ReportJobData {
  organizationId: string;
  type: 'daily' | 'weekly' | 'monthly' | 'custom';
  format: 'pdf' | 'excel' | 'csv';
  startDate?: string;
  endDate?: string;
  filters?: {
    userId?: string;
    customerId?: string;
    productId?: string;
    status?: string;
  };
  recipients?: string[];
  includeCharts?: boolean;
}

export class ReportQueue {
  private static instance: ReportQueue;
  private queue: Queue<ReportJobData>;

  private constructor() {
    const queueConnection = QueueConnection.getInstance();
    this.queue = queueConnection.createQueue<ReportJobData>('report');
  }

  static getInstance(): ReportQueue {
    if (!ReportQueue.instance) {
      ReportQueue.instance = new ReportQueue();
    }
    return ReportQueue.instance;
  }

  async generateReport(data: ReportJobData): Promise<string> {
    const job = await this.queue.add('generate-report', data, {
      priority: 5,
    });
    return job.id || '';
  }

  async generateDailyReport(organizationId: string, date: string): Promise<string> {
    return this.generateReport({
      organizationId,
      type: 'daily',
      format: 'pdf',
      startDate: date,
      endDate: date,
      includeCharts: true,
    });
  }

  async generateWeeklyReport(
    organizationId: string,
    startDate: string,
    endDate: string
  ): Promise<string> {
    return this.generateReport({
      organizationId,
      type: 'weekly',
      format: 'pdf',
      startDate,
      endDate,
      includeCharts: true,
    });
  }

  async generateMonthlyReport(organizationId: string, month: string): Promise<string> {
    return this.generateReport({
      organizationId,
      type: 'monthly',
      format: 'pdf',
      startDate: `${month}-01`,
      includeCharts: true,
    });
  }

  async generateFinancialReport(
    organizationId: string,
    startDate: string,
    endDate: string,
    format: 'pdf' | 'excel' = 'pdf'
  ): Promise<string> {
    return this.generateReport({
      organizationId,
      type: 'custom',
      format,
      startDate,
      endDate,
      includeCharts: true,
    });
  }

  async generateDelivererPerformanceReport(
    organizationId: string,
    delivererId: string,
    startDate: string,
    endDate: string
  ): Promise<string> {
    return this.generateReport({
      organizationId,
      type: 'custom',
      format: 'pdf',
      startDate,
      endDate,
      filters: {
        userId: delivererId,
      },
      includeCharts: true,
    });
  }

  async generateCustomerReport(
    organizationId: string,
    customerId: string,
    startDate: string,
    endDate: string,
    format: 'pdf' | 'excel' = 'pdf'
  ): Promise<string> {
    return this.generateReport({
      organizationId,
      type: 'custom',
      format,
      startDate,
      endDate,
      filters: {
        customerId,
      },
    });
  }

  async scheduleAutomaticReports(organizationId: string): Promise<void> {
    // Daily report at 8 PM
    await this.queue.add(
      'generate-report',
      {
        organizationId,
        type: 'daily',
        format: 'pdf',
        includeCharts: true,
      },
      {
        repeat: {
          pattern: '0 20 * * *', // Every day at 20:00
        },
        jobId: `daily-report-${organizationId}`,
      }
    );

    // Weekly report on Monday at 9 AM
    await this.queue.add(
      'generate-report',
      {
        organizationId,
        type: 'weekly',
        format: 'pdf',
        includeCharts: true,
      },
      {
        repeat: {
          pattern: '0 9 * * 1', // Every Monday at 09:00
        },
        jobId: `weekly-report-${organizationId}`,
      }
    );

    // Monthly report on 1st of month at 10 AM
    await this.queue.add(
      'generate-report',
      {
        organizationId,
        type: 'monthly',
        format: 'pdf',
        includeCharts: true,
      },
      {
        repeat: {
          pattern: '0 10 1 * *', // 1st of every month at 10:00
        },
        jobId: `monthly-report-${organizationId}`,
      }
    );
  }

  async cancelAutomaticReports(organizationId: string): Promise<void> {
    await this.queue.removeRepeatableByKey(`daily-report-${organizationId}`);
    await this.queue.removeRepeatableByKey(`weekly-report-${organizationId}`);
    await this.queue.removeRepeatableByKey(`monthly-report-${organizationId}`);
  }

  getQueue(): Queue<ReportJobData> {
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
