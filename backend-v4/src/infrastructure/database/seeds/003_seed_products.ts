import { PostgresConnection } from '../PostgresConnection';

export async function seedProducts(db: PostgresConnection): Promise<void> {
    console.log('🌱 Seeding products...');

    const products = [
        // Produits Pizzeria La Bella
        {
            organization_id: '94bbefe1-194a-4782-984a-c24a5d197d03',
            name: 'Pizza Margherita',
            description: 'Pizza classique avec tomate et mozzarella',
            sku: 'PIZZA-MARG-001',
            category: 'Pizza',
            base_price: 120000, // 1200 DZD en centimes
            unit: 'unit',
            track_stock: true,
            current_stock: 50,
            min_stock_level: 10,
            is_available: true,
            tags: ['pizza', 'margherita', 'classique'],
            metadata: {}
        },
        {
            organization_id: '94bbefe1-194a-4782-984a-c24a5d197d03',
            name: 'Pizza 4 Fromages',
            description: 'Pizza aux quatre fromages',
            sku: 'PIZZA-4FROM-001',
            category: 'Pizza',
            base_price: 150000, // 1500 DZD en centimes
            unit: 'unit',
            track_stock: true,
            current_stock: 30,
            min_stock_level: 5,
            is_available: true,
            tags: ['pizza', 'fromage', 'premium'],
            metadata: {}
        },
        {
            organization_id: '94bbefe1-194a-4782-984a-c24a5d197d03',
            name: 'Coca Cola',
            description: 'Boisson gazeuse 33cl',
            sku: 'DRINK-COCA-33CL',
            category: 'Boisson',
            base_price: 15000, // 150 DZD en centimes
            unit: 'unit',
            track_stock: true,
            current_stock: 100,
            min_stock_level: 20,
            is_available: true,
            tags: ['boisson', 'coca', 'gazeux'],
            metadata: { volume: '33cl' }
        },
        // Produits Boulangerie El Baraka
        {
            organization_id: '57974cc1-4261-4e2f-a10f-71948e90864e',
            name: 'Pain Blanc',
            description: 'Pain blanc traditionnel',
            sku: 'BREAD-WHITE-001',
            category: 'Boulangerie',
            base_price: 5000, // 50 DZD en centimes
            unit: 'unit',
            track_stock: true,
            current_stock: 200,
            min_stock_level: 50,
            is_available: true,
            tags: ['pain', 'blanc', 'traditionnel'],
            metadata: { weight: '400g' }
        },
        {
            organization_id: '57974cc1-4261-4e2f-a10f-71948e90864e',
            name: 'Croissant',
            description: 'Croissant au beurre',
            sku: 'PASTRY-CROIS-001',
            category: 'Viennoiserie',
            base_price: 8000, // 80 DZD en centimes
            unit: 'unit',
            track_stock: true,
            current_stock: 50,
            min_stock_level: 10,
            is_available: true,
            tags: ['croissant', 'beurre', 'viennoiserie'],
            metadata: { weight: '60g' }
        }
    ];

    for (const product of products) {
        await db.query(`
      INSERT INTO products (
        organization_id, name, description, sku, category, base_price, unit,
        track_stock, current_stock, min_stock_level, is_available, tags, metadata
      )
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)
      ON CONFLICT DO NOTHING
    `, [
            product.organization_id, product.name, product.description, product.sku, product.category,
            product.base_price, product.unit, product.track_stock, product.current_stock,
            product.min_stock_level, product.is_available, product.tags, JSON.stringify(product.metadata)
        ]);
    }

    console.log('✅ Seeded 5 products');
}