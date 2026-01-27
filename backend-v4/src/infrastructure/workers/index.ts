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

  EmailWorker.getInstance();
  ReportWorker.getInstance();
  CleanupWorker.getInstance();

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
