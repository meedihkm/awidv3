import { PostgresConnection } from '../PostgresConnection';

export async function seedOrganizations(db: PostgresConnection): Promise<void> {
  console.log('🌱 Seeding organizations...');

  const organizations = [
    {
      id: '94bbefe1-194a-4782-984a-c24a5d197d03',
      name: 'Pizzeria La Bella',
      type: 'pizzeria',
      description: 'Pizzeria artisanale livrant aux cafétérias et restaurants de la ville',
      email: 'contact@pizzeria-labella.dz',
      phone: '+213 555 123 456',
      address_street: '15 Rue Didouche Mourad',
      address_city: 'Alger',
      address_state: 'Alger',
      address_postal_code: '16000',
      address_country: 'DZ',
      latitude: 36.7538,
      longitude: 3.0588,
      default_credit_limit: 5000000, // 50,000 DZD en centimes
      default_credit_days: 30,
      currency: 'DZD',
      settings: {
        business_hours: {
          monday: { open: '08:00', close: '20:00' },
          tuesday: { open: '08:00', close: '20:00' },
          wednesday: { open: '08:00', close: '20:00' },
          thursday: { open: '08:00', close: '20:00' },
          friday: { open: '08:00', close: '20:00' },
          saturday: { open: '08:00', close: '20:00' },
          sunday: { open: '10:00', close: '18:00' },
        },
        delivery_zones: ['Alger Centre', 'Bab El Oued', 'Hussein Dey'],
        min_order_amount: 200000, // 2,000 DZD
      },
      is_active: true,
    },
    {
      id: '57974cc1-4261-4e2f-a10f-71948e90864e',
      name: 'Boulangerie El Baraka',
      type: 'bakery',
      description: 'Boulangerie traditionnelle livrant du pain frais aux commerces',
      email: 'contact@boulangerie-elbaraka.dz',
      phone: '+213 555 789 012',
      address_street: '42 Boulevard Mohamed V',
      address_city: 'Oran',
      address_state: 'Oran',
      address_postal_code: '31000',
      address_country: 'DZ',
      latitude: 35.6969,
      longitude: -0.6331,
      default_credit_limit: 3000000, // 30,000 DZD en centimes
      default_credit_days: 15,
      currency: 'DZD',
      settings: {
        business_hours: {
          monday: { open: '06:00', close: '19:00' },
          tuesday: { open: '06:00', close: '19:00' },
          wednesday: { open: '06:00', close: '19:00' },
          thursday: { open: '06:00', close: '19:00' },
          friday: { open: '06:00', close: '19:00' },
          saturday: { open: '06:00', close: '19:00' },
          sunday: { open: '07:00', close: '14:00' },
        },
        delivery_zones: ['Oran Centre', 'Es Senia', 'Bir El Djir'],
        min_order_amount: 100000, // 1,000 DZD
      },
      is_active: true,
    },
  ];

  for (const org of organizations) {
    await db.query(`
      INSERT INTO organizations (
        id, name, type, description, email, phone,
        address_street, address_city, address_state, address_postal_code, address_country,
        latitude, longitude,
        default_credit_limit, default_credit_days, currency,
        settings, is_active
      )
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18)
      ON CONFLICT (id) DO NOTHING
    `, [
      org.id, org.name, org.type, org.description, org.email, org.phone,
      org.address_street, org.address_city, org.address_state, org.address_postal_code, org.address_country,
      org.latitude, org.longitude,
      org.default_credit_limit, org.default_credit_days, org.currency,
      JSON.stringify(org.settings), org.is_active
    ]);
  }

  console.log('✅ Seeded 2 organizations');
}
