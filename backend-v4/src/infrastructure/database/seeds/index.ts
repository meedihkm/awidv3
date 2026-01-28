import { PostgresConnection } from '../PostgresConnection';
import { seedOrganizations } from './001_seed_organizations';
import { seedUsers } from './002_seed_users';
import { seedProducts } from './003_seed_products';
import { seedOrders } from './004_seed_orders';

async function runSeeds(): Promise<void> {
  const db = new PostgresConnection();

  try {
    console.log('🌱 Starting database seeding...');

    await db.connect();
    console.log('✅ Database connected successfully');

    await seedOrganizations(db);
    await seedUsers(db);
    await seedProducts(db);
    await seedOrders(db);

    console.log('\n✅ All seeds completed successfully!');
    console.log('\n📋 Test Accounts Created:');
    console.log('👤 Admin: admin@test.com / test123456');
    console.log('👨‍🍳 Kitchen: atelier@test.com / test123456');
    console.log('🚚 Deliverer: livreur@test.com / test123456');
    console.log('🏪 Customer: client@test.com / test123456');

    await db.disconnect();
    console.log('✅ Database disconnected successfully');
    process.exit(0);
  } catch (error) {
    console.error('\n❌ Seeding failed:', error);
    await db.disconnect();
    process.exit(1);
  }
}

if (require.main === module) {
  runSeeds();
}

export { runSeeds };

