/**
 * WebSocket Handler: Kitchen
 * Gère les mises à jour temps réel pour la cuisine
 */
import { Server, Socket } from 'socket.io';
import { AuthenticatedSocket } from '../SocketServer';

export class KitchenHandler {
  private io: Server;

  constructor(io: Server) {
    this.io = io;
    this.setupHandlers();
  }

  private setupHandlers(): void {
    this.io.on('connection', (socket: Socket) => {
      const authSocket = socket as AuthenticatedSocket;

      // Kitchen subscribes to order updates
      socket.on('kitchen:subscribe', () => {
        this.handleKitchenSubscribe(authSocket);
      });

      // Kitchen unsubscribes
      socket.on('kitchen:unsubscribe', () => {
        this.handleKitchenUnsubscribe(authSocket);
      });

      // Kitchen updates order status
      socket.on(
        'kitchen:order:status',
        (data: { orderId: string; status: 'pending' | 'preparing' | 'ready' | 'picked_up' }) => {
          this.handleOrderStatusUpdate(authSocket, data);
        }
      );

      // Kitchen requests current orders
      socket.on('kitchen:orders:request', () => {
        this.handleOrdersRequest(authSocket);
      });
    });
  }

  private handleKitchenSubscribe(socket: AuthenticatedSocket): void {
    console.log(`[Kitchen] User ${socket.userId} subscribed to kitchen updates`);

    if (socket.role !== 'kitchen' && socket.role !== 'admin') {
      socket.emit('error', { message: 'Only kitchen staff can access kitchen updates' });
      return;
    }

    // Join kitchen room
    socket.join(`kitchen:${socket.organizationId}`);

    // Send current orders
    this.sendKitchenOrders(socket);

    socket.emit('kitchen:subscribed', {
      message: 'Successfully subscribed to kitchen updates',
    });
  }

  private handleKitchenUnsubscribe(socket: AuthenticatedSocket): void {
    console.log(`[Kitchen] User ${socket.userId} unsubscribed from kitchen updates`);

    socket.leave(`kitchen:${socket.organizationId}`);

    socket.emit('kitchen:unsubscribed', {
      message: 'Successfully unsubscribed from kitchen updates',
    });
  }

  private handleOrderStatusUpdate(
    socket: AuthenticatedSocket,
    data: {
      orderId: string;
      status: 'pending' | 'preparing' | 'ready' | 'picked_up';
    }
  ): void {
    console.log(`[Kitchen] Order ${data.orderId} status updated to ${data.status}`);

    if (socket.role !== 'kitchen' && socket.role !== 'admin') {
      socket.emit('error', { message: 'Only kitchen staff can update order status' });
      return;
    }

    // Broadcast to kitchen room
    this.io.to(`kitchen:${socket.organizationId}`).emit('kitchen:order:updated', {
      orderId: data.orderId,
      status: data.status,
      updatedBy: socket.userId,
      timestamp: new Date().toISOString(),
    });

    // Broadcast to organization (for dashboard)
    this.io.to(`org:${socket.organizationId}`).emit('order:status:changed', {
      orderId: data.orderId,
      status: data.status,
      timestamp: new Date().toISOString(),
    });

    // If ready, notify deliverers
    if (data.status === 'ready') {
      this.io.to(`org:${socket.organizationId}:deliverer`).emit('order:ready', {
        orderId: data.orderId,
        timestamp: new Date().toISOString(),
      });
    }
  }

  private handleOrdersRequest(socket: AuthenticatedSocket): void {
    console.log(`[Kitchen] Orders requested by user ${socket.userId}`);

    if (socket.role !== 'kitchen' && socket.role !== 'admin') {
      socket.emit('error', { message: 'Only kitchen staff can request orders' });
      return;
    }

    this.sendKitchenOrders(socket);
  }

  private async sendKitchenOrders(socket: AuthenticatedSocket): Promise<void> {
    // TODO: Fetch real orders from database
    const orders = {
      pending: [
        {
          id: '1234',
          customer: 'Café Central',
          items: [
            { name: 'Pain complet', quantity: 10 },
            { name: 'Croissant', quantity: 5 },
          ],
          priority: 'urgent',
          createdAt: new Date().toISOString(),
        },
        {
          id: '1235',
          customer: 'Restaurant Paix',
          items: [
            { name: 'Pizza margherita', quantity: 3 },
            { name: 'Tarte aux pommes', quantity: 2 },
          ],
          priority: 'normal',
          createdAt: new Date().toISOString(),
        },
      ],
      preparing: [
        {
          id: '1230',
          customer: 'Pizzeria Roma',
          items: [{ name: 'Pain complet', quantity: 15 }],
          priority: 'normal',
          startedAt: new Date().toISOString(),
          estimatedTime: 10, // minutes
        },
      ],
      ready: [
        {
          id: '1225',
          customer: 'Café Central',
          items: [{ name: 'Croissant', quantity: 8 }],
          deliverer: 'Ahmed',
          readyAt: new Date().toISOString(),
        },
      ],
      timestamp: new Date().toISOString(),
    };

    socket.emit('kitchen:orders', orders);
  }

  // Public methods to broadcast updates

  public broadcastNewOrder(organizationId: string, orderData: any): void {
    this.io.to(`kitchen:${organizationId}`).emit('kitchen:order:new', orderData);
  }

  public broadcastOrderCancelled(organizationId: string, orderId: string): void {
    this.io.to(`kitchen:${organizationId}`).emit('kitchen:order:cancelled', {
      orderId,
      timestamp: new Date().toISOString(),
    });
  }

  public broadcastStockAlert(organizationId: string, stockData: any): void {
    this.io.to(`kitchen:${organizationId}`).emit('kitchen:stock:alert', stockData);
  }
}
