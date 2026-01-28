import { Request, Response } from 'express';
import { db } from '../../../infrastructure/database/PostgresConnection';

export class KitchenController {
    constructor() { }

    /**
     * Get kitchen orders
     * GET /kitchen/orders
     */
    async getOrders(req: Request, res: Response): Promise<void> {
        try {
            const status = req.query.status as string;
            const date = req.query.date as string;
            const stationId = req.query.stationId as string;
            const priority = req.query.priority as string;
            const organizationId = req.user!.organizationId;

            let whereClause = 'WHERE o.organization_id = $1 AND o.deleted_at IS NULL';
            const params: any[] = [organizationId];
            let paramIndex = 2;

            if (status) {
                whereClause += ` AND o.status = $${paramIndex}`;
                params.push(status);
                paramIndex++;
            }

            if (date) {
                const targetDate = new Date(date);
                whereClause += ` AND DATE(o.created_at) = $${paramIndex}`;
                params.push(targetDate.toISOString().split('T')[0]);
                paramIndex++;
            }

            const query = `
        SELECT o.id, o.order_number, o.status, o.total, o.created_at,
               u.first_name || ' ' || u.last_name as customer_name,
               COUNT(oi.id) as items_count,
               CASE 
                 WHEN o.created_at < NOW() - INTERVAL '30 minutes' AND o.status IN ('confirmed', 'preparing') 
                 THEN true 
                 ELSE false 
               END as is_late
        FROM orders o
        LEFT JOIN users u ON o.customer_id = u.id
        LEFT JOIN order_items oi ON oi.order_id = o.id
        ${whereClause}
        GROUP BY o.id, u.first_name, u.last_name
        ORDER BY o.created_at ASC
      `;

            const result = await db.query(query, params);

            const orders = result.map((row: any) => ({
                id: row.id,
                orderNumber: row.order_number,
                status: row.status,
                totalAmount: parseFloat(row.total) / 100,
                customerName: row.customer_name,
                itemsCount: parseInt(row.items_count),
                isLate: row.is_late,
                createdAt: row.created_at,
            }));

            res.json({
                success: true,
                data: orders,
            });
        } catch (error) {
            console.error('Error getting kitchen orders:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des commandes',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get order by ID
     * GET /kitchen/orders/:id
     */
    async getOrderById(req: Request, res: Response): Promise<void> {
        try {
            const orderId = req.params.id;
            const organizationId = req.user!.organizationId;

            const orderResult = await db.query(`
        SELECT o.*, u.first_name || ' ' || u.last_name as customer_name,
               u.phone as customer_phone
        FROM orders o
        LEFT JOIN users u ON o.customer_id = u.id
        WHERE o.id = $1 AND o.organization_id = $2 AND o.deleted_at IS NULL
      `, [orderId, organizationId]);

            if (orderResult.length === 0) {
                res.status(404).json({
                    success: false,
                    error: 'Order not found',
                    code: 'NOT_FOUND',
                });
                return;
            }

            const itemsResult = await db.query(`
        SELECT oi.*, p.name as product_name
        FROM order_items oi
        LEFT JOIN products p ON oi.product_id = p.id
        WHERE oi.order_id = $1
      `, [orderId]);

            const order = orderResult[0];
            const orderData = {
                id: order.id,
                orderNumber: order.order_number,
                status: order.status,
                totalAmount: parseFloat(order.total) / 100,
                customerName: order.customer_name,
                customerPhone: order.customer_phone,
                items: itemsResult.map((item: any) => ({
                    id: item.id,
                    productId: item.product_id,
                    productName: item.product_name || item.product_name,
                    quantity: item.quantity,
                    unitPrice: parseFloat(item.unit_price) / 100,
                    total: parseFloat(item.total) / 100,
                    notes: item.notes,
                })),
                createdAt: order.created_at,
                confirmedAt: order.confirmed_at,
                preparedAt: order.prepared_at,
            };

            res.json({
                success: true,
                data: orderData,
            });
        } catch (error) {
            console.error('Error getting kitchen order by ID:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération de la commande',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Update order status (for kitchen workflow)
     * POST /kitchen/orders/:id/status
     */
    async updateOrderStatus(req: Request, res: Response): Promise<void> {
        try {
            const orderId = req.params.id;
            const { status, stationId, staffId, notes } = req.body;
            const organizationId = req.user!.organizationId;

            // Verify order belongs to organization
            const orderCheck = await db.query(`
        SELECT id FROM orders 
        WHERE id = $1 AND organization_id = $2 AND deleted_at IS NULL
      `, [orderId, organizationId]);

            if (orderCheck.length === 0) {
                res.status(404).json({
                    success: false,
                    error: 'Order not found',
                    code: 'NOT_FOUND',
                });
                return;
            }

            // Update order status
            const updateData: any = { status, updated_at: new Date() };

            if (status === 'confirmed') {
                updateData.confirmed_at = new Date();
            } else if (status === 'ready') {
                updateData.prepared_at = new Date();
            }

            const setClause = Object.keys(updateData)
                .map((key, index) => `${key} = $${index + 2}`)
                .join(', ');

            const result = await db.query(`
        UPDATE orders 
        SET ${setClause}
        WHERE id = $1 
        RETURNING *
      `, [orderId, ...Object.values(updateData)]);

            res.json({
                success: true,
                data: {
                    id: result[0].id,
                    status: result[0].status,
                    updatedAt: result[0].updated_at,
                },
            });
        } catch (error) {
            console.error('Error updating order status:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la mise à jour du statut',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Assign order to station
     * POST /kitchen/orders/:id/assign
     */
    async assignOrderToStation(req: Request, res: Response): Promise<void> {
        try {
            const orderId = req.params.id;
            const { stationId, staffId } = req.body;
            const organizationId = req.user!.organizationId;

            // Verify order belongs to organization
            const orderCheck = await db.query(`
        SELECT id FROM orders 
        WHERE id = $1 AND organization_id = $2 AND deleted_at IS NULL
      `, [orderId, organizationId]);

            if (orderCheck.length === 0) {
                res.status(404).json({
                    success: false,
                    error: 'Order not found',
                    code: 'NOT_FOUND',
                });
                return;
            }

            // Mock response for now (no station assignment table yet)
            res.json({
                success: true,
                data: {
                    id: orderId,
                    stationId: stationId,
                    staffId: staffId,
                    assignedAt: new Date().toISOString(),
                },
            });
        } catch (error) {
            console.error('Error assigning order to station:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de l\'assignation',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Update order priority
     * PATCH /kitchen/orders/:id/priority
     */
    async updateOrderPriority(req: Request, res: Response): Promise<void> {
        try {
            const orderId = req.params.id;
            const { priority } = req.body;
            const organizationId = req.user!.organizationId;

            // Verify order belongs to organization
            const orderCheck = await db.query(`
        SELECT id FROM orders 
        WHERE id = $1 AND organization_id = $2 AND deleted_at IS NULL
      `, [orderId, organizationId]);

            if (orderCheck.length === 0) {
                res.status(404).json({
                    success: false,
                    error: 'Order not found',
                    code: 'NOT_FOUND',
                });
                return;
            }

            // Mock response for now (no priority field yet)
            res.json({
                success: true,
                data: {
                    id: orderId,
                    priority: priority,
                    updatedAt: new Date().toISOString(),
                },
            });
        } catch (error) {
            console.error('Error updating order priority:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la mise à jour de la priorité',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Update order notes
     * PATCH /kitchen/orders/:id/notes
     */
    async updateOrderNotes(req: Request, res: Response): Promise<void> {
        try {
            const orderId = req.params.id;
            const { notes } = req.body;
            const organizationId = req.user!.organizationId;

            // Verify order belongs to organization
            const orderCheck = await db.query(`
        SELECT id FROM orders 
        WHERE id = $1 AND organization_id = $2 AND deleted_at IS NULL
      `, [orderId, organizationId]);

            if (orderCheck.length === 0) {
                res.status(404).json({
                    success: false,
                    error: 'Order not found',
                    code: 'NOT_FOUND',
                });
                return;
            }

            // Update order notes
            const result = await db.query(`
        UPDATE orders 
        SET notes = $2, updated_at = NOW()
        WHERE id = $1 
        RETURNING *
      `, [orderId, notes]);

            res.json({
                success: true,
                data: {
                    id: result[0].id,
                    notes: result[0].notes,
                    updatedAt: result[0].updated_at,
                },
            });
        } catch (error) {
            console.error('Error updating order notes:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la mise à jour des notes',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Mark item as prepared
     * POST /kitchen/orders/:orderId/items/:itemId/prepared
     */
    async markItemPrepared(req: Request, res: Response): Promise<void> {
        try {
            const { orderId, itemId } = req.params;
            const organizationId = req.user!.organizationId;

            // Verify order belongs to organization
            const orderCheck = await db.query(`
        SELECT id FROM orders 
        WHERE id = $1 AND organization_id = $2 AND deleted_at IS NULL
      `, [orderId, organizationId]);

            if (orderCheck.length === 0) {
                res.status(404).json({
                    success: false,
                    error: 'Order not found',
                    code: 'NOT_FOUND',
                });
                return;
            }

            // Mock response for now (no item preparation tracking yet)
            res.json({
                success: true,
                data: {
                    orderId: orderId,
                    itemId: itemId,
                    preparedAt: new Date().toISOString(),
                },
            });
        } catch (error) {
            console.error('Error marking item as prepared:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors du marquage de l\'article',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get kitchen statistics
     * GET /kitchen/stats
     */
    async getStats(req: Request, res: Response): Promise<void> {
        try {
            const organizationId = req.user!.organizationId;
            const date = req.query.date as string;

            let dateFilter = '';
            const params: any[] = [organizationId];

            if (date) {
                dateFilter = 'AND DATE(created_at) = $2';
                params.push(new Date(date).toISOString().split('T')[0]);
            } else {
                dateFilter = 'AND DATE(created_at) = CURRENT_DATE';
            }

            // Get order statistics
            const statsResult = await db.query(`
        SELECT 
          COUNT(*) as total_orders,
          COUNT(CASE WHEN status = 'pending' THEN 1 END) as pending_orders,
          COUNT(CASE WHEN status = 'preparing' THEN 1 END) as preparing_orders,
          COUNT(CASE WHEN status = 'ready' THEN 1 END) as ready_orders,
          COUNT(CASE WHEN status = 'delivered' THEN 1 END) as completed_orders,
          COUNT(CASE WHEN created_at < NOW() - INTERVAL '30 minutes' AND status IN ('confirmed', 'preparing') THEN 1 END) as delayed_orders,
          COALESCE(AVG(EXTRACT(EPOCH FROM (prepared_at - confirmed_at))/60), 0) as avg_preparation_time
        FROM orders
        WHERE organization_id = $1 ${dateFilter} AND deleted_at IS NULL
      `, params);

            const row = statsResult[0];
            const totalOrders = parseInt(row.total_orders) || 0;
            const completedOrders = parseInt(row.completed_orders) || 0;

            const stats = {
                totalOrders,
                pendingOrders: parseInt(row.pending_orders) || 0,
                preparingOrders: parseInt(row.preparing_orders) || 0,
                readyOrders: parseInt(row.ready_orders) || 0,
                completedOrders,
                delayedOrders: parseInt(row.delayed_orders) || 0,
                averagePreparationTime: parseFloat(row.avg_preparation_time) || 0,
                completionRate: totalOrders > 0 ? (completedOrders / totalOrders) * 100 : 0,
                onTimeRate: totalOrders > 0 ? ((totalOrders - parseInt(row.delayed_orders)) / totalOrders) * 100 : 100,
            };

            res.json({
                success: true,
                data: stats,
            });
        } catch (error) {
            console.error('Error getting kitchen stats:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des statistiques',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get period stats
     * GET /kitchen/stats/period
     */
    async getPeriodStats(req: Request, res: Response): Promise<void> {
        try {
            const startDate = req.query.startDate as string;
            const endDate = req.query.endDate as string;
            const organizationId = req.user!.organizationId;

            if (!startDate || !endDate) {
                res.status(400).json({
                    success: false,
                    error: 'Les dates de début et de fin sont requises',
                    code: 'VALIDATION_ERROR',
                });
                return;
            }

            const result = await db.query(`
        SELECT 
          COUNT(*) as total_orders,
          COUNT(CASE WHEN status = 'delivered' THEN 1 END) as completed_orders,
          COALESCE(AVG(EXTRACT(EPOCH FROM (prepared_at - confirmed_at))/60), 0) as avg_preparation_time,
          COALESCE(SUM(total), 0) as total_revenue
        FROM orders
        WHERE organization_id = $1 
        AND created_at >= $2 
        AND created_at <= $3
        AND deleted_at IS NULL
      `, [organizationId, startDate, endDate]);

            const row = result[0];
            const stats = {
                totalOrders: parseInt(row.total_orders) || 0,
                completedOrders: parseInt(row.completed_orders) || 0,
                averagePreparationTime: parseFloat(row.avg_preparation_time) || 0,
                totalRevenue: parseFloat(row.total_revenue) / 100 || 0,
                period: {
                    startDate,
                    endDate,
                },
            };

            res.json({
                success: true,
                data: stats,
            });
        } catch (error) {
            console.error('Error getting period stats:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des statistiques',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get hourly stats
     * GET /kitchen/stats/hourly
     */
    async getHourlyStats(req: Request, res: Response): Promise<void> {
        try {
            const date = req.query.date as string;
            const organizationId = req.user!.organizationId;

            const targetDate = date ? new Date(date) : new Date();
            const startOfDay = new Date(targetDate);
            startOfDay.setHours(0, 0, 0, 0);
            const endOfDay = new Date(targetDate);
            endOfDay.setHours(23, 59, 59, 999);

            const result = await db.query(`
        SELECT 
          EXTRACT(HOUR FROM created_at) as hour,
          COUNT(*) as orders_count,
          COUNT(CASE WHEN status = 'delivered' THEN 1 END) as completed_count
        FROM orders
        WHERE organization_id = $1 
        AND created_at >= $2 
        AND created_at <= $3
        AND deleted_at IS NULL
        GROUP BY EXTRACT(HOUR FROM created_at)
        ORDER BY hour
      `, [organizationId, startOfDay.toISOString(), endOfDay.toISOString()]);

            const hourlyStats = result.map((row: any) => ({
                hour: parseInt(row.hour),
                ordersCount: parseInt(row.orders_count) || 0,
                completedCount: parseInt(row.completed_count) || 0,
            }));

            res.json({
                success: true,
                data: hourlyStats,
            });
        } catch (error) {
            console.error('Error getting hourly stats:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des statistiques horaires',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get kitchen stations
     * GET /kitchen/stations
     */
    async getStations(req: Request, res: Response): Promise<void> {
        try {
            const organizationId = req.user!.organizationId;
            const type = req.query.type as string;
            const status = req.query.status as string;

            // For now, return mock data as stations table doesn't exist yet
            const stations = [
                {
                    id: '1',
                    name: 'Station Préparation',
                    type: 'preparation',
                    status: 'active',
                    assignedStaff: null,
                    currentOrders: 0,
                    maxCapacity: 5,
                },
                {
                    id: '2',
                    name: 'Station Cuisson',
                    type: 'cooking',
                    status: 'active',
                    assignedStaff: null,
                    currentOrders: 0,
                    maxCapacity: 3,
                },
            ];

            res.json({
                success: true,
                data: stations,
            });
        } catch (error) {
            console.error('Error getting kitchen stations:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des stations',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get station by ID
     * GET /kitchen/stations/:id
     */
    async getStationById(req: Request, res: Response): Promise<void> {
        try {
            const stationId = req.params.id;

            // Mock data for now
            const station = {
                id: stationId,
                name: 'Station Préparation',
                type: 'preparation',
                status: 'active',
                assignedStaff: null,
                currentOrders: 0,
                maxCapacity: 5,
                equipment: ['Four', 'Plaque de cuisson'],
                location: 'Zone A',
            };

            res.json({
                success: true,
                data: station,
            });
        } catch (error) {
            console.error('Error getting station by ID:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération de la station',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Update station status
     * PATCH /kitchen/stations/:id/status
     */
    async updateStationStatus(req: Request, res: Response): Promise<void> {
        try {
            const stationId = req.params.id;
            const { status } = req.body;

            // Mock response for now
            const station = {
                id: stationId,
                name: 'Station Préparation',
                status: status,
                updatedAt: new Date().toISOString(),
            };

            res.json({
                success: true,
                data: station,
            });
        } catch (error) {
            console.error('Error updating station status:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la mise à jour du statut de la station',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Assign staff to station
     * POST /kitchen/stations/:id/assign
     */
    async assignStaffToStation(req: Request, res: Response): Promise<void> {
        try {
            const stationId = req.params.id;
            const { staffId } = req.body;

            // Mock response for now
            const station = {
                id: stationId,
                name: 'Station Préparation',
                assignedStaff: staffId,
                updatedAt: new Date().toISOString(),
            };

            res.json({
                success: true,
                data: station,
            });
        } catch (error) {
            console.error('Error assigning staff to station:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de l\'assignation du personnel',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get stock items
     * GET /kitchen/stock
     */
    async getStock(req: Request, res: Response): Promise<void> {
        try {
            const organizationId = req.user!.organizationId;
            const level = req.query.level as string; // 'low', 'critical'
            const category = req.query.category as string;

            let whereClause = 'WHERE p.organization_id = $1';
            const params: any[] = [organizationId];
            let paramIndex = 2;

            if (level === 'low') {
                whereClause += ' AND p.current_stock <= p.min_stock_level * 2';
            } else if (level === 'critical') {
                whereClause += ' AND p.current_stock <= p.min_stock_level';
            }

            if (category) {
                whereClause += ` AND p.category = $${paramIndex}`;
                params.push(category);
                paramIndex++;
            }

            const query = `
        SELECT p.id, p.name, p.sku, p.current_stock, p.min_stock_level,
               p.unit, p.price, p.category,
               CASE 
                 WHEN p.current_stock <= p.min_stock_level THEN 'critical'
                 WHEN p.current_stock <= p.min_stock_level * 2 THEN 'low'
                 ELSE 'normal'
               END as stock_level
        FROM products p
        ${whereClause}
        ORDER BY p.name
      `;

            const result = await db.query(query, params);

            const stockItems = result.map((row: any) => ({
                id: row.id,
                name: row.name,
                sku: row.sku,
                currentStock: parseInt(row.current_stock) || 0,
                minStockLevel: parseInt(row.min_stock_level) || 0,
                unit: row.unit,
                price: parseFloat(row.price) / 100,
                category: row.category,
                stockLevel: row.stock_level,
                isLow: row.stock_level === 'low',
                isCritical: row.stock_level === 'critical',
            }));

            res.json({
                success: true,
                data: stockItems,
            });
        } catch (error) {
            console.error('Error getting kitchen stock:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération du stock',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get stock item by ID
     * GET /kitchen/stock/:id
     */
    async getStockItemById(req: Request, res: Response): Promise<void> {
        try {
            const itemId = req.params.id;
            const organizationId = req.user!.organizationId;

            const result = await db.query(`
        SELECT p.id, p.name, p.sku, p.current_stock, p.min_stock_level,
               p.unit, p.price, p.category,
               CASE 
                 WHEN p.current_stock <= p.min_stock_level THEN 'critical'
                 WHEN p.current_stock <= p.min_stock_level * 2 THEN 'low'
                 ELSE 'normal'
               END as stock_level
        FROM products p
        WHERE p.id = $1 AND p.organization_id = $2
      `, [itemId, organizationId]);

            if (result.length === 0) {
                res.status(404).json({
                    success: false,
                    error: 'Article non trouvé',
                    code: 'NOT_FOUND',
                });
                return;
            }

            const row = result[0];
            const stockItem = {
                id: row.id,
                name: row.name,
                sku: row.sku,
                currentStock: parseInt(row.current_stock) || 0,
                minStockLevel: parseInt(row.min_stock_level) || 0,
                unit: row.unit,
                price: parseFloat(row.price) / 100,
                category: row.category,
                stockLevel: row.stock_level,
                isLow: row.stock_level === 'low',
                isCritical: row.stock_level === 'critical',
            };

            res.json({
                success: true,
                data: stockItem,
            });
        } catch (error) {
            console.error('Error getting stock item by ID:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération de l\'article',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Adjust stock quantity
     * POST /kitchen/stock/:id/adjust
     */
    async adjustStockQuantity(req: Request, res: Response): Promise<void> {
        try {
            const itemId = req.params.id;
            const { quantity, type, reason, orderId } = req.body;
            const organizationId = req.user!.organizationId;

            // Update product stock
            const result = await db.query(`
        UPDATE products 
        SET current_stock = current_stock + $2, updated_at = NOW()
        WHERE id = $1 AND organization_id = $3
        RETURNING *
      `, [itemId, quantity, organizationId]);

            if (result.length === 0) {
                res.status(404).json({
                    success: false,
                    error: 'Article non trouvé',
                    code: 'NOT_FOUND',
                });
                return;
            }

            const row = result[0];
            const stockItem = {
                id: row.id,
                name: row.name,
                currentStock: parseInt(row.current_stock),
                minStockLevel: parseInt(row.min_stock_level),
                unit: row.unit,
                updatedAt: row.updated_at,
            };

            res.json({
                success: true,
                data: stockItem,
            });
        } catch (error) {
            console.error('Error adjusting stock quantity:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de l\'ajustement du stock',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Create stock item
     * POST /kitchen/stock
     */
    async createStockItem(req: Request, res: Response): Promise<void> {
        try {
            const organizationId = req.user!.organizationId;
            const {
                name,
                category,
                unit,
                currentStock,
                minStockLevel,
                price
            } = req.body;

            const result = await db.query(`
        INSERT INTO products (
          organization_id, name, category, unit, current_stock, 
          min_stock_level, price, is_available
        )
        VALUES ($1, $2, $3, $4, $5, $6, $7, true)
        RETURNING *
      `, [
                organizationId,
                name,
                category || 'ingredient',
                unit || 'unit',
                currentStock || 0,
                minStockLevel || 0,
                Math.round((price || 0) * 100)
            ]);

            const row = result[0];
            const stockItem = {
                id: row.id,
                name: row.name,
                category: row.category,
                currentStock: parseInt(row.current_stock),
                minStockLevel: parseInt(row.min_stock_level),
                unit: row.unit,
                price: parseFloat(row.price) / 100,
                createdAt: row.created_at,
            };

            res.status(201).json({
                success: true,
                data: stockItem,
            });
        } catch (error) {
            console.error('Error creating stock item:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la création de l\'article',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Update stock item
     * PATCH /kitchen/stock/:id
     */
    async updateStockItem(req: Request, res: Response): Promise<void> {
        try {
            const itemId = req.params.id;
            const organizationId = req.user!.organizationId;
            const {
                name,
                category,
                unit,
                minStockLevel,
                price
            } = req.body;

            const result = await db.query(`
        UPDATE products SET
          name = COALESCE($2, name),
          category = COALESCE($3, category),
          unit = COALESCE($4, unit),
          min_stock_level = COALESCE($5, min_stock_level),
          price = COALESCE($6, price),
          updated_at = NOW()
        WHERE id = $1 AND organization_id = $7
        RETURNING *
      `, [
                itemId,
                name,
                category,
                unit,
                minStockLevel,
                price ? Math.round(price * 100) : null,
                organizationId
            ]);

            if (result.length === 0) {
                res.status(404).json({
                    success: false,
                    error: 'Article non trouvé',
                    code: 'NOT_FOUND',
                });
                return;
            }

            const row = result[0];
            const stockItem = {
                id: row.id,
                name: row.name,
                category: row.category,
                currentStock: parseInt(row.current_stock),
                minStockLevel: parseInt(row.min_stock_level),
                unit: row.unit,
                price: parseFloat(row.price) / 100,
                updatedAt: row.updated_at,
            };

            res.json({
                success: true,
                data: stockItem,
            });
        } catch (error) {
            console.error('Error updating stock item:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la mise à jour de l\'article',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get stock movements
     * GET /kitchen/stock/movements
     */
    async getStockMovements(req: Request, res: Response): Promise<void> {
        try {
            const itemId = req.query.itemId as string;
            const startDate = req.query.startDate as string;
            const endDate = req.query.endDate as string;
            const type = req.query.type as string;

            // Mock data for now as stock movements table doesn't exist
            const movements = [
                {
                    id: '1',
                    itemId: itemId || '1',
                    type: 'in',
                    quantity: 50,
                    reason: 'Réapprovisionnement',
                    orderId: null,
                    createdAt: new Date().toISOString(),
                },
                {
                    id: '2',
                    itemId: itemId || '1',
                    type: 'out',
                    quantity: -10,
                    reason: 'Utilisation commande',
                    orderId: 'order-123',
                    createdAt: new Date().toISOString(),
                },
            ];

            res.json({
                success: true,
                data: movements,
            });
        } catch (error) {
            console.error('Error getting stock movements:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des mouvements',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get stock alerts
     * GET /kitchen/stock/alerts
     */
    async getStockAlerts(req: Request, res: Response): Promise<void> {
        try {
            const organizationId = req.user!.organizationId;
            const activeOnly = req.query.activeOnly !== 'false';

            let whereClause = 'WHERE p.organization_id = $1';
            if (activeOnly) {
                whereClause += ' AND p.current_stock <= p.min_stock_level';
            }

            const query = `
        SELECT p.id, p.name, p.current_stock, p.min_stock_level,
               CASE 
                 WHEN p.current_stock = 0 THEN 'out_of_stock'
                 WHEN p.current_stock <= p.min_stock_level THEN 'critical'
                 ELSE 'low'
               END as alert_type
        FROM products p
        ${whereClause}
        ORDER BY p.current_stock ASC, p.name
      `;

            const result = await db.query(query, [organizationId]);

            const alerts = result.map((row: any) => ({
                id: row.id,
                productName: row.name,
                currentStock: parseInt(row.current_stock) || 0,
                minStockLevel: parseInt(row.min_stock_level) || 0,
                alertType: row.alert_type,
                message: this.getAlertMessage(row.alert_type, row.name, row.current_stock),
            }));

            res.json({
                success: true,
                data: alerts,
            });
        } catch (error) {
            console.error('Error getting stock alerts:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des alertes',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Resolve stock alert
     * POST /kitchen/stock/alerts/:id/resolve
     */
    async resolveStockAlert(req: Request, res: Response): Promise<void> {
        try {
            const alertId = req.params.id;

            // Mock response for now
            res.json({
                success: true,
                message: 'Alerte résolue avec succès',
                data: {
                    alertId: alertId,
                    resolvedAt: new Date().toISOString(),
                },
            });
        } catch (error) {
            console.error('Error resolving stock alert:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la résolution de l\'alerte',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get production tasks
     * GET /kitchen/tasks
     */
    async getProductionTasks(req: Request, res: Response): Promise<void> {
        try {
            const status = req.query.status as string;
            const type = req.query.type as string;
            const stationId = req.query.stationId as string;
            const date = req.query.date as string;

            // Mock data for now as production tasks table doesn't exist
            const tasks = [
                {
                    id: '1',
                    title: 'Préparation Pizza Margherita',
                    type: 'preparation',
                    status: 'pending',
                    stationId: '1',
                    orderId: 'order-123',
                    estimatedTime: 15,
                    createdAt: new Date().toISOString(),
                },
                {
                    id: '2',
                    title: 'Cuisson Pain',
                    type: 'cooking',
                    status: 'in_progress',
                    stationId: '2',
                    orderId: null,
                    estimatedTime: 30,
                    createdAt: new Date().toISOString(),
                },
            ];

            res.json({
                success: true,
                data: tasks,
            });
        } catch (error) {
            console.error('Error getting production tasks:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des tâches',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get task by ID
     * GET /kitchen/tasks/:id
     */
    async getTaskById(req: Request, res: Response): Promise<void> {
        try {
            const taskId = req.params.id;

            // Mock data for now
            const task = {
                id: taskId,
                title: 'Préparation Pizza Margherita',
                type: 'preparation',
                status: 'pending',
                stationId: '1',
                orderId: 'order-123',
                estimatedTime: 15,
                steps: [
                    { id: '1', title: 'Préparer la pâte', completed: false },
                    { id: '2', title: 'Ajouter la sauce', completed: false },
                    { id: '3', title: 'Ajouter le fromage', completed: false },
                ],
                createdAt: new Date().toISOString(),
            };

            res.json({
                success: true,
                data: task,
            });
        } catch (error) {
            console.error('Error getting task by ID:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération de la tâche',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Update task status
     * PATCH /kitchen/tasks/:id/status
     */
    async updateTaskStatus(req: Request, res: Response): Promise<void> {
        try {
            const taskId = req.params.id;
            const { status, notes } = req.body;

            // Mock response for now
            const task = {
                id: taskId,
                status: status,
                notes: notes,
                updatedAt: new Date().toISOString(),
            };

            res.json({
                success: true,
                data: task,
            });
        } catch (error) {
            console.error('Error updating task status:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la mise à jour du statut de la tâche',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Assign task
     * POST /kitchen/tasks/:id/assign
     */
    async assignTask(req: Request, res: Response): Promise<void> {
        try {
            const taskId = req.params.id;
            const { stationId, staffId } = req.body;

            // Mock response for now
            const task = {
                id: taskId,
                stationId: stationId,
                staffId: staffId,
                assignedAt: new Date().toISOString(),
            };

            res.json({
                success: true,
                data: task,
            });
        } catch (error) {
            console.error('Error assigning task:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de l\'assignation de la tâche',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Complete task step
     * POST /kitchen/tasks/:taskId/steps/:stepId/complete
     */
    async completeTaskStep(req: Request, res: Response): Promise<void> {
        try {
            const { taskId, stepId } = req.params;
            const { notes } = req.body;

            // Mock response for now
            const step = {
                taskId: taskId,
                stepId: stepId,
                completed: true,
                completedAt: new Date().toISOString(),
                notes: notes,
            };

            res.json({
                success: true,
                data: step,
            });
        } catch (error) {
            console.error('Error completing task step:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la completion de l\'étape',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    private getAlertMessage(alertType: string, productName: string, currentStock: number): string {
        switch (alertType) {
            case 'out_of_stock':
                return `${productName} est en rupture de stock`;
            case 'critical':
                return `${productName} a un stock critique (${currentStock} restant)`;
            case 'low':
                return `${productName} a un stock bas (${currentStock} restant)`;
            default:
                return `Alerte stock pour ${productName}`;
        }
    }
}