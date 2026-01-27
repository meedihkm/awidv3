/**
 * WebSocket Index
 * Export WebSocket server and handlers
 */
import { Server as HTTPServer } from 'http';
import { Server } from 'socket.io';
import { SocketServer } from './SocketServer';
import { DashboardHandler } from './handlers/DashboardHandler';
import { DeliveryTrackingHandler } from './handlers/DeliveryTrackingHandler';
import { KitchenHandler } from './handlers/KitchenHandler';

export { AuthenticatedSocket, SocketServer } from './SocketServer';
export * from './handlers';

/**
 * Initialize WebSocket server with all handlers
 */
export function initializeWebSocket(httpServer: HTTPServer): Server {
  console.log('[WebSocket] Initializing WebSocket server...');

  const socketServer = SocketServer.getInstance();
  const io = socketServer.initialize(httpServer);

  // Initialize handlers
  new DeliveryTrackingHandler(io);
  new DashboardHandler(io);
  new KitchenHandler(io);

  console.log('[WebSocket] WebSocket server initialized with all handlers');

  return io;
}
