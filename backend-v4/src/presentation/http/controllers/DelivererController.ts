import { Request, Response } from 'express';
import {
    CompleteDeliveryUseCase,
    RecordTrackingUseCase,
    UpdateDeliveryStatusUseCase,
} from '../../../application/use-cases/deliveries';
import { db } from '../../../infrastructure/database/PostgresConnection';
import {
    PostgresDeliveryRepository,
    PostgresUserRepository,
} from '../../../infrastructure/database/repositories';

export class DelivererController {
    private updateDeliveryStatusUseCase: UpdateDeliveryStatusUseCase;
    private completeDeliveryUseCase: CompleteDeliveryUseCase;
    private recordTrackingUseCase: RecordTrackingUseCase;

    constructor() {
        // Initialize repositories
        const deliveryRepository = new PostgresDeliveryRepository();
        const userRepository = new PostgresUserRepository();

        // Initialize use cases
        this.updateDeliveryStatusUseCase = new UpdateDeliveryStatusUseCase(deliveryRepository);
        this.completeDeliveryUseCase = new CompleteDeliveryUseCase(deliveryRepository);
        this.recordTrackingUseCase = new RecordTrackingUseCase(deliveryRepository);
    }

    /**
     * Get deliverer's assigned deliveries
     * GET /deliverer/deliveries
     */
    async getDeliveries(req: Request, res: Response): Promise<void> {
        try {
            const delivererId = req.user!.userId;
            const status = req.query.status as string;
            const date = req.query.date as string;

            let whereClause = 'WHERE d.deliverer_id = $1 AND d.deleted_at IS NULL';
            const params: any[] = [delivererId];
            let paramIndex = 2;

            if (status) {
                whereClause += ` AND d.status = $${paramIndex}`;
                params.push(status);
                paramIndex++;
            }

            if (date) {
                const targetDate = new Date(date);
                whereClause += ` AND DATE(d.created_at) = $${paramIndex}`;
                params.push(targetDate.toISOString().split('T')[0]);
                paramIndex++;
            }

            const query = `
        SELECT d.id, d.delivery_number, d.status, d.created_at,
               d.estimated_distance, d.estimated_duration,
               d.delivery_address_street, d.delivery_address_city,
               o.order_number, o.total as order_total,
               u.first_name || ' ' || u.last_name as customer_name
        FROM deliveries d
        JOIN orders o ON d.order_id = o.id
        LEFT JOIN users u ON o.customer_id = u.id
        ${whereClause}
        ORDER BY d.created_at DESC
      `;

            const result = await db.query(query, params);

            const deliveries = result.map((row: any) => ({
                id: row.id,
                deliveryNumber: row.delivery_number,
                status: row.status,
                orderNumber: row.order_number,
                orderTotal: parseFloat(row.order_total) / 100,
                customerName: row.customer_name,
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
            console.error('Error getting deliverer deliveries:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des livraisons',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get active delivery for deliverer
     * GET /deliverer/deliveries/active
     */
    async getActiveDelivery(req: Request, res: Response): Promise<void> {
        try {
            const delivererId = req.user!.userId;

            const result = await db.query(`
        SELECT d.id, d.delivery_number, d.status, d.created_at,
               d.estimated_distance, d.estimated_duration,
               d.delivery_address_street, d.delivery_address_city,
               o.order_number, o.total as order_total,
               u.first_name || ' ' || u.last_name as customer_name
        FROM deliveries d
        JOIN orders o ON d.order_id = o.id
        LEFT JOIN users u ON o.customer_id = u.id
        WHERE d.deliverer_id = $1 
        AND d.status IN ('assigned', 'picked_up', 'in_transit')
        AND d.deleted_at IS NULL
        ORDER BY d.created_at ASC
        LIMIT 1
      `, [delivererId]);

            if (result.length === 0) {
                res.json({
                    success: true,
                    data: null,
                });
                return;
            }

            const row = result[0];
            const delivery = {
                id: row.id,
                deliveryNumber: row.delivery_number,
                status: row.status,
                orderNumber: row.order_number,
                orderTotal: parseFloat(row.order_total) / 100,
                customerName: row.customer_name,
                address: {
                    street: row.delivery_address_street,
                    city: row.delivery_address_city,
                },
                estimatedDistance: row.estimated_distance,
                estimatedDuration: row.estimated_duration,
                createdAt: row.created_at,
            };

            res.json({
                success: true,
                data: delivery,
            });
        } catch (error) {
            console.error('Error getting active delivery:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération de la livraison active',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get delivery by ID
     * GET /deliverer/deliveries/:id
     */
    async getDeliveryById(req: Request, res: Response): Promise<void> {
        try {
            const deliveryId = req.params.id;
            const delivererId = req.user!.userId;

            const result = await db.query(`
        SELECT d.*, o.order_number, o.total as order_total,
               u.first_name || ' ' || u.last_name as customer_name,
               u.phone as customer_phone
        FROM deliveries d
        JOIN orders o ON d.order_id = o.id
        LEFT JOIN users u ON o.customer_id = u.id
        WHERE d.id = $1 AND d.deliverer_id = $2 AND d.deleted_at IS NULL
      `, [deliveryId, delivererId]);

            if (result.length === 0) {
                res.status(404).json({
                    success: false,
                    error: 'Delivery not found',
                    code: 'NOT_FOUND',
                });
                return;
            }

            const row = result[0];
            const delivery = {
                id: row.id,
                deliveryNumber: row.delivery_number,
                status: row.status,
                orderNumber: row.order_number,
                orderTotal: parseFloat(row.order_total) / 100,
                customerName: row.customer_name,
                customerPhone: row.customer_phone,
                address: {
                    street: row.delivery_address_street,
                    city: row.delivery_address_city,
                    latitude: row.delivery_latitude,
                    longitude: row.delivery_longitude,
                },
                estimatedDistance: row.estimated_distance,
                estimatedDuration: row.estimated_duration,
                actualDistance: row.actual_distance,
                actualDuration: row.actual_duration,
                assignedAt: row.assigned_at,
                pickedUpAt: row.picked_up_at,
                startedAt: row.started_at,
                arrivedAt: row.arrived_at,
                deliveredAt: row.delivered_at,
                proofType: row.proof_type,
                proofSignatureUrl: row.proof_signature_url,
                proofPhotoUrl: row.proof_photo_url,
                proofRecipientName: row.proof_recipient_name,
                proofNotes: row.proof_notes,
                notes: row.notes,
                createdAt: row.created_at,
            };

            res.json({
                success: true,
                data: delivery,
            });
        } catch (error) {
            console.error('Error getting delivery by ID:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération de la livraison',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get deliverer stats
     * GET /deliverer/stats
     */
    async getStats(req: Request, res: Response): Promise<void> {
        try {
            const delivererId = req.user!.userId;

            // Get delivery stats
            const statsResult = await db.query(`
        SELECT 
          COUNT(*) as total_deliveries,
          COUNT(CASE WHEN status = 'delivered' THEN 1 END) as completed_deliveries,
          COUNT(CASE WHEN status IN ('assigned', 'picked_up', 'in_transit') THEN 1 END) as active_deliveries,
          COALESCE(AVG(CASE WHEN actual_duration IS NOT NULL THEN actual_duration END), 0) as avg_delivery_time,
          COALESCE(SUM(CASE WHEN status = 'delivered' THEN 
            (SELECT total FROM orders WHERE id = deliveries.order_id) 
          END), 0) as total_earnings
        FROM deliveries
        WHERE deliverer_id = $1 AND deleted_at IS NULL
      `, [delivererId]);

            const row = statsResult[0];
            const stats = {
                totalDeliveries: parseInt(row.total_deliveries) || 0,
                completedDeliveries: parseInt(row.completed_deliveries) || 0,
                activeDeliveries: parseInt(row.active_deliveries) || 0,
                averageDeliveryTime: parseFloat(row.avg_delivery_time) || 0,
                totalEarnings: parseFloat(row.total_earnings) / 100 || 0, // Convert from centimes
                completionRate: row.total_deliveries > 0 ?
                    (parseInt(row.completed_deliveries) / parseInt(row.total_deliveries)) * 100 : 0,
            };

            res.json({
                success: true,
                data: stats,
            });
        } catch (error) {
            console.error('Error getting deliverer stats:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la récupération des statistiques',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Update delivery status
     * PATCH /deliverer/deliveries/:id/status
     */
    async updateDeliveryStatus(req: Request, res: Response): Promise<void> {
        try {
            const deliveryId = req.params.id;
            const { status } = req.body;

            const result = await this.updateDeliveryStatusUseCase.execute({
                deliveryId,
                status,
                userId: req.user!.userId,
                userRole: req.user!.role,
                organizationId: req.user!.organizationId,
            });

            res.json({
                success: true,
                data: result,
            });
        } catch (error) {
            console.error('Error updating delivery status:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la mise à jour du statut',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Start delivery
     * POST /deliverer/deliveries/:id/start
     */
    async startDelivery(req: Request, res: Response): Promise<void> {
        try {
            const deliveryId = req.params.id;

            const result = await this.updateDeliveryStatusUseCase.execute({
                deliveryId,
                status: 'in_transit',
                userId: req.user!.userId,
                userRole: req.user!.role,
                organizationId: req.user!.organizationId,
            });

            res.json({
                success: true,
                data: result,
            });
        } catch (error) {
            console.error('Error starting delivery:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors du démarrage de la livraison',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Complete delivery
     * POST /deliverer/deliveries/:id/complete
     */
    async completeDelivery(req: Request, res: Response): Promise<void> {
        try {
            const deliveryId = req.params.id;
            const { notes, signature_url, photo_url } = req.body;

            const result = await this.completeDeliveryUseCase.execute({
                deliveryId,
                userId: req.user!.userId,
                userRole: req.user!.role,
                organizationId: req.user!.organizationId,
                proofOfDelivery: {
                    type: 'signature', // Default type
                    notes,
                    signatureUrl: signature_url,
                    photoUrl: photo_url,
                },
            });

            res.json({
                success: true,
                data: result,
            });
        } catch (error) {
            console.error('Error completing delivery:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la finalisation de la livraison',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Update deliverer location
     * POST /deliverer/location
     */
    async updateLocation(req: Request, res: Response): Promise<void> {
        try {
            const { latitude, longitude } = req.body;
            const delivererId = req.user!.userId;

            // Update user location
            await db.query(`
        UPDATE users 
        SET latitude = $1, longitude = $2, updated_at = NOW()
        WHERE id = $3 AND role = 'deliverer'
      `, [latitude, longitude, delivererId]);

            res.json({
                success: true,
                message: 'Location updated successfully',
            });
        } catch (error) {
            console.error('Error updating location:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors de la mise à jour de la position',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Get route between two points
     * POST /deliverer/route
     */
    async getRoute(req: Request, res: Response): Promise<void> {
        try {
            const { start_lat, start_lng, end_lat, end_lng } = req.body;

            // For now, return a simple route calculation
            // This can be enhanced with actual routing service integration
            const distance = this.calculateDistance(start_lat, start_lng, end_lat, end_lng);
            const estimatedTime = Math.round(distance * 2); // Rough estimate: 2 minutes per km

            const route = {
                distance: Math.round(distance * 1000), // Convert to meters
                duration: estimatedTime * 60, // Convert to seconds
                polyline: '', // Would be filled by actual routing service
                steps: [],
            };

            res.json({
                success: true,
                data: route,
            });
        } catch (error) {
            console.error('Error getting route:', error);
            res.status(500).json({
                success: false,
                error: 'Erreur lors du calcul de l\'itinéraire',
                code: 'INTERNAL_ERROR',
            });
        }
    }

    /**
     * Calculate distance between two points using Haversine formula
     */
    private calculateDistance(lat1: number, lon1: number, lat2: number, lon2: number): number {
        const R = 6371; // Radius of the Earth in kilometers
        const dLat = this.deg2rad(lat2 - lat1);
        const dLon = this.deg2rad(lon2 - lon1);
        const a =
            Math.sin(dLat / 2) * Math.sin(dLat / 2) +
            Math.cos(this.deg2rad(lat1)) * Math.cos(this.deg2rad(lat2)) *
            Math.sin(dLon / 2) * Math.sin(dLon / 2);
        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        const d = R * c; // Distance in kilometers
        return d;
    }

    private deg2rad(deg: number): number {
        return deg * (Math.PI / 180);
    }
}