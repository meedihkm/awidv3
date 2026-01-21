const { Pool } = require('pg');
const fs = require('fs');
const path = require('path');
const envPath = path.resolve(__dirname, '../../.env');
console.log('Loading .env from:', envPath);
require('dotenv').config({ path: envPath });

// Also try loading .env.local if .env didn't provide URL
if (!process.env.DATABASE_URL) {
    const localEnvPath = path.resolve(__dirname, '../../.env.local');
    console.log('Loading .env.local from:', localEnvPath);
    require('dotenv').config({ path: localEnvPath });
}

const pool = new Pool({
    connectionString: process.env.DATABASE_URL,
    ssl: process.env.NODE_ENV === 'production' ? { rejectUnauthorized: false } : false
});

async function runMigration() {
    try {
        const migrationPath = path.join(__dirname, '../migrations/009_add_soft_delete_to_products.sql');
        const sql = fs.readFileSync(migrationPath, 'utf8');

        console.log('Applying migration:', migrationPath);
        await pool.query(sql);
        console.log('Migration applied successfully.');

    } catch (error) {
        console.error('Migration failed:', error);
    } finally {
        await pool.end();
    }
}

runMigration();
