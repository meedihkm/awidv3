/**
 * Worker: Email Worker
 * Traite les jobs d'envoi d'emails
 */
import { Job } from 'bullmq';
import { EmailJobData } from '../queue/EmailQueue';
import { QueueConnection } from '../queue/QueueConnection';

export class EmailWorker {
  private static instance: EmailWorker;
  private worker: any;

  private constructor() {
    const queueConnection = QueueConnection.getInstance();
    this.worker = queueConnection.createWorker<EmailJobData>(
      'email',
      this.processEmail.bind(this),
      5 // concurrency
    );

    this.setupEventHandlers();
  }

  static getInstance(): EmailWorker {
    if (!EmailWorker.instance) {
      EmailWorker.instance = new EmailWorker();
    }
    return EmailWorker.instance;
  }

  private async processEmail(job: Job<EmailJobData>): Promise<void> {
    const { to, subject, html, text, template } = job.data;

    console.log(`[EmailWorker] Processing email job ${job.id}`);
    console.log(`[EmailWorker] To: ${to}, Subject: ${subject}`);

    try {
      // Si un template est spécifié, le rendre
      let finalHtml = html;
      let finalText = text;

      if (template) {
        const rendered = await this.renderTemplate(template.name, template.data);
        finalHtml = rendered.html;
        finalText = rendered.text;
      }

      // Envoyer l'email
      await this.sendEmail({
        to,
        subject,
        html: finalHtml,
        text: finalText,
        from: job.data.from,
        cc: job.data.cc,
        bcc: job.data.bcc,
        attachments: job.data.attachments,
      });

      console.log(`[EmailWorker] Email sent successfully to ${to}`);
    } catch (error) {
      console.error(`[EmailWorker] Error sending email:`, error);
      throw error; // Will trigger retry
    }
  }

  private async renderTemplate(
    templateName: string,
    data: Record<string, any>
  ): Promise<{ html: string; text: string }> {
    // Templates simples pour le MVP
    const templates: Record<string, (data: any) => { html: string; text: string }> = {
      welcome: (data) => ({
        html: `
          <h1>Bienvenue ${data.userName}!</h1>
          <p>Nous sommes ravis de vous accueillir sur AWID.</p>
          <p>Vous pouvez maintenant commencer à utiliser notre plateforme.</p>
        `,
        text: `Bienvenue ${data.userName}! Nous sommes ravis de vous accueillir sur AWID.`,
      }),

      'order-confirmation': (data) => ({
        html: `
          <h1>Commande #${data.orderId} confirmée</h1>
          <p>Bonjour ${data.customerName},</p>
          <p>Votre commande a été confirmée avec succès.</p>
          <h2>Détails:</h2>
          <ul>
            ${data.items.map((item: any) => `<li>${item.quantity}x ${item.name} - ${item.price} DZD</li>`).join('')}
          </ul>
          <p><strong>Total: ${data.total} DZD</strong></p>
        `,
        text: `Commande #${data.orderId} confirmée. Total: ${data.total} DZD`,
      }),

      'delivery-notification': (data) => ({
        html: `
          <h1>Votre commande est en route!</h1>
          <p>Bonjour ${data.customerName},</p>
          <p>Votre commande #${data.orderId} est en cours de livraison.</p>
          <p>Livreur: ${data.delivererName}</p>
          <p>Heure estimée: ${data.estimatedTime}</p>
        `,
        text: `Votre commande #${data.orderId} est en route. Livreur: ${data.delivererName}`,
      }),

      'payment-receipt': (data) => ({
        html: `
          <h1>Reçu de paiement #${data.paymentId}</h1>
          <p>Bonjour ${data.customerName},</p>
          <p>Nous avons bien reçu votre paiement de ${data.amount} DZD.</p>
          <p>Date: ${data.date}</p>
          <p>Commandes payées: ${data.orders.join(', ')}</p>
        `,
        text: `Reçu de paiement #${data.paymentId}. Montant: ${data.amount} DZD`,
      }),

      'credit-limit-alert': (data) => ({
        html: `
          <h1>⚠️ Alerte: Limite de crédit</h1>
          <p>Bonjour ${data.customerName},</p>
          <p>Votre dette actuelle (${data.currentDebt} DZD) atteint ${data.percentage}% de votre limite de crédit (${data.creditLimit} DZD).</p>
          <p>Merci de régulariser votre situation.</p>
        `,
        text: `Alerte: Votre dette (${data.currentDebt} DZD) atteint ${data.percentage}% de votre limite.`,
      }),

      'daily-report': (data) => ({
        html: `
          <h1>Rapport journalier - ${data.date}</h1>
          <ul>
            <li>Commandes: ${data.totalOrders}</li>
            <li>Chiffre d'affaires: ${data.totalRevenue} DZD</li>
            <li>Livraisons: ${data.totalDeliveries}</li>
            <li>Paiements en attente: ${data.pendingPayments} DZD</li>
          </ul>
        `,
        text: `Rapport ${data.date}: ${data.totalOrders} commandes, ${data.totalRevenue} DZD CA`,
      }),

      'password-reset': (data) => ({
        html: `
          <h1>Réinitialisation de mot de passe</h1>
          <p>Bonjour ${data.userName},</p>
          <p>Vous avez demandé à réinitialiser votre mot de passe.</p>
          <p>Code de réinitialisation: <strong>${data.resetToken}</strong></p>
          <p>Ce code expire dans 1 heure.</p>
        `,
        text: `Code de réinitialisation: ${data.resetToken}. Expire dans 1 heure.`,
      }),
    };

    const template = templates[templateName];
    if (!template) {
      throw new Error(`Template ${templateName} not found`);
    }

    return template(data);
  }

  private async sendEmail(emailData: {
    to: string | string[];
    subject: string;
    html?: string;
    text?: string;
    from?: string;
    cc?: string | string[];
    bcc?: string | string[];
    attachments?: any[];
  }): Promise<void> {
    // Pour le MVP, on simule l'envoi
    // En production, utiliser nodemailer ou un service comme SendGrid

    const from = emailData.from || process.env.EMAIL_FROM || 'noreply@awid.dz';

    console.log(`[EmailWorker] Sending email:`);
    console.log(`  From: ${from}`);
    console.log(`  To: ${emailData.to}`);
    console.log(`  Subject: ${emailData.subject}`);

    if (process.env.NODE_ENV === 'development') {
      console.log(`  HTML: ${emailData.html?.substring(0, 100)}...`);
      console.log(`  Text: ${emailData.text?.substring(0, 100)}...`);
    }

    // Simuler un délai d'envoi
    await new Promise((resolve) => setTimeout(resolve, 100));

    // TODO: Implémenter l'envoi réel avec nodemailer
    // const transporter = nodemailer.createTransport({...});
    // await transporter.sendMail({...});
  }

  private setupEventHandlers(): void {
    this.worker.on('completed', (job: Job) => {
      console.log(`[EmailWorker] Job ${job.id} completed`);
    });

    this.worker.on('failed', (job: Job | undefined, error: Error) => {
      console.error(`[EmailWorker] Job ${job?.id} failed:`, error.message);
    });

    this.worker.on('error', (error: Error) => {
      console.error('[EmailWorker] Worker error:', error);
    });
  }

  async close(): Promise<void> {
    await this.worker.close();
    console.log('[EmailWorker] Worker closed');
  }
}
