import { Request, Response } from 'express';
import {
    GetDeliveryTrackingUseCase
} from '../../../application/use-cases/deliveries';
import {
    GetOrderUseCase,
    ListOrdersUseCase
} from '../../../application/use-cases/orders';
import { db } from '../../../infrastructure/database/PostgresConnection';
import {
    PostgresDeliveryRepository,
    PostgresOrderRepository,
    PostgresUserRepository,
} from '../../../infrastructure/database/repositories';

export class CustomerController {
    private listOrdersUseCase: ListOrdersUseCase;
    private getOrderUseCase: GetOrderUseCase;
    private getDeliveryTrackingUseCase: GetDeliveryTrackingUseCase;

    constructor() {
        // Initialize repositories
        const orderRepository = new PostgresOrderRepository();
        const deliveryRepository = new PostgresDeliveryRepository();
        const userRepository = new PostgresUserRepository();

        // Initialize use cases
        this.listOrdersUseCase = new ListOrdersUseCase(orderRepository);
        this.getOrderUseCase = new GetOrderUseCase(orderRepository);
        this.getDeliveryTrackingUseCase = new GetDeliveryTrackingUseCase(deliveryRepository);
    }

    /**
     * Get customer orders
     * GET /customer/orders
     */
    async getOrders(req: Request, res: Response): Promise<void> {
        try {
            const customerId = req.query.customer_id as string || req.user?.userId;
            const status = req.query.status as string;
            const limit = req.query.limit ? parseInt(req.query.limit as string) : 20;
            const offset = req.query.offset ? parseInt(req.query.offset as string) : 0;

            if (!customerId) {
                res.status(400).json({
                    success: false,
                    error: 'Customer ID is required',
                    code: 'VALIDATION_ERROR',
                });
                return;
            }

            const result = await this.listOrdersUseCase.execute({
                userId: req.user!.userId,
                userRole: req.user!.role,
                organizationId: req.user!.organizationId,
                customerId,
                status,
                limit,
                offset,
            });

            res.json({
                success: true,
                data: result.orders,
                pagination: {
                    limit,
                    offset,
                    total: result.total,
                },
            });
        } catch (error) {
            console.error('Error getting customer orders:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des commandes',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get specific customer order
     * GET /customer/orders/:id
     */
    async getOrder(req: Request, res: Response): Promise<void> {
        try {
            const orderId = req.params.id;

            const result = await this.getOrderUseCase.execute({
                orderId,
                userId: req.user!.userId,
                userRole: req.user!.role,
                organizationId: req.user!.organizationId,
            });

            res.json({
                success: true,
                data: result,
            });
        } catch (error) {
            console.error('Error getting customer order:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération de la commande',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Search customer orders
     * GET /customer/orders/search
     */
    async searchOrders(req: Request, res: Response): Promise<void> {
        try {
            const customerId = req.query.customer_id as string || req.user?.userId;
            const query = req.query.q as string;

            if (!customerId || !query) {
                res.status(400).json({
                    success: false,
                    error: 'Customer ID and search query are required',
                    code: 'VALIDATION_ERROR',
                });
                return;
            }

            // Search orders by order number, product name, or notes
            const searchResult = await db.query(`
        SELECT DISTINCT o.id, o.order_number, o.status, o.total, o.created_at,
               u.first_name || ' ' || u.last_name as customer_name
        FROM orders o
        LEFT JOIN users u ON o.customer_id = u.id
        LEFT JOIN order_items oi ON oi.order_id = o.id
        WHERE o.customer_id = $1 
        AND o.deleted_at IS NULL
        AND (
          o.order_number ILIKE $2 
          OR oi.product_name ILIKE $2 
          OR o.notes ILIKE $2
        )
        ORDER BY o.created_at DESC
        LIMIT 20
      `, [customerId, `%${query}%`]);

            const orders = searchResult.map((row: any) => ({
                id: row.id,
                orderNumber: row.order_number,
                status: row.status,
                totalAmount: parseFloat(row.total) / 100, // Convert from centimes
                createdAt: row.created_at,
                customerName: row.customer_name,
            }));

            res.json({
                success: true,
                data: orders,
            });
        } catch (error) {
            console.error('Error searching customer orders:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la recherche des commandes',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get customer active deliveries
     * GET /customer/deliveries/active
     */
    async getActiveDeliveries(req: Request, res: Response): Promise<void> {
        try {
            const customerId = req.query.customer_id as string || req.user?.userId;

            if (!customerId) {
                res.status(400).json({
                    success: false,
                    error: 'Customer ID is required',
                    code: 'VALIDATION_ERROR',
                });
                return;
            }

            const result = await db.query(`
        SELECT d.id, d.delivery_number, d.status, d.created_at,
               d.estimated_distance, d.estimated_duration,
               o.order_number, o.total as order_total,
               u.first_name || ' ' || u.last_name as deliverer_name,
               d.delivery_address_street, d.delivery_address_city
        FROM deliveries d
        JOIN orders o ON d.order_id = o.id
        LEFT JOIN users u ON d.deliverer_id = u.id
        WHERE o.customer_id = $1 
        AND d.status IN ('assigned', 'picked_up', 'in_transit')
        AND d.deleted_at IS NULL
        ORDER BY d.created_at DESC
      `, [customerId]);

            const deliveries = result.map((row: any) => ({
                id: row.id,
                deliveryNumber: row.delivery_number,
                status: row.status,
                orderNumber: row.order_number,
                orderTotal: parseFloat(row.order_total) / 100,
                delivererName: row.deliverer_name,
                address: {
                    street: row.delivery_address_street,
                    city: row.delivery_address_city,
                },
                estimatedDistance: row.estimated_distance,
                estimatedDuration: row.estimated_duration,
                createdAt: row.created_at,
            }));

            res.json({
                success: true,
                data: deliveries,
            });
        } catch (error) {
            console.error('Error getting active deliveries:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des livraisons actives',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get delivery by ID
     * GET /customer/deliveries/:id
     */
    async getDelivery(req: Request, res: Response): Promise<void> {
        try {
            const deliveryId = req.params.id;

            const result = await this.getDeliveryTrackingUseCase.execute({
                deliveryId,
                userId: req.user!.userId,
                userRole: req.user!.role,
                organizationId: req.user!.organizationId,
            });

            res.json({
                success: true,
                data: result,
            });
        } catch (error) {
            console.error('Error getting delivery:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération de la livraison',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get deliveries history
     * GET /customer/deliveries/history
     */
    async getDeliveriesHistory(req: Request, res: Response): Promise<void> {
        try {
            const customerId = req.query.customer_id as string || req.user?.userId;
            const limit = req.query.limit ? parseInt(req.query.limit as string) : 20;

            if (!customerId) {
                res.status(400).json({
                    success: false,
                    error: 'Customer ID is required',
                    code: 'VALIDATION_ERROR',
                });
                return;
            }

            const result = await db.query(`
        SELECT d.id, d.delivery_number, d.status, d.delivered_at,
               o.order_number, o.total as order_total,
               u.first_name || ' ' || u.last_name as deliverer_name
        FROM deliveries d
        JOIN orders o ON d.order_id = o.id
        LEFT JOIN users u ON d.deliverer_id = u.id
        WHERE o.customer_id = $1 
        AND d.status = 'delivered'
        AND d.deleted_at IS NULL
        ORDER BY d.delivered_at DESC
        LIMIT $2
      `, [customerId, limit]);

            const deliveries = result.map((row: any) => ({
                id: row.id,
                deliveryNumber: row.delivery_number,
                status: row.status,
                orderNumber: row.order_number,
                orderTotal: parseFloat(row.order_total) / 100,
                delivererName: row.deliverer_name,
                deliveredAt: row.delivered_at,
            }));

            res.json({
                success: true,
                data: deliveries,
            });
        } catch (error) {
            console.error('Error getting deliveries history:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération de l\'historique',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get customer account info
     * GET /customer/account/:id
     */
    async getAccountInfo(req: Request, res: Response): Promise<void> {
        try {
            const customerId = req.params.id;

            const result = await db.query(`
        SELECT u.id, u.email, u.first_name, u.last_name, u.phone,
               u.credit_limit, u.current_debt, u.is_active,
               u.address_street, u.address_city, u.address_state, u.address_postal_code,
               org.name as organization_name,
               u.created_at, u.updated_at
        FROM users u
        LEFT JOIN organizations org ON u.organization_id = org.id
        WHERE u.id = $1 AND u.role = 'customer'
      `, [customerId]);

            if (result.length === 0) {
                res.status(404).json({
                    success: false,
                    error: 'Customer not found',
                    code: 'NOT_FOUND',
                });
                return;
            }

            const customer = result[0];
            const accountInfo = {
                id: customer.id,
                email: customer.email,
                firstName: customer.first_name,
                lastName: customer.last_name,
                phone: customer.phone,
                address: {
                    street: customer.address_street,
                    city: customer.address_city,
                    state: customer.address_state,
                    postalCode: customer.address_postal_code,
                },
                organizationName: customer.organization_name,
                isActive: customer.is_active,
                createdAt: customer.created_at,
                updatedAt: customer.updated_at,
                creditInfo: {
                    creditLimit: parseFloat(customer.credit_limit) / 100,
                    currentDebt: parseFloat(customer.current_debt) / 100,
                    availableCredit: (parseFloat(customer.credit_limit) - parseFloat(customer.current_debt)) / 100,
                },
            };

            res.json({
                success: true,
                data: accountInfo,
            });
        } catch (error) {
            console.error('Error getting account info:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération du compte',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get customer credit info
     * GET /customer/account/:id/credit
     */
    async getCreditInfo(req: Request, res: Response): Promise<void> {
        try {
            const customerId = req.params.id;

            const result = await db.query(`
        SELECT u.credit_limit, u.current_debt,
               COUNT(o.id) as total_orders,
               COALESCE(SUM(CASE WHEN o.payment_status = 'unpaid' THEN o.amount_due ELSE 0 END), 0) as unpaid_amount
        FROM users u
        LEFT JOIN orders o ON u.id = o.customer_id AND o.deleted_at IS NULL
        WHERE u.id = $1 AND u.role = 'customer'
        GROUP BY u.id, u.credit_limit, u.current_debt
      `, [customerId]);

            if (result.length === 0) {
                res.status(404).json({
                    success: false,
                    error: 'Customer not found',
                    code: 'NOT_FOUND',
                });
                return;
            }

            const row = result[0];
            const creditInfo = {
                creditLimit: parseFloat(row.credit_limit) / 100,
                currentDebt: parseFloat(row.current_debt) / 100,
                availableCredit: (parseFloat(row.credit_limit) - parseFloat(row.current_debt)) / 100,
                totalOrders: parseInt(row.total_orders),
                unpaidAmount: parseFloat(row.unpaid_amount) / 100,
            };

            res.json({
                success: true,
                data: creditInfo,
            });
        } catch (error) {
            console.error('Error getting credit info:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des informations de crédit',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get unread notifications count
     * GET /customer/notifications/unread/count
     */
    async getUnreadNotificationsCount(req: Request, res: Response): Promise<void> {
        try {
            const customerId = req.query.customer_id as string || req.user?.userId;

            if (!customerId) {
                res.status(400).json({
                    success: false,
                    error: 'Customer ID is required',
                    code: 'VALIDATION_ERROR',
                });
                return;
            }

            // For now, return 0 as notifications system is not implemented
            // This can be extended when notifications table is created
            res.json({
                success: true,
                data: { count: 0 },
            });
        } catch (error) {
            console.error('Error getting notifications count:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des notifications',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get customer packaging info
     * GET /customer/account/:id/packaging
     */
    async getPackagingInfo(req: Request, res: Response): Promise<void> {
        try {
            const customerId = req.params.id;

            // Mock packaging info for now (no packaging table yet)
            const packagingInfo = {
                totalPackaging: 0,
                packagingDeposit: 0,
                returnedPackaging: 0,
                pendingReturn: 0,
                packagingHistory: [],
            };

            res.json({
                success: true,
                data: packagingInfo,
            });
        } catch (error) {
            console.error('Error getting packaging info:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des informations de consignes',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Update customer settings
     * PUT /customer/account/:id/settings
     */
    async updateSettings(req: Request, res: Response): Promise<void> {
        try {
            const customerId = req.params.id;
            const settings = req.body;

            // For now, just return success (no settings table yet)
            res.json({
                success: true,
                message: 'Paramètres mis à jour avec succès',
                data: {
                    customerId: customerId,
                    updatedAt: new Date().toISOString(),
                },
            });
        } catch (error) {
            console.error('Error updating settings:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la mise à jour des paramètres',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Add customer contact
     * POST /customer/account/:id/contacts
     */
    async addContact(req: Request, res: Response): Promise<void> {
        try {
            const customerId = req.params.id;
            const contact = req.body;

            // Mock response for now (no contacts table yet)
            const newContact = {
                id: `contact-${Date.now()}`,
                customerId: customerId,
                ...contact,
                createdAt: new Date().toISOString(),
            };

            res.status(201).json({
                success: true,
                data: newContact,
            });
        } catch (error) {
            console.error('Error adding contact:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de l\'ajout du contact',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Update customer contact
     * PUT /customer/account/:id/contacts/:contactId
     */
    async updateContact(req: Request, res: Response): Promise<void> {
        try {
            const { id: customerId, contactId } = req.params;
            const contact = req.body;

            // Mock response for now (no contacts table yet)
            res.json({
                success: true,
                message: 'Contact mis à jour avec succès',
                data: {
                    id: contactId,
                    customerId: customerId,
                    ...contact,
                    updatedAt: new Date().toISOString(),
                },
            });
        } catch (error) {
            console.error('Error updating contact:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la mise à jour du contact',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Delete customer contact
     * DELETE /customer/account/:id/contacts/:contactId
     */
    async deleteContact(req: Request, res: Response): Promise<void> {
        try {
            const { contactId } = req.params;

            // Mock response for now (no contacts table yet)
            res.json({
                success: true,
                message: 'Contact supprimé avec succès',
                data: {
                    id: contactId,
                    deletedAt: new Date().toISOString(),
                },
            });
        } catch (error) {
            console.error('Error deleting contact:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la suppression du contact',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get customer notifications
     * GET /customer/notifications
     */
    async getNotifications(req: Request, res: Response): Promise<void> {
        try {
            const customerId = req.query.customer_id as string || req.user?.userId;
            const type = req.query.type as string;
            const isRead = req.query.is_read as string;
            const priority = req.query.priority as string;
            const limit = req.query.limit ? parseInt(req.query.limit as string) : 20;
            const offset = req.query.offset ? parseInt(req.query.offset as string) : 0;

            if (!customerId) {
                res.status(400).json({
                    success: false,
                    error: 'Customer ID is required',
                    code: 'VALIDATION_ERROR',
                });
                return;
            }

            // Mock notifications for now (no notifications table yet)
            const notifications: any[] = [];

            res.json({
                success: true,
                data: notifications,
                pagination: {
                    limit,
                    offset,
                    total: 0,
                },
            });
        } catch (error) {
            console.error('Error getting notifications:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des notifications',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Mark notification as read
     * PUT /customer/notifications/:id/read
     */
    async markNotificationAsRead(req: Request, res: Response): Promise<void> {
        try {
            const notificationId = req.params.id;

            // Mock response for now (no notifications table yet)
            res.json({
                success: true,
                message: 'Notification marquée comme lue',
                data: {
                    id: notificationId,
                    isRead: true,
                    readAt: new Date().toISOString(),
                },
            });
        } catch (error) {
            console.error('Error marking notification as read:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors du marquage de la notification',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Mark all notifications as read
     * PUT /customer/notifications/read-all
     */
    async markAllNotificationsAsRead(req: Request, res: Response): Promise<void> {
        try {
            const customerId = req.body.customer_id || req.user?.userId;

            if (!customerId) {
                res.status(400).json({
                    success: false,
                    error: 'Customer ID is required',
                    code: 'VALIDATION_ERROR',
                });
                return;
            }

            // Mock response for now (no notifications table yet)
            res.json({
                success: true,
                message: 'Toutes les notifications marquées comme lues',
                data: {
                    count: 0,
                    updatedAt: new Date().toISOString(),
                },
            });
        } catch (error) {
            console.error('Error marking all notifications as read:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors du marquage des notifications',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Delete notification
     * DELETE /customer/notifications/:id
     */
    async deleteNotification(req: Request, res: Response): Promise<void> {
        try {
            const notificationId = req.params.id;

            // Mock response for now (no notifications table yet)
            res.json({
                success: true,
                message: 'Notification supprimée avec succès',
                data: {
                    id: notificationId,
                    deletedAt: new Date().toISOString(),
                },
            });
        } catch (error) {
            console.error('Error deleting notification:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la suppression de la notification',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Delete read notifications
     * DELETE /customer/notifications/read
     */
    async deleteReadNotifications(req: Request, res: Response): Promise<void> {
        try {
            const customerId = req.query.customer_id as string || req.user?.userId;

            if (!customerId) {
                res.status(400).json({
                    success: false,
                    error: 'Customer ID is required',
                    code: 'VALIDATION_ERROR',
                });
                return;
            }

            // Mock response for now (no notifications table yet)
            res.json({
                success: true,
                message: 'Notifications lues supprimées avec succès',
                data: {
                    count: 0,
                    deletedAt: new Date().toISOString(),
                },
            });
        } catch (error) {
            console.error('Error deleting read notifications:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la suppression des notifications',
                code: 'INTERNAL_ERROR',
            });
        }
    }
}