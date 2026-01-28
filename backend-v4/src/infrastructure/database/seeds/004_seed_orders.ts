import { PostgresConnection } from '../PostgresConnection';

export async function seedOrders(db: PostgresConnection): Promise<void> {
    console.log('🌱 Seeding orders...');

    // Get existing users and products
    const usersResult = await db.query('SELECT id, role, organization_id FROM users');
    const productsResult = await db.query('SELECT id, name, base_price FROM products LIMIT 5');

    const customers = usersResult.filter((u: any) => u.role === 'customer');
    const deliverers = usersResult.filter((u: any) => u.role === 'deliverer');
    const products = productsResult;

    if (customers.length === 0 || products.length === 0) {
        console.log('⚠️ No customers or products found, skipping orders seeding');
        return;
    }

    const orders = [
        {
            customer_id: customers[0].id,
            organization_id: customers[0].organization_id,
            status: 'delivered',
            subtotal: 4050, // 40.50 DZD in centimes
            total: 4550, // 45.50 DZD in centimes
            amount_due: 0, // Paid
            payment_status: 'paid',
            delivery_address_street: '123 Rue de la Paix',
            delivery_address_city: 'Alger',
            delivery_address_state: 'Alger',
            delivery_address_postal_code: '16000',
            notes: 'Commande test complétée',
            created_at: new Date(Date.now() - 2 * 24 * 60 * 60 * 1000), // 2 days ago
        },
        {
            customer_id: customers[0].id,
            organization_id: customers[0].organization_id,
            status: 'pending',
            subtotal: 2775, // 27.75 DZD in centimes
            total: 3275, // 32.75 DZD in centimes
            amount_due: 3275, // Unpaid
            payment_status: 'unpaid',
            delivery_address_street: '456 Avenue Mohamed V',
            delivery_address_city: 'Alger',
            delivery_address_state: 'Alger',
            delivery_address_postal_code: '16000',
            notes: 'Commande en attente',
            created_at: new Date(Date.now() - 1 * 60 * 60 * 1000), // 1 hour ago
        },
        {
            customer_id: customers[0].id,
            organization_id: customers[0].organization_id,
            status: 'preparing',
            subtotal: 2390, // 23.90 DZD in centimes
            total: 2890, // 28.90 DZD in centimes
            amount_due: 2890, // Unpaid
            payment_status: 'unpaid',
            delivery_address_street: '789 Boulevard Zighout Youcef',
            delivery_address_city: 'Alger',
            delivery_address_state: 'Alger',
            delivery_address_postal_code: '16000',
            notes: 'En préparation',
            created_at: new Date(Date.now() - 30 * 60 * 1000), // 30 minutes ago
        },
        {
            customer_id: customers[0].id,
            organization_id: customers[0].organization_id,
            status: 'delivered',
            subtotal: 6225, // 62.25 DZD in centimes
            total: 6725, // 67.25 DZD in centimes
            amount_due: 0, // Paid
            payment_status: 'paid',
            delivery_address_street: '321 Rue Didouche Mourad',
            delivery_address_city: 'Alger',
            delivery_address_state: 'Alger',
            delivery_address_postal_code: '16000',
            notes: 'Grande commande complétée',
            created_at: new Date(Date.now() - 5 * 24 * 60 * 60 * 1000), // 5 days ago
        },
        {
            customer_id: customers[0].id,
            organization_id: customers[0].organization_id,
            status: 'ready',
            subtotal: 1450, // 14.50 DZD in centimes
            total: 1950, // 19.50 DZD in centimes
            amount_due: 1950, // Unpaid
            payment_status: 'unpaid',
            delivery_address_street: '654 Rue Ben M\'hidi Larbi',
            delivery_address_city: 'Alger',
            delivery_address_state: 'Alger',
            delivery_address_postal_code: '16000',
            notes: 'Prêt pour livraison',
            created_at: new Date(Date.now() - 15 * 60 * 1000), // 15 minutes ago
        },
    ];

    // Insert orders
    for (const order of orders) {
        const orderResult = await db.query(`
      INSERT INTO orders (
        customer_id, organization_id, status, subtotal, total, amount_due, payment_status,
        delivery_address_street, delivery_address_city, delivery_address_state, 
        delivery_address_postal_code, notes, created_at
      )
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)
      ON CONFLICT DO NOTHING
      RETURNING id
    `, [
            order.customer_id,
            order.organization_id,
            order.status,
            order.subtotal,
            order.total,
            order.amount_due,
            order.payment_status,
            order.delivery_address_street,
            order.delivery_address_city,
            order.delivery_address_state,
            order.delivery_address_postal_code,
            order.notes,
            order.created_at,
        ]);

        if (orderResult.rows.length > 0) {
            const orderId = orderResult.rows[0].id;

            // Add order items (2-3 items per order)
            const itemCount = Math.floor(Math.random() * 2) + 2; // 2-3 items
            let totalItemsPrice = 0;

            for (let i = 0; i < itemCount; i++) {
                const product = products[i % products.length];
                const quantity = Math.floor(Math.random() * 3) + 1; // 1-3 quantity
                const unitPrice = parseInt(product.base_price); // Already in centimes
                const itemTotal = quantity * unitPrice;
                totalItemsPrice += itemTotal;

                await db.query(`
          INSERT INTO order_items (
            order_id, product_id, product_name, quantity, unit_price, subtotal, total
          )
          VALUES ($1, $2, $3, $4, $5, $6, $7)
          ON CONFLICT DO NOTHING
        `, [
                    orderId,
                    product.id,
                    product.name,
                    quantity,
                    unitPrice,
                    itemTotal,
                    itemTotal, // No discount for now
                ]);
            }

            // Create delivery for delivered and ready orders
            if (order.status === 'delivered' || order.status === 'ready') {
                const deliverer = deliverers[Math.floor(Math.random() * deliverers.length)];

                const deliveryStatus = order.status === 'delivered' ? 'delivered' : 'assigned';
                const deliveredAt = order.status === 'delivered' ?
                    new Date(order.created_at.getTime() + 45 * 60 * 1000) : null;

                await db.query(`
          INSERT INTO deliveries (
            organization_id, order_id, deliverer_id, status, 
            delivery_address_street, delivery_address_city,
            delivered_at, created_at
          )
          VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
          ON CONFLICT DO NOTHING
        `, [
                    order.organization_id,
                    orderId,
                    deliverer?.id || null,
                    deliveryStatus,
                    order.delivery_address_street,
                    order.delivery_address_city,
                    deliveredAt,
                    order.created_at,
                ]);
            }
        }
    }

    console.log(`✅ Seeded ${orders.length} orders with items and deliveries`);
}