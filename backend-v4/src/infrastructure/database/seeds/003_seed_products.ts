import { db } from '../PostgresConnection';

/**
 * Seed: Products
 * Crée des produits de test
 */

export async function seedProducts(): Promise<void> {
    console.log('🌱 Seeding products...');

    const products = [
        // Pizzeria La Bella - need to use actual organization UUID
        {
            organization_id: '94bbefe1-194a-4782-984a-c24a5d197d03', // Pizzeria La Bella UUID
            name: 'Pizza Margherita',
            description: 'Pizza classique avec tomate, mozzarella et basilic',
            category: 'Pizza',
            base_price: 120000, // 1,200 DZD en centimes
            unit: 'pièce',
            current_stock: 50,
            min_stock_level: 10,
            is_available: true,
            tags: ['pizza', 'végétarien', 'classique'],
        },
        {
            organization_id: '94bbefe1-194a-4782-984a-c24a5d197d03',
            name: 'Pizza 4 Fromages',
            description: 'Pizza aux 4 fromages: mozzarella, gorgonzola, parmesan, chèvre',
            category: 'Pizza',
            base_price: 150000, // 1,500 DZD
            unit: 'pièce',
            current_stock: 30,
            min_stock_level: 5,
            is_available: true,
            tags: ['pizza', 'fromage', 'premium'],
        },
        {
            organization_id: '94bbefe1-194a-4782-984a-c24a5d197d03',
            name: 'Pizza Pepperoni',
            description: 'Pizza avec pepperoni, tomate et mozzarella',
            category: 'Pizza',
            base_price: 140000, // 1,400 DZD
            unit: 'pièce',
            current_stock: 40,
            min_stock_level: 8,
            is_available: true,
            tags: ['pizza', 'viande', 'épicé'],
        },
        {
            organization_id: '94bbefe1-194a-4782-984a-c24a5d197d03',
            name: 'Calzone Jambon',
            description: 'Calzone farci au jambon, fromage et champignons',
            category: 'Calzone',
            base_price: 130000, // 1,300 DZD
            unit: 'pièce',
            current_stock: 25,
            min_stock_level: 5,
            is_available: true,
            tags: ['calzone', 'jambon', 'champignons'],
        },
        {
            organization_id: '94bbefe1-194a-4782-984a-c24a5d197d03',
            name: 'Salade César',
            description: 'Salade verte, croûtons, parmesan, sauce césar',
            category: 'Salade',
            base_price: 80000, // 800 DZD
            unit: 'portion',
            current_stock: 20,
            min_stock_level: 5,
            is_available: true,
            tags: ['salade', 'léger', 'végétarien'],
        },
    ];

    for (const product of products) {
        await db.query(
            `
      INSERT INTO products (
        organization_id, name, description, category, base_price, unit,
        current_stock, min_stock_level, is_available, tags
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
                product.current_stock,
                product.min_stock_level,
                product.is_available,
                product.tags,
            ]
        );
    }

    console.log(`✅ Seeded ${products.length} products`);
}