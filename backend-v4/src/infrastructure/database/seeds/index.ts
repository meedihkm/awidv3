import { db } from '../PostgresConnection';
import { seedOrganizations } from './001_seed_organizations';

async function runSeeds(): Promise<void> {
  try {
    console.log('🌱 Starting database seeding...\n');

    await db.connect();

    await seedOrganizations();

    console.log('\n✅ All seeds completed successfully!');
    
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
