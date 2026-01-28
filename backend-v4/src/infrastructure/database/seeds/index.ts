import { db } from '../PostgresConnection';
import { seedOrganizations } from './001_seed_organizations';
import { seedUsers } from './002_seed_users';
import { seedProducts } from './003_seed_products';

async function runSeeds(): Promise<void> {
  try {
    console.log('🌱 Starting database seeding...\n');

    await db.connect();

    await seedOrganizations();
    await seedUsers();
    await seedProducts();

    console.log('\n✅ All seeds completed successfully!');
    console.log('\n📋 Test Accounts Created:');
    console.log('👤 Admin: admin@pizzeria-labella.dz / password123');
    console.log('👨‍🍳 Kitchen: kitchen@pizzeria-labella.dz / password123');
    console.log('🚚 Deliverer: deliverer@pizzeria-labella.dz / password123');
    console.log('🏪 Customer: customer@cafeteria-alger.dz / password123');

    await db.disconnect();
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

