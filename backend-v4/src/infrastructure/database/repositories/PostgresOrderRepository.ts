import { PoolClient } from 'pg';
import { Order } from '../../../domain/entities/Order';
import { IOrderRepository } from '../../../domain/repositories/IOrderRepository';
import { Address } from '../../../domain/value-objects/Address';
import { Money } from '../../../domain/value-objects/Money';
import { OrderStatus } from '../../../domain/value-objects/OrderStatus';
import { NotFoundError } from '../../../shared/errors/NotFoundError';
import { db } from '../PostgresConnection';

export class PostgresOrderRepository implements IOrderRepository {
  async findById(id: string): Promise<Order | null> {
    const rows = await db.query<any>(
      `
      SELECT o.*, 
        json_agg(
          json_build_object(
            'id', oi.id,
            'product_id', oi.product_id,
            'product_name', oi.product_name,
            'product_sku', oi.product_sku,
            'quantity', oi.quantity,
            'unit_price', oi.unit_price,
            'subtotal', oi.subtotal,
            'discount', oi.discount,
            'total', oi.total,
            'notes', oi.notes,
            'metadata', oi.metadata
          )
        ) as items
      FROM orders o
      LEFT JOIN order_items oi ON oi.order_id = o.id
      WHERE o.id = $1 AND o.deleted_at IS NULL
      GROUP BY o.id
      LIMIT 1
      `,
      [id]
    );

    if (rows.length === 0) {
      return null;
    }

    return this.mapRowToOrder(rows[0]);
  }

  async findByOrderNumber(organizationId: string, orderNumber: string): Promise<Order | null> {
    const rows = await db.query<any>(
      `
      SELECT o.*, 
        json_agg(
          json_build_object(
            'id', oi.id,
            'product_id', oi.product_id,
            'product_name', oi.product_name,
            'product_sku', oi.product_sku,
            'quantity', oi.quantity,
            'unit_price', oi.unit_price,
            'subtotal', oi.subtotal,
            'discount', oi.discount,
            'total', oi.total,
            'notes', oi.notes,
            'metadata', oi.metadata
          )
        ) as items
      FROM orders o
      LEFT JOIN order_items oi ON oi.order_id = o.id
      WHERE o.organization_id = $1 
        AND o.order_number = $2 
        AND o.deleted_at IS NULL
      GROUP BY o.id
      LIMIT 1
      `,
      [organizationId, orderNumber]
    );

    if (rows.length === 0) {
      return null;
    }

    return this.mapRowToOrder(rows[0]);
  }

  async findByOrganization(organizationId: string, limit?: number, offset?: number): Promise<Order[]> {
    const rows = await db.query<any>(
      `
      SELECT o.*, 
        json_agg(
          json_build_object(
            'id', oi.id,
            'product_id', oi.product_id,
            'product_name', oi.product_name,
            'product_sku', oi.product_sku,
            'quantity', oi.quantity,
            'unit_price', oi.unit_price,
            'subtotal', oi.subtotal,
            'discount', oi.discount,
            'total', oi.total,
            'notes', oi.notes,
            'metadata', oi.metadata
          )
        ) as items
      FROM orders o
      LEFT JOIN order_items oi ON oi.order_id = o.id
      WHERE o.organization_id = $1 AND o.deleted_at IS NULL
      GROUP BY o.id
      ORDER BY o.created_at DESC
      LIMIT $2 OFFSET $3
      `,
      [organizationId, limit || 100, offset || 0]
    );

    return rows.map((row) => this.mapRowToOrder(row));
  }

  async findByCustomer(customerId: string, limit?: number, offset?: number): Promise<Order[]> {
    const rows = await db.query<any>(
      `
      SELECT o.*, 
        json_agg(
          json_build_object(
            'id', oi.id,
            'product_id', oi.product_id,
            'product_name', oi.product_name,
            'product_sku', oi.product_sku,
            'quantity', oi.quantity,
            'unit_price', oi.unit_price,
            'subtotal', oi.subtotal,
            'discount', oi.discount,
            'total', oi.total,
            'notes', oi.notes,
            'metadata', oi.metadata
          )
        ) as items
      FROM orders o
      LEFT JOIN order_items oi ON oi.order_id = o.id
      WHERE o.customer_id = $1 AND o.deleted_at IS NULL
      GROUP BY o.id
      ORDER BY o.created_at DESC
      LIMIT $2 OFFSET $3
      `,
      [customerId, limit || 100, offset || 0]
    );

    return rows.map((row) => this.mapRowToOrder(row));
  }

  async findByStatus(organizationId: string, status: OrderStatus): Promise<Order[]> {
    const rows = await db.query<any>(
      `
      SELECT o.*, 
        json_agg(
          json_build_object(
            'id', oi.id,
            'product_id', oi.product_id,
            'product_name', oi.product_name,
            'product_sku', oi.product_sku,
            'quantity', oi.quantity,
            'unit_price', oi.unit_price,
            'subtotal', oi.subtotal,
            'discount', oi.discount,
            'total', oi.total,
            'notes', oi.notes,
            'metadata', oi.metadata
          )
        ) as items
      FROM orders o
      LEFT JOIN order_items oi ON oi.order_id = o.id
      WHERE o.organization_id = $1 
        AND o.status = $2 
        AND o.deleted_at IS NULL
      GROUP BY o.id
      ORDER BY o.created_at DESC
      `,
      [organizationId, status.getValue()]
    );

    return rows.map((row) => this.mapRowToOrder(row));
  }

  async create(order: Order): Promise<Order> {
    return await db.transaction(async (client) => {
      const deliveryAddress = order.getDeliveryAddress();

      const orderRows = await client.query(
        `
        INSERT INTO orders (
          id, organization_id, customer_id, order_number, status,
          subtotal, discount, tax, total,
          payment_status, amount_paid, amount_due,
          delivery_address_street, delivery_address_city, delivery_address_state, 
          delivery_address_postal_code, delivery_latitude, delivery_longitude,
          delivery_notes, delivery_priority,
          scheduled_for, notes, metadata
        )
        VALUES (
          $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23
        )
        RETURNING *
        `,
        [
          order.getId(),
          order.getOrganizationId(),
          order.getCustomerId(),
          order.getOrderNumber() || '',
          order.getStatus().getValue(),
          order.getSubtotal().getAmount(),
          order.getDiscount().getAmount(),
          order.getTax().getAmount(),
          order.getTotal().getAmount(),
          order.getPaymentStatus(),
          order.getAmountPaid().getAmount(),
          order.getAmountDue().getAmount(),
          deliveryAddress.street,
          deliveryAddress.city,
          deliveryAddress.state,
          deliveryAddress.postalCode,
          deliveryAddress.coordinates?.latitude || null,
          deliveryAddress.coordinates?.longitude || null,
          order.getDeliveryNotes() || null,
          order.getDeliveryPriority(),
          order.getScheduledFor() || null,
          order.getNotes() || null,
          JSON.stringify(order.getMetadata() || {}),
        ]
      );

      for (const item of order.getItems()) {
        await client.query(
          `
          INSERT INTO order_items (
            id, order_id, product_id, product_name, product_sku,
            quantity, unit_price, subtotal, discount, total,
            notes, metadata
          )
          VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12)
          `,
          [
            item.id,
            order.getId(),
            item.productId,
            item.productName,
            item.productSku || null,
            item.quantity,
            item.unitPrice.getAmount(),
            item.subtotal.getAmount(),
            item.discount.getAmount(),
            item.total.getAmount(),
            item.notes || null,
            JSON.stringify(item.metadata || {}),
          ]
        );
      }

      const result = await client.query(
        `
        SELECT o.*, 
          json_agg(
            json_build_object(
              'id', oi.id,
              'product_id', oi.product_id,
              'product_name', oi.product_name,
              'product_sku', oi.product_sku,
              'quantity', oi.quantity,
              'unit_price', oi.unit_price,
              'subtotal', oi.subtotal,
              'discount', oi.discount,
              'total', oi.total,
              'notes', oi.notes,
              'metadata', oi.metadata
            )
          ) as items
        FROM orders o
        LEFT JOIN order_items oi ON oi.order_id = o.id
        WHERE o.id = $1
        GROUP BY o.id
        `,
        [order.getId()]
      );

      return this.mapRowToOrder(result.rows[0]);
    });
  }

  async update(order: Order): Promise<Order> {
    const deliveryAddress = order.getDeliveryAddress();

    const rows = await db.query<any>(
      `
      UPDATE orders SET
        status = $2,
        subtotal = $3,
        discount = $4,
        tax = $5,
        total = $6,
        payment_status = $7,
        amount_paid = $8,
        amount_due = $9,
        delivery_address_street = $10,
        delivery_address_city = $11,
        delivery_address_state = $12,
        delivery_address_postal_code = $13,
        delivery_latitude = $14,
        delivery_longitude = $15,
        delivery_notes = $16,
        delivery_priority = $17,
        scheduled_for = $18,
        confirmed_at = $19,
        prepared_at = $20,
        delivered_at = $21,
        cancelled_at = $22,
        notes = $23,
        metadata = $24,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      RETURNING *
      `,
      [
        order.getId(),
        order.getStatus().getValue(),
        order.getSubtotal().getAmount(),
        order.getDiscount().getAmount(),
        order.getTax().getAmount(),
        order.getTotal().getAmount(),
        order.getPaymentStatus(),
        order.getAmountPaid().getAmount(),
        order.getAmountDue().getAmount(),
        deliveryAddress.street,
        deliveryAddress.city,
        deliveryAddress.state,
        deliveryAddress.postalCode,
        deliveryAddress.coordinates?.latitude || null,
        deliveryAddress.coordinates?.longitude || null,
        order.getDeliveryNotes() || null,
        order.getDeliveryPriority(),
        order.getScheduledFor() || null,
        order.getConfirmedAt() || null,
        order.getPreparedAt() || null,
        order.getDeliveredAt() || null,
        order.getCancelledAt() || null,
        order.getNotes() || null,
        JSON.stringify(order.getMetadata() || {}),
      ]
    );

    if (rows.length === 0) {
      throw new NotFoundError('Order not found');
    }

    return await this.findById(order.getId()) as Order;
  }

  async delete(id: string): Promise<void> {
    const result = await db.query(
      `
      UPDATE orders SET
        deleted_at = CURRENT_TIMESTAMP,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      `,
      [id]
    );

    if (result.length === 0) {
      throw new NotFoundError('Order not found');
    }
  }

  async updateStatus(orderId: string, status: OrderStatus): Promise<void> {
    await db.query(
      `
      UPDATE orders SET
        status = $2,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      `,
      [orderId, status.getValue()]
    );
  }

  async transaction<T>(callback: (client: PoolClient) => Promise<T>): Promise<T> {
    return db.transaction(callback);
  }

  private mapRowToOrder(row: any): Order {
    const deliveryAddress = Address.create({
      street: row.delivery_address_street,
      city: row.delivery_address_city,
      state: row.delivery_address_state,
      postalCode: row.delivery_address_postal_code,
      country: 'DZ',
      coordinates:
        row.delivery_latitude && row.delivery_longitude
          ? {
              latitude: parseFloat(row.delivery_latitude),
              longitude: parseFloat(row.delivery_longitude),
            }
          : undefined,
    });

    const items = (row.items || [])
      .filter((item: any) => item.id !== null)
      .map((item: any) => ({
        id: item.id,
        productId: item.product_id,
        productName: item.product_name,
        productSku: item.product_sku || undefined,
        quantity: item.quantity,
        unitPrice: Money.fromCents(item.unit_price, 'DZD'),
        subtotal: Money.fromCents(item.subtotal, 'DZD'),
        discount: Money.fromCents(item.discount, 'DZD'),
        total: Money.fromCents(item.total, 'DZD'),
        notes: item.notes || undefined,
        metadata: item.metadata || {},
      }));

    return Order.create(
      {
        organizationId: row.organization_id,
        customerId: row.customer_id,
        orderNumber: row.order_number,
        status: OrderStatus.fromString(row.status),
        items,
        subtotal: Money.fromCents(row.subtotal, 'DZD'),
        discount: Money.fromCents(row.discount, 'DZD'),
        tax: Money.fromCents(row.tax, 'DZD'),
        total: Money.fromCents(row.total, 'DZD'),
        paymentStatus: row.payment_status,
        amountPaid: Money.fromCents(row.amount_paid, 'DZD'),
        amountDue: Money.fromCents(row.amount_due, 'DZD'),
        deliveryAddress,
        deliveryNotes: row.delivery_notes || undefined,
        deliveryPriority: row.delivery_priority,
        scheduledFor: row.scheduled_for ? new Date(row.scheduled_for) : undefined,
        confirmedAt: row.confirmed_at ? new Date(row.confirmed_at) : undefined,
        preparedAt: row.prepared_at ? new Date(row.prepared_at) : undefined,
        deliveredAt: row.delivered_at ? new Date(row.delivered_at) : undefined,
        cancelledAt: row.cancelled_at ? new Date(row.cancelled_at) : undefined,
        notes: row.notes || undefined,
        metadata: row.metadata || {},
        createdAt: new Date(row.created_at),
        updatedAt: new Date(row.updated_at),
      },
      row.id
    );
  }
}
