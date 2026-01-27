/**
 * WebSocket Handler: Delivery Tracking
 * Gère le suivi en temps réel des livraisons
 */
import { Server, Socket } from 'socket.io';
import { AuthenticatedSocket } from '../SocketServer';

export class DeliveryTrackingHandler {
  private io: Server;

  constructor(io: Server) {
    this.io = io;
    this.setupHandlers();
  }

  private setupHandlers(): void {
    this.io.on('connection', (socket: Socket) => {
      const authSocket = socket as AuthenticatedSocket;

      // Deliverer updates their location
      socket.on(
        'deliverer:location:update',
        (data: {
          deliveryId: string;
          latitude: number;
          longitude: number;
          speed?: number;
          heading?: number;
        }) => {
          this.handleLocationUpdate(authSocket, data);
        }
      );

      // Deliverer starts delivery
      socket.on('delivery:start', (data: { deliveryId: string }) => {
        this.handleDeliveryStart(authSocket, data);
      });

      // Deliverer arrives at destination
      socket.on('delivery:arrive', (data: { deliveryId: string }) => {
        this.handleDeliveryArrive(authSocket, data);
      });

      // Deliverer completes delivery
      socket.on(
        'delivery:complete',
        (data: { deliveryId: string; signature?: string; photo?: string }) => {
          this.handleDeliveryComplete(authSocket, data);
        }
      );

      // Customer/Admin subscribes to delivery tracking
      socket.on('delivery:track', (data: { deliveryId: string }) => {
        this.handleTrackDelivery(authSocket, data);
      });

      // Customer/Admin unsubscribes from delivery tracking
      socket.on('delivery:untrack', (data: { deliveryId: string }) => {
        this.handleUntrackDelivery(authSocket, data);
      });
    });
  }

  private handleLocationUpdate(
    socket: AuthenticatedSocket,
    data: {
      deliveryId: string;
      latitude: number;
      longitude: number;
      speed?: number;
      heading?: number;
    }
  ): void {
    console.log(`[DeliveryTracking] Location update for delivery ${data.deliveryId}`);

    // Validate deliverer role
    if (socket.role !== 'deliverer') {
      socket.emit('error', { message: 'Only deliverers can update location' });
      return;
    }

    // Broadcast location to tracking room
    this.io.to(`delivery:${data.deliveryId}`).emit('delivery:location', {
      deliveryId: data.deliveryId,
      location: {
        latitude: data.latitude,
        longitude: data.longitude,
        speed: data.speed,
        heading: data.heading,
      },
      timestamp: new Date().toISOString(),
      delivererId: socket.userId,
    });

    // Also broadcast to organization dashboard
    this.io.to(`org:${socket.organizationId}:admin`).emit('deliverer:location', {
      delivererId: socket.userId,
      location: {
        latitude: data.latitude,
        longitude: data.longitude,
      },
      timestamp: new Date().toISOString(),
    });
  }

  private handleDeliveryStart(socket: AuthenticatedSocket, data: { deliveryId: string }): void {
    console.log(`[DeliveryTracking] Delivery ${data.deliveryId} started`);

    if (socket.role !== 'deliverer') {
      socket.emit('error', { message: 'Only deliverers can start delivery' });
      return;
    }

    // Broadcast to tracking room and organization
    this.io.to(`delivery:${data.deliveryId}`).emit('delivery:started', {
      deliveryId: data.deliveryId,
      delivererId: socket.userId,
      timestamp: new Date().toISOString(),
    });

    this.io.to(`org:${socket.organizationId}`).emit('delivery:status', {
      deliveryId: data.deliveryId,
      status: 'in_transit',
      timestamp: new Date().toISOString(),
    });
  }

  private handleDeliveryArrive(socket: AuthenticatedSocket, data: { deliveryId: string }): void {
    console.log(`[DeliveryTracking] Delivery ${data.deliveryId} arrived`);

    if (socket.role !== 'deliverer') {
      socket.emit('error', { message: 'Only deliverers can mark arrival' });
      return;
    }

    this.io.to(`delivery:${data.deliveryId}`).emit('delivery:arrived', {
      deliveryId: data.deliveryId,
      delivererId: socket.userId,
      timestamp: new Date().toISOString(),
    });

    this.io.to(`org:${socket.organizationId}`).emit('delivery:status', {
      deliveryId: data.deliveryId,
      status: 'arrived',
      timestamp: new Date().toISOString(),
    });
  }

  private handleDeliveryComplete(
    socket: AuthenticatedSocket,
    data: {
      deliveryId: string;
      signature?: string;
      photo?: string;
    }
  ): void {
    console.log(`[DeliveryTracking] Delivery ${data.deliveryId} completed`);

    if (socket.role !== 'deliverer') {
      socket.emit('error', { message: 'Only deliverers can complete delivery' });
      return;
    }

    this.io.to(`delivery:${data.deliveryId}`).emit('delivery:completed', {
      deliveryId: data.deliveryId,
      delivererId: socket.userId,
      timestamp: new Date().toISOString(),
      hasSignature: !!data.signature,
      hasPhoto: !!data.photo,
    });

    this.io.to(`org:${socket.organizationId}`).emit('delivery:status', {
      deliveryId: data.deliveryId,
      status: 'delivered',
      timestamp: new Date().toISOString(),
    });
  }

  private handleTrackDelivery(socket: AuthenticatedSocket, data: { deliveryId: string }): void {
    console.log(`[DeliveryTracking] User ${socket.userId} tracking delivery ${data.deliveryId}`);

    // Join delivery tracking room
    socket.join(`delivery:${data.deliveryId}`);

    // Send current delivery status
    socket.emit('delivery:tracking:started', {
      deliveryId: data.deliveryId,
      message: 'Now tracking delivery',
    });

    // TODO: Fetch and send current delivery status from database
  }

  private handleUntrackDelivery(socket: AuthenticatedSocket, data: { deliveryId: string }): void {
    console.log(
      `[DeliveryTracking] User ${socket.userId} stopped tracking delivery ${data.deliveryId}`
    );

    // Leave delivery tracking room
    socket.leave(`delivery:${data.deliveryId}`);

    socket.emit('delivery:tracking:stopped', {
      deliveryId: data.deliveryId,
      message: 'Stopped tracking delivery',
    });
  }
}
