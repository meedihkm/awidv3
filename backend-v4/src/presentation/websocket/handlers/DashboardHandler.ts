/**
 * WebSocket Handler: Dashboard
 * Gère les mises à jour temps réel du dashboard admin
 */
import { Server, Socket } from 'socket.io';
import { AuthenticatedSocket } from '../SocketServer';

export class DashboardHandler {
  private io: Server;

  constructor(io: Server) {
    this.io = io;
    this.setupHandlers();
  }

  private setupHandlers(): void {
    this.io.on('connection', (socket: Socket) => {
      const authSocket = socket as AuthenticatedSocket;

      // Admin subscribes to dashboard updates
      socket.on('dashboard:subscribe', () => {
        this.handleDashboardSubscribe(authSocket);
      });

      // Admin unsubscribes from dashboard updates
      socket.on('dashboard:unsubscribe', () => {
        this.handleDashboardUnsubscribe(authSocket);
      });

      // Request current stats
      socket.on('dashboard:stats:request', () => {
        this.handleStatsRequest(authSocket);
      });
    });
  }

  private handleDashboardSubscribe(socket: AuthenticatedSocket): void {
    console.log(`[Dashboard] User ${socket.userId} subscribed to dashboard`);

    if (socket.role !== 'admin') {
      socket.emit('error', { message: 'Only admins can access dashboard' });
      return;
    }

    // Join dashboard room
    socket.join(`dashboard:${socket.organizationId}`);

    // Send initial stats
    this.sendDashboardStats(socket);

    socket.emit('dashboard:subscribed', {
      message: 'Successfully subscribed to dashboard updates',
    });
  }

  private handleDashboardUnsubscribe(socket: AuthenticatedSocket): void {
    console.log(`[Dashboard] User ${socket.userId} unsubscribed from dashboard`);

    socket.leave(`dashboard:${socket.organizationId}`);

    socket.emit('dashboard:unsubscribed', {
      message: 'Successfully unsubscribed from dashboard updates',
    });
  }

  private handleStatsRequest(socket: AuthenticatedSocket): void {
    console.log(`[Dashboard] Stats requested by user ${socket.userId}`);

    if (socket.role !== 'admin') {
      socket.emit('error', { message: 'Only admins can request stats' });
      return;
    }

    this.sendDashboardStats(socket);
  }

  private async sendDashboardStats(socket: AuthenticatedSocket): Promise<void> {
    // TODO: Fetch real stats from database
    const stats = {
      today: {
        orders: {
          total: 47,
          pending: 12,
          preparing: 8,
          in_delivery: 15,
          delivered: 12,
        },
        revenue: {
          total: 245000,
          collected: 180000,
          credit: 65000,
        },
        deliveries: {
          active: 15,
          completed: 32,
        },
      },
      deliverers: [
        {
          id: '1',
          name: 'Ahmed',
          status: 'active',
          currentDeliveries: 5,
          location: { latitude: 36.7538, longitude: 3.0588 },
        },
        {
          id: '2',
          name: 'Karim',
          status: 'active',
          currentDeliveries: 3,
          location: { latitude: 36.7628, longitude: 3.0508 },
        },
        {
          id: '3',
          name: 'Yacine',
          status: 'pause',
          currentDeliveries: 0,
          location: { latitude: 36.7438, longitude: 3.0688 },
        },
      ],
      alerts: [
        {
          id: '1',
          type: 'credit_limit',
          severity: 'warning',
          message: 'Client "Café Central" : Limite crédit atteinte',
          timestamp: new Date().toISOString(),
        },
        {
          id: '2',
          type: 'stock',
          severity: 'warning',
          message: 'Stock pain : Niveau bas (20 unités)',
          timestamp: new Date().toISOString(),
        },
        {
          id: '3',
          type: 'delivery',
          severity: 'info',
          message: 'Livraison #1234 : Retard 25 min',
          timestamp: new Date().toISOString(),
        },
      ],
      timestamp: new Date().toISOString(),
    };

    socket.emit('dashboard:stats', stats);
  }

  // Public methods to broadcast updates

  public broadcastOrderUpdate(organizationId: string, orderData: any): void {
    this.io.to(`dashboard:${organizationId}`).emit('dashboard:order:update', orderData);
  }

  public broadcastRevenueUpdate(organizationId: string, revenueData: any): void {
    this.io.to(`dashboard:${organizationId}`).emit('dashboard:revenue:update', revenueData);
  }

  public broadcastAlert(organizationId: string, alert: any): void {
    this.io.to(`dashboard:${organizationId}`).emit('dashboard:alert', alert);
  }

  public broadcastDelivererStatus(organizationId: string, delivererData: any): void {
    this.io.to(`dashboard:${organizationId}`).emit('dashboard:deliverer:status', delivererData);
  }
}
