/**
 * Infrastructure: Email Queue
 * Queue pour l'envoi d'emails asynchrone
 */
import { Queue } from 'bullmq';
import { QueueConnection } from './QueueConnection';

export interface EmailJobData {
  to: string | string[];
  subject: string;
  html?: string;
  text?: string;
  from?: string;
  cc?: string | string[];
  bcc?: string | string[];
  attachments?: Array<{
    filename: string;
    content?: string | Buffer;
    path?: string;
  }>;
  template?: {
    name: string;
    data: Record<string, any>;
  };
}

export class EmailQueue {
  private static instance: EmailQueue;
  private queue: Queue<EmailJobData>;

  private constructor() {
    const queueConnection = QueueConnection.getInstance();
    this.queue = queueConnection.createQueue<EmailJobData>('email');
  }

  static getInstance(): EmailQueue {
    if (!EmailQueue.instance) {
      EmailQueue.instance = new EmailQueue();
    }
    return EmailQueue.instance;
  }

  async sendEmail(data: EmailJobData, priority?: number): Promise<string> {
    const job = await this.queue.add('send-email', data, {
      priority: priority || 5,
    });
    return job.id || '';
  }

  async sendWelcomeEmail(to: string, userName: string): Promise<string> {
    return this.sendEmail({
      to,
      subject: 'Bienvenue sur AWID',
      template: {
        name: 'welcome',
        data: { userName },
      },
    });
  }

  async sendOrderConfirmation(
    to: string,
    orderData: {
      orderId: string;
      customerName: string;
      items: Array<{ name: string; quantity: number; price: number }>;
      total: number;
    }
  ): Promise<string> {
    return this.sendEmail(
      {
        to,
        subject: `Commande #${orderData.orderId} confirmée`,
        template: {
          name: 'order-confirmation',
          data: orderData,
        },
      },
      8 // High priority
    );
  }

  async sendDeliveryNotification(
    to: string,
    deliveryData: {
      orderId: string;
      customerName: string;
      delivererName: string;
      estimatedTime: string;
    }
  ): Promise<string> {
    return this.sendEmail(
      {
        to,
        subject: `Votre commande #${deliveryData.orderId} est en route`,
        template: {
          name: 'delivery-notification',
          data: deliveryData,
        },
      },
      9 // Very high priority
    );
  }

  async sendPaymentReceipt(
    to: string,
    paymentData: {
      paymentId: string;
      customerName: string;
      amount: number;
      date: string;
      orders: string[];
    }
  ): Promise<string> {
    return this.sendEmail({
      to,
      subject: `Reçu de paiement #${paymentData.paymentId}`,
      template: {
        name: 'payment-receipt',
        data: paymentData,
      },
    });
  }

  async sendCreditLimitAlert(
    to: string,
    alertData: {
      customerName: string;
      currentDebt: number;
      creditLimit: number;
      percentage: number;
    }
  ): Promise<string> {
    return this.sendEmail(
      {
        to,
        subject: 'Alerte: Limite de crédit atteinte',
        template: {
          name: 'credit-limit-alert',
          data: alertData,
        },
      },
      7 // High priority
    );
  }

  async sendDailyReport(
    to: string | string[],
    reportData: {
      date: string;
      totalOrders: number;
      totalRevenue: number;
      totalDeliveries: number;
      pendingPayments: number;
    }
  ): Promise<string> {
    return this.sendEmail({
      to,
      subject: `Rapport journalier - ${reportData.date}`,
      template: {
        name: 'daily-report',
        data: reportData,
      },
    });
  }

  async sendPasswordReset(to: string, resetToken: string, userName: string): Promise<string> {
    return this.sendEmail(
      {
        to,
        subject: 'Réinitialisation de votre mot de passe',
        template: {
          name: 'password-reset',
          data: { resetToken, userName },
        },
      },
      10 // Highest priority
    );
  }

  getQueue(): Queue<EmailJobData> {
    return this.queue;
  }

  async getJobCounts() {
    return await this.queue.getJobCounts();
  }

  async getWaitingJobs() {
    return await this.queue.getWaiting();
  }

  async getActiveJobs() {
    return await this.queue.getActive();
  }

  async getFailedJobs() {
    return await this.queue.getFailed();
  }

  async getCompletedJobs() {
    return await this.queue.getCompleted();
  }

  async clean(grace: number = 24 * 3600 * 1000) {
    await this.queue.clean(grace, 100, 'completed');
    await this.queue.clean(7 * 24 * 3600 * 1000, 100, 'failed');
  }
}
