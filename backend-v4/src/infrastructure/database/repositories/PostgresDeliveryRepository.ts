import { PoolClient } from 'pg';
import { Delivery } from '../../../domain/entities/Delivery';
import { IDeliveryRepository } from '../../../domain/repositories/IDeliveryRepository';
import { Address } from '../../../domain/value-objects/Address';
import { Coordinates } from '../../../domain/value-objects/Coordinates';
import { NotFoundError } from '../../../shared/errors/NotFoundError';
import { db } from '../PostgresConnection';

export class PostgresDeliveryRepository implements IDeliveryRepository {
  async findById(id: string): Promise<Delivery | null> {
    const rows = await db.query<any>(
      `
      SELECT * FROM deliveries
      WHERE id = $1 AND deleted_at IS NULL
      LIMIT 1
      `,
      [id]
    );

    if (rows.length === 0) {
      return null;
    }

    return this.mapRowToDelivery(rows[0]);
  }

  async findByDeliveryNumber(organizationId: string, deliveryNumber: string): Promise<Delivery | null> {
    const rows = await db.query<any>(
      `
      SELECT * FROM deliveries
      WHERE organization_id = $1 
        AND delivery_number = $2 
        AND deleted_at IS NULL
      LIMIT 1
      `,
      [organizationId, deliveryNumber]
    );

    if (rows.length === 0) {
      return null;
    }

    return this.mapRowToDelivery(rows[0]);
  }

  async findByOrder(orderId: string): Promise<Delivery | null> {
    const rows = await db.query<any>(
      `
      SELECT * FROM deliveries
      WHERE order_id = $1 AND deleted_at IS NULL
      LIMIT 1
      `,
      [orderId]
    );

    if (rows.length === 0) {
      return null;
    }

    return this.mapRowToDelivery(rows[0]);
  }

  async findByDeliverer(delivererId: string, limit?: number, offset?: number): Promise<Delivery[]> {
    const rows = await db.query<any>(
      `
      SELECT * FROM deliveries
      WHERE deliverer_id = $1 AND deleted_at IS NULL
      ORDER BY created_at DESC
      LIMIT $2 OFFSET $3
      `,
      [delivererId, limit || 100, offset || 0]
    );

    return rows.map((row) => this.mapRowToDelivery(row));
  }

  async findActive(organizationId: string): Promise<Delivery[]> {
    const rows = await db.query<any>(
      `
      SELECT * FROM deliveries
      WHERE organization_id = $1
        AND status IN ('assigned', 'picked_up', 'in_transit', 'arrived')
        AND deleted_at IS NULL
      ORDER BY created_at ASC
      `,
      [organizationId]
    );

    return rows.map((row) => this.mapRowToDelivery(row));
  }

  async findByStatus(organizationId: string, status: string): Promise<Delivery[]> {
    const rows = await db.query<any>(
      `
      SELECT * FROM deliveries
      WHERE organization_id = $1
        AND status = $2
        AND deleted_at IS NULL
      ORDER BY created_at DESC
      `,
      [organizationId, status]
    );

    return rows.map((row) => this.mapRowToDelivery(row));
  }

  async create(delivery: Delivery): Promise<Delivery> {
    const deliveryAddress = delivery.getDeliveryAddress();

    const rows = await db.query<any>(
      `
      INSERT INTO deliveries (
        id, organization_id, order_id, deliverer_id, delivery_number, status,
        delivery_address_street, delivery_address_city, 
        delivery_latitude, delivery_longitude,
        estimated_distance, estimated_duration,
        notes, metadata
      )
      VALUES (
        $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14
      )
      RETURNING *
      `,
      [
        delivery.getId(),
        delivery.getOrganizationId(),
        delivery.getOrderId(),
        delivery.getDelivererId() || null,
        delivery.getDeliveryNumber() || '',
        delivery.getStatus(),
        deliveryAddress.street,
        deliveryAddress.city,
        deliveryAddress.coordinates?.latitude || null,
        deliveryAddress.coordinates?.longitude || null,
        delivery.getEstimatedDistance() || null,
        delivery.getEstimatedDuration() || null,
        delivery.getNotes() || null,
        JSON.stringify(delivery.getMetadata() || {}),
      ]
    );

    return this.mapRowToDelivery(rows[0]);
  }

  async update(delivery: Delivery): Promise<Delivery> {
    const deliveryAddress = delivery.getDeliveryAddress();
    const proof = delivery.getProofOfDelivery();

    const rows = await db.query<any>(
      `
      UPDATE deliveries SET
        deliverer_id = $2,
        status = $3,
        delivery_address_street = $4,
        delivery_address_city = $5,
        delivery_latitude = $6,
        delivery_longitude = $7,
        estimated_distance = $8,
        estimated_duration = $9,
        actual_distance = $10,
        actual_duration = $11,
        assigned_at = $12,
        picked_up_at = $13,
        started_at = $14,
        arrived_at = $15,
        delivered_at = $16,
        failed_at = $17,
        cancelled_at = $18,
        proof_type = $19,
        proof_signature_url = $20,
        proof_photo_url = $21,
        proof_recipient_name = $22,
        proof_notes = $23,
        failure_reason = $24,
        failure_notes = $25,
        notes = $26,
        metadata = $27,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      RETURNING *
      `,
      [
        delivery.getId(),
        delivery.getDelivererId() || null,
        delivery.getStatus(),
        deliveryAddress.street,
        deliveryAddress.city,
        deliveryAddress.coordinates?.latitude || null,
        deliveryAddress.coordinates?.longitude || null,
        delivery.getEstimatedDistance() || null,
        delivery.getEstimatedDuration() || null,
        delivery.getActualDistance() || null,
        delivery.getActualDuration() || null,
        delivery.getAssignedAt() || null,
        delivery.getPickedUpAt() || null,
        delivery.getStartedAt() || null,
        delivery.getArrivedAt() || null,
        delivery.getDeliveredAt() || null,
        delivery.getFailedAt() || null,
        delivery.getCancelledAt() || null,
        proof?.type || null,
        proof?.signatureUrl || null,
        proof?.photoUrl || null,
        proof?.recipientName || null,
        proof?.notes || null,
        delivery.getFailureReason() || null,
        delivery.getFailureNotes() || null,
        delivery.getNotes() || null,
        JSON.stringify(delivery.getMetadata() || {}),
      ]
    );

    if (rows.length === 0) {
      throw new NotFoundError('Delivery not found');
    }

    return this.mapRowToDelivery(rows[0]);
  }

  async delete(id: string): Promise<void> {
    const result = await db.query(
      `
      UPDATE deliveries SET
        deleted_at = CURRENT_TIMESTAMP,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      `,
      [id]
    );

    if (result.length === 0) {
      throw new NotFoundError('Delivery not found');
    }
  }

  async updateStatus(deliveryId: string, status: string): Promise<void> {
    const statusField = this.getStatusDateField(status);
    
    await db.query(
      `
      UPDATE deliveries SET
        status = $2,
        ${statusField} = CURRENT_TIMESTAMP,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      `,
      [deliveryId, status]
    );
  }

  async assignDeliverer(deliveryId: string, delivererId: string): Promise<void> {
    await db.query(
      `
      UPDATE deliveries SET
        deliverer_id = $2,
        status = 'assigned',
        assigned_at = CURRENT_TIMESTAMP,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      `,
      [deliveryId, delivererId]
    );
  }

  async recordTracking(deliveryId: string, delivererId: string, location: Coordinates): Promise<void> {
    await db.query(
      `
      INSERT INTO delivery_tracking (
        delivery_id, deliverer_id, latitude, longitude, recorded_at
      )
      VALUES ($1, $2, $3, $4, CURRENT_TIMESTAMP)
      `,
      [deliveryId, delivererId, location.latitude, location.longitude]
    );
  }

  async getTrackingHistory(deliveryId: string): Promise<Array<{ location: Coordinates; timestamp: Date }>> {
    const rows = await db.query<any>(
      `
      SELECT latitude, longitude, recorded_at
      FROM delivery_tracking
      WHERE delivery_id = $1
      ORDER BY recorded_at ASC
      `,
      [deliveryId]
    );

    return rows.map((row) => ({
      location: Coordinates.create(parseFloat(row.latitude), parseFloat(row.longitude)),
      timestamp: new Date(row.recorded_at),
    }));
  }

  async getLatestLocation(deliveryId: string): Promise<Coordinates | null> {
    const rows = await db.query<any>(
      `
      SELECT latitude, longitude
      FROM delivery_tracking
      WHERE delivery_id = $1
      ORDER BY recorded_at DESC
      LIMIT 1
      `,
      [deliveryId]
    );

    if (rows.length === 0) {
      return null;
    }

    return Coordinates.create(parseFloat(rows[0].latitude), parseFloat(rows[0].longitude));
  }

  async transaction<T>(callback: (client: PoolClient) => Promise<T>): Promise<T> {
    return db.transaction(callback);
  }

  private getStatusDateField(status: string): string {
    const mapping: Record<string, string> = {
      assigned: 'assigned_at',
      picked_up: 'picked_up_at',
      in_transit: 'started_at',
      arrived: 'arrived_at',
      delivered: 'delivered_at',
      failed: 'failed_at',
      cancelled: 'cancelled_at',
    };
    return mapping[status] || 'updated_at';
  }

  private mapRowToDelivery(row: any): Delivery {
    const deliveryAddress = Address.create({
      street: row.delivery_address_street,
      city: row.delivery_address_city,
      state: '',
      postalCode: '',
      country: 'DZ',
      coordinates:
        row.delivery_latitude && row.delivery_longitude
          ? Coordinates.create(parseFloat(row.delivery_latitude), parseFloat(row.delivery_longitude))
          : undefined,
    });

    const proofOfDelivery = row.proof_type
      ? {
          type: row.proof_type,
          signatureUrl: row.proof_signature_url || undefined,
          photoUrl: row.proof_photo_url || undefined,
          recipientName: row.proof_recipient_name || undefined,
          notes: row.proof_notes || undefined,
        }
      : undefined;

    return Delivery.create(
      {
        organizationId: row.organization_id,
        orderId: row.order_id,
        delivererId: row.deliverer_id || undefined,
        deliveryNumber: row.delivery_number,
        status: row.status,
        deliveryAddress,
        estimatedDistance: row.estimated_distance || undefined,
        estimatedDuration: row.estimated_duration || undefined,
        actualDistance: row.actual_distance || undefined,
        actualDuration: row.actual_duration || undefined,
        assignedAt: row.assigned_at ? new Date(row.assigned_at) : undefined,
        pickedUpAt: row.picked_up_at ? new Date(row.picked_up_at) : undefined,
        startedAt: row.started_at ? new Date(row.started_at) : undefined,
        arrivedAt: row.arrived_at ? new Date(row.arrived_at) : undefined,
        deliveredAt: row.delivered_at ? new Date(row.delivered_at) : undefined,
        failedAt: row.failed_at ? new Date(row.failed_at) : undefined,
        cancelledAt: row.cancelled_at ? new Date(row.cancelled_at) : undefined,
        proofOfDelivery,
        failureReason: row.failure_reason || undefined,
        failureNotes: row.failure_notes || undefined,
        notes: row.notes || undefined,
        metadata: row.metadata || {},
        createdAt: new Date(row.created_at),
        updatedAt: new Date(row.updated_at),
      },
      row.id
    );
  }
}
