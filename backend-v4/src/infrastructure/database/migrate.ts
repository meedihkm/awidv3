import { readFileSync } from 'fs';
import { join } from 'path';
import { db } from './PostgresConnection';

/**
 * Migration Manager
 * Gère l'exécution des migrations SQL
 */

interface Migration {
  id: number;
  name: string;
  filename: string;
  executed: boolean;
  executedAt?: Date;
}

const MIGRATIONS_DIR = join(__dirname, 'migrations');

const MIGRATIONS: Omit<Migration, 'executed' | 'executedAt'>[] = [
  { id: 1, name: 'Create organizations table', filename: '001_create_organizations.sql' },
  { id: 2, name: 'Create users table', filename: '002_create_users.sql' },
  { id: 3, name: 'Create products table', filename: '003_create_products.sql' },
  { id: 4, name: 'Create orders table', filename: '004_create_orders.sql' },
  { id: 5, name: 'Create deliveries table', filename: '005_create_deliveries.sql' },
  { id: 6, name: 'Create payments table', filename: '006_create_payments.sql' },
  { id: 7, name: 'Create packaging table', filename: '007_create_packaging.sql' },
  { id: 8, name: 'Create stock table', filename: '008_create_stock.sql' },
  { id: 9, name: 'Create notifications table', filename: '009_create_notifications.sql' },
  { id: 10, name: 'Create indexes and views', filename: '010_create_indexes_and_views.sql' },
];

/**
 * Crée la table de migrations si elle n'existe pas
 */
async function createMigrationsTable(): Promise<void> {
  const sql = `
    CREATE TABLE IF NOT EXISTS migrations (
      id INTEGER PRIMARY KEY,
      name VARCHAR(255) NOT NULL,
      filename VARCHAR(255) NOT NULL,
      executed_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
    );
  `;

  await db.query(sql);
  console.log('✅ Migrations table ready');
}

/**
 * Récupère les migrations déjà exécutées
 */
async function getExecutedMigrations(): Promise<Set<number>> {
  const rows = await db.query<{ id: number }>('SELECT id FROM migrations ORDER BY id');
  return new Set(rows.map((row) => row.id));
}

/**
 * Exécute une migration
 */
async function executeMigration(migration: Omit<Migration, 'executed' | 'executedAt'>): Promise<void> {
  const filePath = join(MIGRATIONS_DIR, migration.filename);
  const sql = readFileSync(filePath, 'utf-8');

  console.log(`⏳ Executing migration ${migration.id}: ${migration.name}...`);

  await db.transaction(async (client) => {
    // Exécuter le SQL de la migration
    await client.query(sql);

    // Enregistrer la migration comme exécutée
    await client.query(
      'INSERT INTO migrations (id, name, filename) VALUES ($1, $2, $3)',
      [migration.id, migration.name, migration.filename]
    );
  });

  console.log(`✅ Migration ${migration.id} completed: ${migration.name}`);
}

/**
 * Exécute toutes les migrations en attente
 */
export async function runMigrations(): Promise<void> {
  try {
    console.log('🚀 Starting database migrations...\n');

    // Créer la table de migrations
    await createMigrationsTable();

    // Récupérer les migrations déjà exécutées
    const executedMigrations = await getExecutedMigrations();

    // Filtrer les migrations à exécuter
    const pendingMigrations = MIGRATIONS.filter((m) => !executedMigrations.has(m.id));

    if (pendingMigrations.length === 0) {
      console.log('✅ All migrations are up to date!\n');
      return;
    }

    console.log(`📋 Found ${pendingMigrations.length} pending migration(s)\n`);

    // Exécuter les migrations en attente
    for (const migration of pendingMigrations) {
      await executeMigration(migration);
    }

    console.log('\n✅ All migrations completed successfully!');
  } catch (error) {
    console.error('\n❌ Migration failed:', error);
    throw error;
  }
}

/**
 * Rollback de la dernière migration (à implémenter si nécessaire)
 */
export async function rollbackMigration(): Promise<void> {
  console.log('⚠️  Rollback not implemented yet');
  // TODO: Implémenter le rollback si nécessaire
}

/**
 * Affiche le statut des migrations
 */
export async function getMigrationStatus(): Promise<Migration[]> {
  await createMigrationsTable();
  const executedMigrations = await getExecutedMigrations();

  return MIGRATIONS.map((m) => ({
    ...m,
    executed: executedMigrations.has(m.id),
  }));
}

// CLI pour exécuter les migrations
if (require.main === module) {
  const command = process.argv[2];

  (async () => {
    try {
      await db.connect();

      switch (command) {
        case 'up':
          await runMigrations();
          break;

        case 'status':
          const status = await getMigrationStatus();
          console.log('\n📊 Migration Status:\n');
          status.forEach((m) => {
            const icon = m.executed ? '✅' : '⏳';
            console.log(`${icon} ${m.id}. ${m.name}`);
          });
          console.log();
          break;

        default:
          console.log(`
Usage: npm run migrate [command]

Commands:
  up      - Run all pending migrations
  status  - Show migration status

Examples:
  npm run migrate up
  npm run migrate status
          `);
      }

      await db.disconnect();
      process.exit(0);
    } catch (error) {
      console.error('Error:', error);
      await db.disconnect();
      process.exit(1);
    }
  })();
}
