/**
 * Worker: Report Worker
 * Traite les jobs de génération de rapports
 */
import { Job } from 'bullmq';
import { QueueConnection } from '../queue/QueueConnection';
import { ReportJobData } from '../queue/ReportQueue';

export class ReportWorker {
  private static instance: ReportWorker;
  private worker: any;

  private constructor() {
    const queueConnection = QueueConnection.getInstance();
    this.worker = queueConnection.createWorker<ReportJobData>(
      'report',
      this.processReport.bind(this),
      3 // concurrency (génération de rapports est CPU intensive)
    );

    this.setupEventHandlers();
  }

  static getInstance(): ReportWorker {
    if (!ReportWorker.instance) {
      ReportWorker.instance = new ReportWorker();
    }
    return ReportWorker.instance;
  }

  private async processReport(job: Job<ReportJobData>): Promise<string> {
    const { organizationId, type, format, startDate, endDate, filters } = job.data;

    console.log(`[ReportWorker] Processing report job ${job.id}`);
    console.log(`[ReportWorker] Type: ${type}, Format: ${format}, Org: ${organizationId}`);

    try {
      // Collecter les données
      const data = await this.collectData(organizationId, type, startDate, endDate, filters);

      // Générer le rapport selon le format
      let reportPath: string;
      switch (format) {
        case 'pdf':
          reportPath = await this.generatePDF(data, type);
          break;
        case 'excel':
          reportPath = await this.generateExcel(data, type);
          break;
        case 'csv':
          reportPath = await this.generateCSV(data, type);
          break;
        default:
          throw new Error(`Unsupported format: ${format}`);
      }

      console.log(`[ReportWorker] Report generated: ${reportPath}`);

      // Si des destinataires sont spécifiés, envoyer par email
      if (job.data.recipients && job.data.recipients.length > 0) {
        await this.sendReportByEmail(reportPath, job.data.recipients, type);
      }

      return reportPath;
    } catch (error) {
      console.error(`[ReportWorker] Error generating report:`, error);
      throw error;
    }
  }

  private async collectData(
    organizationId: string,
    type: string,
    startDate?: string,
    endDate?: string,
    filters?: any
  ): Promise<any> {
    // Simuler la collecte de données
    // En production, interroger la base de données

    console.log(`[ReportWorker] Collecting data for ${type} report`);

    // Simuler un délai de collecte
    await new Promise((resolve) => setTimeout(resolve, 500));

    // Données simulées
    return {
      organizationId,
      type,
      period: {
        start: startDate,
        end: endDate,
      },
      summary: {
        totalOrders: 150,
        totalRevenue: 450000,
        totalDeliveries: 145,
        pendingPayments: 85000,
        completedOrders: 140,
        cancelledOrders: 10,
      },
      orders: [
        {
          id: '1',
          date: '2026-01-26',
          customer: 'Café Central',
          amount: 12500,
          status: 'delivered',
        },
        {
          id: '2',
          date: '2026-01-26',
          customer: 'Restaurant Paix',
          amount: 25000,
          status: 'delivered',
        },
        {
          id: '3',
          date: '2026-01-26',
          customer: 'Pizzeria Roma',
          amount: 18000,
          status: 'pending',
        },
      ],
      deliverers: [
        { id: '1', name: 'Ahmed', deliveries: 45, revenue: 135000, rating: 4.8 },
        { id: '2', name: 'Karim', deliveries: 38, revenue: 114000, rating: 4.6 },
        { id: '3', name: 'Yacine', deliveries: 42, revenue: 126000, rating: 4.9 },
      ],
      customers: [
        { id: '1', name: 'Café Central', orders: 25, revenue: 75000, debt: 15000 },
        { id: '2', name: 'Restaurant Paix', orders: 30, revenue: 120000, debt: 25000 },
        { id: '3', name: 'Pizzeria Roma', orders: 20, revenue: 60000, debt: 10000 },
      ],
      products: [
        { id: '1', name: 'Pain complet', sold: 500, revenue: 25000 },
        { id: '2', name: 'Croissant', sold: 300, revenue: 45000 },
        { id: '3', name: 'Pizza margherita', sold: 150, revenue: 120000 },
      ],
    };
  }

  private async generatePDF(data: any, type: string): Promise<string> {
    console.log(`[ReportWorker] Generating PDF report`);

    // Simuler la génération PDF
    // En production, utiliser pdfkit ou puppeteer
    await new Promise((resolve) => setTimeout(resolve, 1000));

    const filename = `report-${type}-${Date.now()}.pdf`;
    const path = `/tmp/reports/${filename}`;

    // TODO: Implémenter la génération PDF réelle
    // const PDFDocument = require('pdfkit');
    // const doc = new PDFDocument();
    // doc.pipe(fs.createWriteStream(path));
    // doc.text('Rapport AWID', { align: 'center' });
    // ...
    // doc.end();

    console.log(`[ReportWorker] PDF generated: ${path}`);
    return path;
  }

  private async generateExcel(data: any, type: string): Promise<string> {
    console.log(`[ReportWorker] Generating Excel report`);

    // Simuler la génération Excel
    // En production, utiliser exceljs
    await new Promise((resolve) => setTimeout(resolve, 800));

    const filename = `report-${type}-${Date.now()}.xlsx`;
    const path = `/tmp/reports/${filename}`;

    // TODO: Implémenter la génération Excel réelle
    // const ExcelJS = require('exceljs');
    // const workbook = new ExcelJS.Workbook();
    // const worksheet = workbook.addWorksheet('Rapport');
    // worksheet.columns = [...];
    // worksheet.addRows(data.orders);
    // await workbook.xlsx.writeFile(path);

    console.log(`[ReportWorker] Excel generated: ${path}`);
    return path;
  }

  private async generateCSV(data: any, type: string): Promise<string> {
    console.log(`[ReportWorker] Generating CSV report`);

    // Simuler la génération CSV
    await new Promise((resolve) => setTimeout(resolve, 500));

    const filename = `report-${type}-${Date.now()}.csv`;
    const path = `/tmp/reports/${filename}`;

    // TODO: Implémenter la génération CSV réelle
    // const csv = data.orders.map(order =>
    //   `${order.id},${order.date},${order.customer},${order.amount},${order.status}`
    // ).join('\n');
    // fs.writeFileSync(path, csv);

    console.log(`[ReportWorker] CSV generated: ${path}`);
    return path;
  }

  private async sendReportByEmail(
    reportPath: string,
    recipients: string[],
    type: string
  ): Promise<void> {
    console.log(`[ReportWorker] Sending report to ${recipients.join(', ')}`);

    // Utiliser EmailQueue pour envoyer le rapport
    const { EmailQueue } = require('../queue/EmailQueue');
    const emailQueue = EmailQueue.getInstance();

    await emailQueue.sendEmail({
      to: recipients,
      subject: `Rapport ${type} - AWID`,
      html: `
        <h1>Rapport ${type}</h1>
        <p>Veuillez trouver ci-joint le rapport demandé.</p>
      `,
      attachments: [
        {
          filename: reportPath.split('/').pop() || 'report.pdf',
          path: reportPath,
        },
      ],
    });
  }

  private setupEventHandlers(): void {
    this.worker.on('completed', (job: Job, result: string) => {
      console.log(`[ReportWorker] Job ${job.id} completed: ${result}`);
    });

    this.worker.on('failed', (job: Job | undefined, error: Error) => {
      console.error(`[ReportWorker] Job ${job?.id} failed:`, error.message);
    });

    this.worker.on('error', (error: Error) => {
      console.error('[ReportWorker] Worker error:', error);
    });

    this.worker.on('progress', (job: Job, progress: number) => {
      console.log(`[ReportWorker] Job ${job.id} progress: ${progress}%`);
    });
  }

  async close(): Promise<void> {
    await this.worker.close();
    console.log('[ReportWorker] Worker closed');
  }
}
