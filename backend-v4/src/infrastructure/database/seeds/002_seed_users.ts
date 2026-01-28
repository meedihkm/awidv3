import bcrypt from 'bcrypt';
import { db } from '../PostgresConnection';

/**
 * Seed: Users
 * Crée des utilisateurs de test pour chaque rôle
 */

export async function seedUsers(): Promise<void> {
    console.log('🌱 Seeding users...');

    // Hash des mots de passe
    const hashedPassword = await bcrypt.hash('password123', 12);

    const users = [
        // Admin
        {
            organization_id: 1, // Pizzeria La Bella
            email: 'admin@pizzeria-labella.dz',
            password_hash: hashedPassword,
            first_name: 'Ahmed',
            last_name: 'Benali',
            phone: '+213 555 123 456',
            role: 'admin',
            is_active: true,
        },
        // Kitchen
        {
            organization_id: 1,
            email: 'kitchen@pizzeria-labella.dz',
            password_hash: hashedPassword,
            first_name: 'Fatima',
            last_name: 'Khelifi',
            phone: '+213 555 123 457',
            role: 'kitchen',
            is_active: true,
        },
        // Deliverer
        {
            organization_id: 1,
            email: 'deliverer@pizzeria-labella.dz',
            password_hash: hashedPassword,
            first_name: 'Mohamed',
            last_name: 'Saidi',
            phone: '+213 555 123 458',
            role: 'deliverer',
            address_street: '25 Rue des Martyrs',
            address_city: 'Alger',
            address_state: 'Alger',
            address_postal_code: '16000',
            address_country: 'DZ',
            latitude: 36.7538,
            longitude: 3.0588,
            deliverer_vehicle_type: 'motorcycle',
            deliverer_vehicle_plate: '16-123-45',
            deliverer_is_available: true,
            is_active: true,
        },
        // Customer
        {
            organization_id: 1,
            email: 'customer@cafeteria-alger.dz',
            password_hash: hashedPassword,
            first_name: 'Amina',
            last_name: 'Boumediene',
            phone: '+213 555 123 459',
            role: 'customer',
            address_street: '10 Avenue de l\'Indépendance',
            address_city: 'Alger',
            address_state: 'Alger',
            address_postal_code: '16000',
            address_country: 'DZ',
            latitude: 36.7538,
            longitude: 3.0588,
            customer_credit_limit: 1000000, // 10,000 DZD
            customer_current_debt: 0,
            is_active: true,
        },
    ];

    for (const user of users) {
        await db.query(
            `
      INSERT INTO users (
        organization_id, email, password_hash, first_name, last_name, phone, role,
        address_street, address_city, address_state, address_postal_code, address_country,
        latitude, longitude,
        deliverer_vehicle_type, deliverer_vehicle_plate, deliverer_is_available,
        customer_credit_limit, customer_current_debt,
        is_active
      )
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20)
      ON CONFLICT (email) DO NOTHING
      `,
            [
                user.organization_id,
                user.email,
                user.password_hash,
                user.first_name,
                user.last_name,
                user.phone,
                user.role,
                user.address_street || null,
                user.address_city || null,
                user.address_state || null,
                user.address_postal_code || null,
                user.address_country || null,
                user.latitude || null,
                user.longitude || null,
                user.deliverer_vehicle_type || null,
                user.deliverer_vehicle_plate || null,
                user.deliverer_is_available || null,
                user.customer_credit_limit || null,
                user.customer_current_debt || null,
                user.is_active,
            ]
        );
    }

    console.log(`✅ Seeded ${users.length} users`);
}