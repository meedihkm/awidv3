/**
 * Infrastructure: Workers Index
 * Export all worker services
 */
export { CleanupWorker } from './CleanupWorker';
export { EmailWorker } from './EmailWorker';
export { ReportWorker } from './ReportWorker';

/**
 * Start all workers
 */
export function startAllWorkers(): void {
  console.log('[Workers] Starting all workers...');

  try {
    console.log('[Workers] Initializing EmailWorker...');
    const { EmailWorker: EW } = require('./EmailWorker');
    EW.getInstance();
    console.log('[Workers] EmailWorker initialized');
  } catch (error: any) {
    console.error('[Workers] Failed to initialize EmailWorker:', error?.message || error);
    console.error('[Workers] EmailWorker stack:', error?.stack);
    throw error;
  }

  try {
    console.log('[Workers] Initializing ReportWorker...');
    const { ReportWorker: RW } = require('./ReportWorker');
    RW.getInstance();
    console.log('[Workers] ReportWorker initialized');
  } catch (error: any) {
    console.error('[Workers] Failed to initialize ReportWorker:', error?.message || error);
    throw error;
  }

  try {
    console.log('[Workers] Initializing CleanupWorker...');
    const { CleanupWorker: CW } = require('./CleanupWorker');
    CW.getInstance();
    console.log('[Workers] CleanupWorker initialized');
  } catch (error: any) {
    console.error('[Workers] Failed to initialize CleanupWorker:', error?.message || error);
    throw error;
  }

  console.log('[Workers] All workers started successfully');
}

/**
 * Stop all workers
 */
export async function stopAllWorkers(): Promise<void> {
  console.log('[Workers] Stopping all workers...');

  await EmailWorker.getInstance().close();
  await ReportWorker.getInstance().close();
  await CleanupWorker.getInstance().close();

  console.log('[Workers] All workers stopped successfully');
}
