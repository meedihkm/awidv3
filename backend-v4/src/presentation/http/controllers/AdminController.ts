import { Request, Response } from 'express';
import { db } from '../../../infrastructure/database/PostgresConnection';

export class AdminController {
    constructor() { }

    /**
     * Get dashboard statistics
     * GET /admin/stats
     */
    async getStats(req: Request, res: Response): Promise<void> {
        try {
            // Get total revenue (sum of all delivered orders in DZD)
            const revenueResult = await db.query(`
        SELECT COALESCE(SUM(total), 0) as total_revenue_centimes
        FROM orders 
        WHERE status = 'delivered' AND payment_status = 'paid' AND deleted_at IS NULL
      `);

            // Get order counts by status
            const ordersResult = await db.query(`
        SELECT 
          COUNT(*) as total_orders,
          COUNT(CASE WHEN status = 'pending' THEN 1 END) as pending_orders,
          COUNT(CASE WHEN status = 'delivered' THEN 1 END) as completed_orders
        FROM orders
        WHERE deleted_at IS NULL
      `);

            // Get active deliveries count
            const deliveriesResult = await db.query(`
        SELECT COUNT(*) as active_deliveries
        FROM deliveries 
        WHERE status IN ('assigned', 'picked_up', 'in_transit') AND deleted_at IS NULL
      `);

            // Get active deliverers count
            const deliverersResult = await db.query(`
        SELECT COUNT(*) as active_deliverers
        FROM users 
        WHERE role = 'deliverer' AND is_available = true
      `);

            // Calculate average order value (in DZD)
            const avgOrderResult = await db.query(`
        SELECT COALESCE(AVG(total), 0) as average_order_value_centimes
        FROM orders 
        WHERE status = 'delivered' AND deleted_at IS NULL
      `);

            const stats = {
                totalRevenue: parseFloat(revenueResult[0].total_revenue_centimes) / 100 || 0, // Convert to DZD
                totalOrders: parseInt(ordersResult[0].total_orders) || 0,
                pendingOrders: parseInt(ordersResult[0].pending_orders) || 0,
                completedOrders: parseInt(ordersResult[0].completed_orders) || 0,
                activeDeliveries: parseInt(deliveriesResult[0].active_deliveries) || 0,
                activeDeliverers: parseInt(deliverersResult[0].active_deliverers) || 0,
                averageOrderValue: parseFloat(avgOrderResult[0].average_order_value_centimes) / 100 || 0, // Convert to DZD
                updatedAt: new Date().toISOString(),
            };

            res.json({
                success: true,
                data: stats,
            });
        } catch (error) {
            console.error('Error getting admin stats:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des statistiques',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get recent orders
     * GET /admin/orders/recent
     */
    async getRecentOrders(req: Request, res: Response): Promise<void> {
        try {
            const page = parseInt(req.query.page as string) || 1;
            const limit = parseInt(req.query.limit as string) || 20;
            const status = req.query.status as string;
            const offset = (page - 1) * limit;

            let whereClause = 'WHERE o.deleted_at IS NULL';
            const params: any[] = [limit, offset];
            let paramIndex = 3;

            if (status) {
                whereClause += ` AND o.status = $${paramIndex}`;
                params.push(status);
                paramIndex++;
            }

            const query = `
        SELECT 
          o.id,
          o.order_number,
          o.status,
          o.total,
          o.created_at,
          u.first_name || ' ' || u.last_name as customer_name,
          org.name as customer_organization,
          d.first_name || ' ' || d.last_name as deliverer_name,
          del.delivered_at as delivery_time,
          (
            SELECT COUNT(*)
            FROM order_items oi
            WHERE oi.order_id = o.id
          ) as items_count
        FROM orders o
        LEFT JOIN users u ON o.customer_id = u.id
        LEFT JOIN organizations org ON u.organization_id = org.id
        LEFT JOIN deliveries del ON del.order_id = o.id
        LEFT JOIN users d ON del.deliverer_id = d.id
        ${whereClause}
        ORDER BY o.created_at DESC
        LIMIT $1 OFFSET $2
      `;

            const result = await db.query(query, params);

            const orders = result.map((row: any) => ({
                id: row.id,
                orderNumber: row.order_number,
                customerName: row.customer_name || 'Client inconnu',
                customerOrganization: row.customer_organization || 'Organisation inconnue',
                status: row.status,
                totalAmount: parseFloat(row.total) / 100 || 0, // Convert to DZD
                itemsCount: parseInt(row.items_count) || 0,
                createdAt: row.created_at,
                delivererName: row.deliverer_name,
                deliveryTime: row.delivery_time,
            }));

            res.json({
                success: true,
                data: orders,
                pagination: {
                    page,
                    limit,
                    total: orders.length,
                },
            });
        } catch (error) {
            console.error('Error getting recent orders:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des commandes',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get deliverers locations
     * GET /admin/deliverers/locations
     */
    async getDeliverersLocations(req: Request, res: Response): Promise<void> {
        try {
            const query = `
        SELECT 
          u.id,
          u.first_name || ' ' || u.last_name as name,
          u.latitude,
          u.longitude,
          CASE 
            WHEN u.is_available = true THEN 'available'
            ELSE 'unavailable'
          END as status,
          (
            SELECT COUNT(*)
            FROM deliveries d
            WHERE d.deliverer_id = u.id 
            AND d.status IN ('assigned', 'picked_up', 'in_transit')
            AND d.deleted_at IS NULL
          ) as active_deliveries,
          u.updated_at as last_update
        FROM users u
        WHERE u.role = 'deliverer'
        AND u.latitude IS NOT NULL 
        AND u.longitude IS NOT NULL
        ORDER BY u.updated_at DESC
      `;

            const result = await db.query(query);

            const locations = result.map((row: any) => ({
                id: row.id,
                name: row.name,
                latitude: parseFloat(row.latitude) || 0,
                longitude: parseFloat(row.longitude) || 0,
                status: row.status,
                activeDeliveries: parseInt(row.active_deliveries) || 0,
                lastUpdate: row.last_update,
            }));

            res.json({
                success: true,
                data: locations,
            });
        } catch (error) {
            console.error('Error getting deliverers locations:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des positions',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get users list
     * GET /admin/users
     */
    async getUsers(req: Request, res: Response): Promise<void> {
        try {
            const page = parseInt(req.query.page as string) || 1;
            const limit = parseInt(req.query.limit as string) || 20;
            const role = req.query.role as string;
            const offset = (page - 1) * limit;

            let whereClause = '';
            const params: any[] = [limit, offset];
            let paramIndex = 3;

            if (role) {
                whereClause = `WHERE u.role = $${paramIndex}`;
                params.push(role);
                paramIndex++;
            }

            const query = `
        SELECT 
          u.id,
          u.email,
          u.first_name,
          u.last_name,
          u.phone,
          u.role,
          u.is_active,
          u.created_at,
          org.name as organization_name
        FROM users u
        LEFT JOIN organizations org ON u.organization_id = org.id
        ${whereClause}
        ORDER BY u.created_at DESC
        LIMIT $1 OFFSET $2
      `;

            const result = await db.query(query, params);

            const users = result.map((row: any) => ({
                id: row.id,
                email: row.email,
                firstName: row.first_name,
                lastName: row.last_name,
                phone: row.phone,
                role: row.role,
                isActive: row.is_active,
                createdAt: row.created_at,
                organizationName: row.organization_name,
            }));

            res.json({
                success: true,
                data: users,
                pagination: {
                    page,
                    limit,
                    total: users.length,
                },
            });
        } catch (error) {
            console.error('Error getting users:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des utilisateurs',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Update user status
     * PUT /admin/users/:id/status
     */
    async updateUserStatus(req: Request, res: Response): Promise<void> {
        try {
            const { id } = req.params;
            const { isActive } = req.body;

            if (typeof isActive !== 'boolean') {
                res.status(400).json({
                    success: false,
                    error: 'Le statut doit être un booléen',
                    code: 'VALIDATION_ERROR',
                });
                return;
            }

            const result = await db.query(
                'UPDATE users SET is_active = $1, updated_at = NOW() WHERE id = $2 RETURNING *',
                [isActive, id]
            );

            if (result.length === 0) {
                res.status(404).json({
                    success: false,
                    error: 'Utilisateur non trouvé',
                    code: 'NOT_FOUND',
                });
                return;
            }

            res.json({
                success: true,
                message: 'Statut utilisateur mis à jour',
                data: {
                    id: result[0].id,
                    isActive: result[0].is_active,
                },
            });
        } catch (error) {
            console.error('Error updating user status:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la mise à jour du statut',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get organizations list
     * GET /admin/organizations
     */
    async getOrganizations(req: Request, res: Response): Promise<void> {
        try {
            const query = `
        SELECT 
          o.id,
          o.name,
          o.type,
          o.address_street,
          o.address_city,
          o.phone,
          o.email,
          o.is_active,
          o.created_at,
          (
            SELECT COUNT(*)
            FROM users u
            WHERE u.organization_id = o.id
          ) as users_count
        FROM organizations o
        ORDER BY o.created_at DESC
      `;

            const result = await db.query(query);

            const organizations = result.map((row: any) => ({
                id: row.id,
                name: row.name,
                type: row.type,
                address: {
                    street: row.address_street,
                    city: row.address_city,
                },
                phone: row.phone,
                email: row.email,
                isActive: row.is_active,
                createdAt: row.created_at,
                usersCount: parseInt(row.users_count) || 0,
            }));

            res.json({
                success: true,
                data: organizations,
            });
        } catch (error) {
            console.error('Error getting organizations:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des organisations',
                code: 'INTERNAL_ERROR',
            });
        }
    }
}