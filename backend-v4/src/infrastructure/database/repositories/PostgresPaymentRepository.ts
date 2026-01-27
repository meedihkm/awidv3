import { PoolClient } from 'pg';
import { Payment } from '../../../domain/entities/Payment';
import { IPaymentRepository } from '../../../domain/repositories/IPaymentRepository';
import { Money } from '../../../domain/value-objects/Money';
import { NotFoundError } from '../../../shared/errors/NotFoundError';
import { db } from '../PostgresConnection';

export class PostgresPaymentRepository implements IPaymentRepository {
  async findById(id: string): Promise<Payment | null> {
    const rows = await db.query<any>(
      `
      SELECT p.*,
        json_agg(
          json_build_object(
            'order_id', pa.order_id,
            'amount', pa.amount
          )
        ) FILTER (WHERE pa.order_id IS NOT NULL) as allocations
      FROM payments p
      LEFT JOIN payment_allocations pa ON pa.payment_id = p.id
      WHERE p.id = $1 AND p.deleted_at IS NULL
      GROUP BY p.id
      LIMIT 1
      `,
      [id]
    );

    if (rows.length === 0) {
      return null;
    }

    return this.mapRowToPayment(rows[0]);
  }

  async findByPaymentNumber(organizationId: string, paymentNumber: string): Promise<Payment | null> {
    const rows = await db.query<any>(
      `
      SELECT p.*,
        json_agg(
          json_build_object(
            'order_id', pa.order_id,
            'amount', pa.amount
          )
        ) FILTER (WHERE pa.order_id IS NOT NULL) as allocations
      FROM payments p
      LEFT JOIN payment_allocations pa ON pa.payment_id = p.id
      WHERE p.organization_id = $1 
        AND p.payment_number = $2 
        AND p.deleted_at IS NULL
      GROUP BY p.id
      LIMIT 1
      `,
      [organizationId, paymentNumber]
    );

    if (rows.length === 0) {
      return null;
    }

    return this.mapRowToPayment(rows[0]);
  }

  async findByCustomer(customerId: string, limit?: number, offset?: number): Promise<Payment[]> {
    const rows = await db.query<any>(
      `
      SELECT p.*,
        json_agg(
          json_build_object(
            'order_id', pa.order_id,
            'amount', pa.amount
          )
        ) FILTER (WHERE pa.order_id IS NOT NULL) as allocations
      FROM payments p
      LEFT JOIN payment_allocations pa ON pa.payment_id = p.id
      WHERE p.customer_id = $1 AND p.deleted_at IS NULL
      GROUP BY p.id
      ORDER BY p.payment_date DESC
      LIMIT $2 OFFSET $3
      `,
      [customerId, limit || 100, offset || 0]
    );

    return rows.map((row) => this.mapRowToPayment(row));
  }

  async findByOrder(orderId: string): Promise<Payment[]> {
    const rows = await db.query<any>(
      `
      SELECT p.*,
        json_agg(
          json_build_object(
            'order_id', pa.order_id,
            'amount', pa.amount
          )
        ) FILTER (WHERE pa.order_id IS NOT NULL) as allocations
      FROM payments p
      LEFT JOIN payment_allocations pa ON pa.payment_id = p.id
      WHERE p.id IN (
        SELECT payment_id FROM payment_allocations WHERE order_id = $1
      )
      AND p.deleted_at IS NULL
      GROUP BY p.id
      ORDER BY p.payment_date DESC
      `,
      [orderId]
    );

    return rows.map((row) => this.mapRowToPayment(row));
  }

  async findByOrganization(organizationId: string, limit?: number, offset?: number): Promise<Payment[]> {
    const rows = await db.query<any>(
      `
      SELECT p.*,
        json_agg(
          json_build_object(
            'order_id', pa.order_id,
            'amount', pa.amount
          )
        ) FILTER (WHERE pa.order_id IS NOT NULL) as allocations
      FROM payments p
      LEFT JOIN payment_allocations pa ON pa.payment_id = p.id
      WHERE p.organization_id = $1 AND p.deleted_at IS NULL
      GROUP BY p.id
      ORDER BY p.payment_date DESC
      LIMIT $2 OFFSET $3
      `,
      [organizationId, limit || 100, offset || 0]
    );

    return rows.map((row) => this.mapRowToPayment(row));
  }

  async create(payment: Payment): Promise<Payment> {
    return await db.transaction(async (client) => {
      const rows = await client.query(
        `
        INSERT INTO payments (
          id, organization_id, customer_id, delivery_id, payment_number,
          amount, payment_method,
          check_number, check_bank, check_date, transfer_reference,
          status, payment_date, notes, metadata
        )
        VALUES (
          $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15
        )
        RETURNING *
        `,
        [
          payment.getId(),
          payment.getOrganizationId(),
          payment.getCustomerId(),
          payment.getDeliveryId() || null,
          payment.getPaymentNumber() || '',
          payment.getAmount().getAmount(),
          payment.getPaymentMethod(),
          payment.getCheckNumber() || null,
          payment.getCheckBank() || null,
          payment.getCheckDate() || null,
          payment.getTransferReference() || null,
          payment.getStatus(),
          payment.getPaymentDate(),
          payment.getNotes() || null,
          JSON.stringify(payment.getMetadata() || {}),
        ]
      );

      for (const allocation of payment.getAllocations()) {
        await client.query(
          `
          INSERT INTO payment_allocations (payment_id, order_id, amount)
          VALUES ($1, $2, $3)
          `,
          [payment.getId(), allocation.orderId, allocation.amount.getAmount()]
        );
      }

      const result = await client.query(
        `
        SELECT p.*,
          json_agg(
            json_build_object(
              'order_id', pa.order_id,
              'amount', pa.amount
            )
          ) FILTER (WHERE pa.order_id IS NOT NULL) as allocations
        FROM payments p
        LEFT JOIN payment_allocations pa ON pa.payment_id = p.id
        WHERE p.id = $1
        GROUP BY p.id
        `,
        [payment.getId()]
      );

      return this.mapRowToPayment(result.rows[0]);
    });
  }

  async update(payment: Payment): Promise<Payment> {
    const rows = await db.query<any>(
      `
      UPDATE payments SET
        amount = $2,
        payment_method = $3,
        check_number = $4,
        check_bank = $5,
        check_date = $6,
        transfer_reference = $7,
        status = $8,
        payment_date = $9,
        confirmed_at = $10,
        cancelled_at = $11,
        refunded_at = $12,
        notes = $13,
        metadata = $14,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      RETURNING *
      `,
      [
        payment.getId(),
        payment.getAmount().getAmount(),
        payment.getPaymentMethod(),
        payment.getCheckNumber() || null,
        payment.getCheckBank() || null,
        payment.getCheckDate() || null,
        payment.getTransferReference() || null,
        payment.getStatus(),
        payment.getPaymentDate(),
        payment.getConfirmedAt() || null,
        payment.getCancelledAt() || null,
        payment.getRefundedAt() || null,
        payment.getNotes() || null,
        JSON.stringify(payment.getMetadata() || {}),
      ]
    );

    if (rows.length === 0) {
      throw new NotFoundError('Payment not found');
    }

    return await this.findById(payment.getId()) as Payment;
  }

  async delete(id: string): Promise<void> {
    const result = await db.query(
      `
      UPDATE payments SET
        deleted_at = CURRENT_TIMESTAMP,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      `,
      [id]
    );

    if (result.length === 0) {
      throw new NotFoundError('Payment not found');
    }
  }

  async allocateToOrder(paymentId: string, orderId: string, amount: Money): Promise<void> {
    await db.query(
      `
      INSERT INTO payment_allocations (payment_id, order_id, amount)
      VALUES ($1, $2, $3)
      ON CONFLICT (payment_id, order_id)
      DO UPDATE SET
        amount = $3,
        updated_at = CURRENT_TIMESTAMP
      `,
      [paymentId, orderId, amount.getAmount()]
    );
  }

  async removeAllocation(paymentId: string, orderId: string): Promise<void> {
    await db.query(
      `
      DELETE FROM payment_allocations
      WHERE payment_id = $1 AND order_id = $2
      `,
      [paymentId, orderId]
    );
  }

  async confirm(paymentId: string): Promise<void> {
    await db.query(
      `
      UPDATE payments SET
        status = 'confirmed',
        confirmed_at = CURRENT_TIMESTAMP,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      `,
      [paymentId]
    );
  }

  async cancel(paymentId: string): Promise<void> {
    await db.query(
      `
      UPDATE payments SET
        status = 'cancelled',
        cancelled_at = CURRENT_TIMESTAMP,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      `,
      [paymentId]
    );
  }

  async refund(paymentId: string): Promise<void> {
    await db.query(
      `
      UPDATE payments SET
        status = 'refunded',
        refunded_at = CURRENT_TIMESTAMP,
        updated_at = CURRENT_TIMESTAMP
      WHERE id = $1 AND deleted_at IS NULL
      `,
      [paymentId]
    );
  }

  async transaction<T>(callback: (client: PoolClient) => Promise<T>): Promise<T> {
    return db.transaction(callback);
  }

  private mapRowToPayment(row: any): Payment {
    const allocations = (row.allocations || [])
      .filter((alloc: any) => alloc.order_id !== null)
      .map((alloc: any) => ({
        orderId: alloc.order_id,
        amount: Money.fromCents(alloc.amount, 'DZD'),
      }));

    return Payment.create(
      {
        organizationId: row.organization_id,
        customerId: row.customer_id,
        deliveryId: row.delivery_id || undefined,
        paymentNumber: row.payment_number,
        amount: Money.fromCents(row.amount, 'DZD'),
        paymentMethod: row.payment_method,
        checkNumber: row.check_number || undefined,
        checkBank: row.check_bank || undefined,
        checkDate: row.check_date ? new Date(row.check_date) : undefined,
        transferReference: row.transfer_reference || undefined,
        status: row.status,
        paymentDate: new Date(row.payment_date),
        confirmedAt: row.confirmed_at ? new Date(row.confirmed_at) : undefined,
        cancelledAt: row.cancelled_at ? new Date(row.cancelled_at) : undefined,
        refundedAt: row.refunded_at ? new Date(row.refunded_at) : undefined,
        allocations,
        notes: row.notes || undefined,
        metadata: row.metadata || {},
        createdAt: new Date(row.created_at),
        updatedAt: new Date(row.updated_at),
      },
      row.id
    );
  }
}
