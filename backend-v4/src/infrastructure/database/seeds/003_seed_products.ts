import { db } from '../PostgresConnection';

/**
 * Seed: Products
 * Crée des produits de test
 */

export async function seedProducts(): Promise<void> {
    console.log('🌱 Seeding products...');

    const products = [
        // Pizzeria La Bella
        {
            organization_id: 1,
            name: 'Pizza Margherita',
            description: 'Pizza classique avec tomate, mozzarella et basilic',
            category: 'Pizza',
            base_price: 120000, // 1,200 DZD en centimes
            unit: 'pièce',
            stock_quantity: 50,
            stock_alert_threshold: 10,
            is_available: true,
            tags: JSON.stringify(['pizza', 'végétarien', 'classique']),
        },
        {
            organization_id: 1,
            name: 'Pizza 4 Fromages',
            description: 'Pizza aux 4 fromages: mozzarella, gorgonzola, parmesan, chèvre',
            category: 'Pizza',
            base_price: 150000, // 1,500 DZD
            unit: 'pièce',
            stock_quantity: 30,
            stock_alert_threshold: 5,
            is_available: true,
            tags: JSON.stringify(['pizza', 'fromage', 'premium']),
        },
        {
            organization_id: 1,
            name: 'Pizza Pepperoni',
            description: 'Pizza avec pepperoni, tomate et mozzarella',
            category: 'Pizza',
            base_price: 140000, // 1,400 DZD
            unit: 'pièce',
            stock_quantity: 40,
            stock_alert_threshold: 8,
            is_available: true,
            tags: JSON.stringify(['pizza', 'viande', 'épicé']),
        },
        {
            organization_id: 1,
            name: 'Calzone Jambon',
            description: 'Calzone farci au jambon, fromage et champignons',
            category: 'Calzone',
            base_price: 130000, // 1,300 DZD
            unit: 'pièce',
            stock_quantity: 25,
            stock_alert_threshold: 5,
            is_available: true,
            tags: JSON.stringify(['calzone', 'jambon', 'champignons']),
        },
        {
            organization_id: 1,
            name: 'Salade César',
            description: 'Salade verte, croûtons, parmesan, sauce césar',
            category: 'Salade',
            base_price: 80000, // 800 DZD
            unit: 'portion',
            stock_quantity: 20,
            stock_alert_threshold: 5,
            is_available: true,
            tags: JSON.stringify(['salade', 'léger', 'végétarien']),
        },
    ];

    for (const product of products) {
        await db.query(
            `
      INSERT INTO products (
        organization_id, name, description, category, base_price, unit,
        stock_quantity, stock_alert_threshold, is_available, tags
      )
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
      `,
            [
                product.organization_id,
                product.name,
                product.description,
                product.category,
                product.base_price,
                product.unit,
                product.stock_quantity,
                product.stock_alert_threshold,
                product.is_available,
                product.tags,
            ]
        );
    }

    console.log(`✅ Seeded ${products.length} products`);
}