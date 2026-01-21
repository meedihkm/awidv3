const fs = require('fs');
const path = require('path');
const pool = require('../config/database');
require('dotenv').config();

const runMigration = async () => {
    const migrationFile = path.join(__dirname, '../migrations/003_add_indexes.sql');
    console.log('Running migration:', migrationFile);

    try {
        const sql = fs.readFileSync(migrationFile, 'utf8');
        await pool.query(sql);
        console.log('Migration successfully executed!');
    } catch (err) {
        console.error('Migration failed:', err.message);
    } finally {
        await pool.end();
    }
};

runMigration();
