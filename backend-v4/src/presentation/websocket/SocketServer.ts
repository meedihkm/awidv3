/**
 * Presentation: Socket Server
 * Configuration Socket.io pour temps réel
 */
import { Server as HTTPServer } from 'http';
import jwt from 'jsonwebtoken';
import { Server, Socket } from 'socket.io';
import { envConfig } from '../../config/env.validation';

export interface AuthenticatedSocket extends Socket {
  userId: string;
  organizationId: string;
  role: string;
}

export class SocketServer {
  private static instance: SocketServer;
  private io: Server | null = null;

  private constructor() {}

  static getInstance(): SocketServer {
    if (!SocketServer.instance) {
      SocketServer.instance = new SocketServer();
    }
    return SocketServer.instance;
  }

  initialize(httpServer: HTTPServer): Server {
    this.io = new Server(httpServer, {
      cors: {
        origin: process.env.CORS_ORIGIN || '*',
        methods: ['GET', 'POST'],
        credentials: true,
      },
      pingTimeout: 60000,
      pingInterval: 25000,
    });

    this.setupMiddleware();
    this.setupConnectionHandlers();

    console.log('[SocketServer] Socket.io initialized');
    return this.io;
  }

  private setupMiddleware(): void {
    if (!this.io) return;

    // Authentication middleware
    this.io.use(async (socket: Socket, next) => {
      try {
        const token =
          socket.handshake.auth.token || socket.handshake.headers.authorization?.split(' ')[1];

        if (!token) {
          return next(new Error('Authentication token required'));
        }

        const decoded = jwt.verify(token, envConfig.JWT_SECRET) as {
          userId: string;
          organizationId: string;
          role: string;
        };

        // Attach user info to socket
        (socket as AuthenticatedSocket).userId = decoded.userId;
        (socket as AuthenticatedSocket).organizationId = decoded.organizationId;
        (socket as AuthenticatedSocket).role = decoded.role;

        next();
      } catch (error) {
        next(new Error('Invalid authentication token'));
      }
    });
  }

  private setupConnectionHandlers(): void {
    if (!this.io) return;

    this.io.on('connection', (socket: Socket) => {
      const authSocket = socket as AuthenticatedSocket;

      console.log(`[SocketServer] Client connected: ${socket.id}`);
      console.log(
        `[SocketServer] User: ${authSocket.userId}, Org: ${authSocket.organizationId}, Role: ${authSocket.role}`
      );

      // Join organization room
      socket.join(`org:${authSocket.organizationId}`);

      // Join role-specific room
      socket.join(`org:${authSocket.organizationId}:${authSocket.role}`);

      // Send welcome message
      socket.emit('connected', {
        socketId: socket.id,
        userId: authSocket.userId,
        organizationId: authSocket.organizationId,
        role: authSocket.role,
      });

      // Handle disconnection
      socket.on('disconnect', (reason) => {
        console.log(`[SocketServer] Client disconnected: ${socket.id}, Reason: ${reason}`);
      });

      // Handle errors
      socket.on('error', (error) => {
        console.error(`[SocketServer] Socket error for ${socket.id}:`, error);
      });
    });
  }

  getIO(): Server {
    if (!this.io) {
      throw new Error('Socket.io not initialized. Call initialize() first.');
    }
    return this.io;
  }

  // Emit to specific organization
  emitToOrganization(organizationId: string, event: string, data: any): void {
    if (!this.io) return;
    this.io.to(`org:${organizationId}`).emit(event, data);
  }

  // Emit to specific role in organization
  emitToRole(organizationId: string, role: string, event: string, data: any): void {
    if (!this.io) return;
    this.io.to(`org:${organizationId}:${role}`).emit(event, data);
  }

  // Emit to specific user
  emitToUser(userId: string, event: string, data: any): void {
    if (!this.io) return;
    this.io.to(`user:${userId}`).emit(event, data);
  }

  // Emit to all connected clients
  emitToAll(event: string, data: any): void {
    if (!this.io) return;
    this.io.emit(event, data);
  }

  // Get connected clients count
  getConnectedClientsCount(): number {
    if (!this.io) return 0;
    return this.io.sockets.sockets.size;
  }

  // Get clients in a room
  getClientsInRoom(room: string): Set<string> {
    if (!this.io) return new Set();
    return this.io.sockets.adapter.rooms.get(room) || new Set();
  }
}
