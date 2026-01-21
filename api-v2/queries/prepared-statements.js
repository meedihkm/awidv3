/**
 * Requêtes Préparées (Prepared Statements)
 * Permet à PostgreSQL de pré-compiler et cacher le plan d'exécution.
 */

const PreparedQueries = {
    // Utilisateurs
    findUserByEmail: {
        name: 'find-user-by-email',
        text: 'SELECT * FROM users WHERE email = $1'
    },
    findUserById: {
        name: 'find-user-by-id',
        text: 'SELECT id, email, name, phone, role, organization_id, active FROM users WHERE id = $1'
    },

    // Commandes
    findOrderById: {
        name: 'find-order-by-id',
        text: 'SELECT * FROM orders WHERE id = $1 AND organization_id = $2'
    },

    // Livraisons
    findDeliveryById: {
        name: 'find-delivery-by-id',
        text: 'SELECT * FROM deliveries WHERE id = $1 AND organization_id = $2'
    }
};

module.exports = PreparedQueries;
