import { PostgresConnection } from '../PostgresConnection';

export async function seedUsers(db: PostgresConnection): Promise<void> {
    console.log('🌱 Seeding users...');

    // Hash du mot de passe "test123456"
    const passwordHash = '$2b$12$qEdOkwAABcEwE62srVfgu.JP/LokSqgp7qwpsssRlPLVKbYYRXMCu';

    const users = [
        // Admin - Pizzeria La Bella
        {
            organization_id: '94bbefe1-194a-4782-984a-c24a5d197d03',
            first_name: 'Admin',
            last_name: 'Test',
            email: 'admin@test.com',
            phone: '+213555000001',
            password_hash: passwordHash,
            role: 'admin',
            address_street: '123 Rue Admin',
            address_city: 'Alger',
            address_state: 'Alger',
            address_postal_code: '16000',
            is_active: true,
            email_verified: true,
            phone_verified: true
        },
        // Kitchen - Pizzeria La Bella
        {
            organization_id: '94bbefe1-194a-4782-984a-c24a5d197d03',
            first_name: 'Atelier',
            last_name: 'Test',
            email: 'atelier@test.com',
            phone: '+213555000002',
            password_hash: passwordHash,
            role: 'kitchen',
            address_street: '123 Rue Cuisine',
            address_city: 'Alger',
            address_state: 'Alger',
            address_postal_code: '16000',
            is_active: true,
            email_verified: true,
            phone_verified: true
        },
        // Deliverer - Pizzeria La Bella
        {
            organization_id: '94bbefe1-194a-4782-984a-c24a5d197d03',
            first_name: 'Livreur',
            last_name: 'Test',
            email: 'livreur@test.com',
            phone: '+213555000003',
            password_hash: passwordHash,
            role: 'deliverer',
            address_street: '123 Rue Livraison',
            address_city: 'Alger',
            address_state: 'Alger',
            address_postal_code: '16000',
            vehicle_type: 'motorcycle',
            vehicle_plate: 'TEST123',
            is_available: true,
            is_active: true,
            email_verified: true,
            phone_verified: true
        },
        // Customer - Boulangerie El Baraka
        {
            organization_id: '57974cc1-4261-4e2f-a10f-71948e90864e',
            first_name: 'Client',
            last_name: 'Test',
            email: 'client@test.com',
            phone: '+213555000004',
            password_hash: passwordHash,
            role: 'customer',
            address_street: '456 Rue Client',
            address_city: 'Alger',
            address_state: 'Alger',
            address_postal_code: '16001',
            latitude: 36.7538,
            longitude: 3.0588,
            credit_limit: 50000, // 500 DZD en centimes
            credit_days: 30,
            current_debt: 0,
            is_active: true,
            email_verified: true,
            phone_verified: true
        }
    ];

    for (const user of users) {
        await db.query(`
      INSERT INTO users (
        organization_id, first_name, last_name, email, phone, password_hash, role,
        address_street, address_city, address_state, address_postal_code, address_country,
        latitude, longitude, credit_limit, credit_days, current_debt,
        vehicle_type, vehicle_plate, is_available,
        is_active, email_verified, phone_verified
      )
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23)
      ON CONFLICT (email) DO NOTHING
    `, [
            user.organization_id, user.first_name, user.last_name, user.email, user.phone,
            user.password_hash, user.role, user.address_street, user.address_city,
            user.address_state, user.address_postal_code, 'DZ',
            user.latitude || null, user.longitude || null,
            user.credit_limit || 0, user.credit_days || 0, user.current_debt || 0,
            user.vehicle_type || null, user.vehicle_plate || null, user.is_available || null,
            user.is_active, user.email_verified, user.phone_verified
        ]);
    }

    console.log('✅ Seeded 4 users');
}