/**
 * Swagger/OpenAPI Configuration
 * Documentation automatique de l'API REST
 */
import { envConfig } from './env.validation';

export const swaggerConfig = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'AWID Delivery Management API',
      version: '4.0.0',
      description: `
# AWID Backend API v4.0

API REST pour le système de gestion de livraison multi-organisation adapté au marché algérien.

## Fonctionnalités Principales

- 🔐 **Authentification JWT** avec refresh tokens
- 👥 **Multi-organisation** avec isolation des données
- 📦 **Gestion des commandes** avec workflow complet
- 🚚 **Suivi des livraisons** en temps réel
- 💰 **Gestion financière** avec crédit et paiements
- 📊 **Rapports** automatisés
- 🔔 **Notifications** push temps réel

## Architecture

- **Clean Architecture** (Domain, Application, Infrastructure, Presentation)
- **TypeScript** strict
- **Validation** avec Zod
- **Cache** Redis
- **Queue** BullMQ
- **WebSocket** Socket.io

## Authentification

Toutes les routes (sauf /auth/*) nécessitent un token JWT dans le header:

\`\`\`
Authorization: Bearer <access_token>
\`\`\`

## Codes de Statut

- **200** - Succès
- **201** - Créé
- **400** - Requête invalide
- **401** - Non authentifié
- **403** - Non autorisé
- **404** - Non trouvé
- **409** - Conflit
- **429** - Trop de requêtes
- **500** - Erreur serveur

## Rate Limiting

- **Général**: 100 requêtes / 15 minutes
- **Auth**: 5 requêtes / 15 minutes
- **Par IP** et par utilisateur

## Pagination

Les endpoints de liste supportent la pagination:

\`\`\`
?page=1&limit=20&sortBy=createdAt&sortOrder=desc
\`\`\`
      `,
      contact: {
        name: 'AWID Support',
        email: 'support@awid.dz',
      },
      license: {
        name: 'MIT',
        url: 'https://opensource.org/licenses/MIT',
      },
    },
    servers: [
      {
        url: `http://localhost:${envConfig.PORT}/api/${envConfig.API_VERSION}`,
        description: 'Développement',
      },
      {
        url: `https://api.awid.dz/api/${envConfig.API_VERSION}`,
        description: 'Production',
      },
    ],
    components: {
      securitySchemes: {
        bearerAuth: {
          type: 'http',
          scheme: 'bearer',
          bearerFormat: 'JWT',
          description: 'Token JWT obtenu via /auth/login',
        },
      },
      schemas: {
        // Error Response
        Error: {
          type: 'object',
          properties: {
            error: {
              type: 'string',
              description: "Message d'erreur",
            },
            code: {
              type: 'string',
              description: "Code d'erreur",
            },
            details: {
              type: 'object',
              description: 'Détails additionnels',
            },
          },
        },
        // Pagination
        PaginationMeta: {
          type: 'object',
          properties: {
            page: { type: 'integer', example: 1 },
            limit: { type: 'integer', example: 20 },
            total: { type: 'integer', example: 150 },
            totalPages: { type: 'integer', example: 8 },
          },
        },
        // Organization
        Organization: {
          type: 'object',
          properties: {
            id: { type: 'string', format: 'uuid' },
            name: { type: 'string', example: 'Pizzeria Bella' },
            type: { type: 'string', enum: ['pizzeria', 'bakery', 'dairy', 'other'] },
            address: { type: 'string' },
            phone: { type: 'string', example: '+213555123456' },
            email: { type: 'string', format: 'email' },
            isActive: { type: 'boolean' },
            createdAt: { type: 'string', format: 'date-time' },
            updatedAt: { type: 'string', format: 'date-time' },
          },
        },
        // User
        User: {
          type: 'object',
          properties: {
            id: { type: 'string', format: 'uuid' },
            organizationId: { type: 'string', format: 'uuid' },
            email: { type: 'string', format: 'email' },
            name: { type: 'string', example: 'Ahmed Benali' },
            phone: { type: 'string', example: '+213555123456' },
            role: { type: 'string', enum: ['admin', 'kitchen', 'deliverer', 'customer'] },
            isActive: { type: 'boolean' },
            createdAt: { type: 'string', format: 'date-time' },
          },
        },
        // Product
        Product: {
          type: 'object',
          properties: {
            id: { type: 'string', format: 'uuid' },
            organizationId: { type: 'string', format: 'uuid' },
            name: { type: 'string', example: 'Pizza Margherita' },
            description: { type: 'string' },
            category: { type: 'string', example: 'pizza' },
            basePrice: { type: 'number', example: 800 },
            unit: { type: 'string', example: 'piece' },
            imageUrl: { type: 'string', format: 'uri' },
            isActive: { type: 'boolean' },
            createdAt: { type: 'string', format: 'date-time' },
          },
        },
        // Order
        Order: {
          type: 'object',
          properties: {
            id: { type: 'string', format: 'uuid' },
            organizationId: { type: 'string', format: 'uuid' },
            customerId: { type: 'string', format: 'uuid' },
            status: {
              type: 'string',
              enum: [
                'pending',
                'confirmed',
                'preparing',
                'ready',
                'delivering',
                'delivered',
                'cancelled',
              ],
            },
            items: {
              type: 'array',
              items: {
                type: 'object',
                properties: {
                  productId: { type: 'string', format: 'uuid' },
                  quantity: { type: 'integer' },
                  unitPrice: { type: 'number' },
                  subtotal: { type: 'number' },
                },
              },
            },
            totalAmount: { type: 'number', example: 12500 },
            notes: { type: 'string' },
            deliveryAddress: { type: 'string' },
            scheduledFor: { type: 'string', format: 'date-time' },
            createdAt: { type: 'string', format: 'date-time' },
          },
        },
        // Delivery
        Delivery: {
          type: 'object',
          properties: {
            id: { type: 'string', format: 'uuid' },
            orderId: { type: 'string', format: 'uuid' },
            delivererId: { type: 'string', format: 'uuid' },
            status: {
              type: 'string',
              enum: ['assigned', 'picked_up', 'in_transit', 'arrived', 'delivered', 'failed'],
            },
            pickupLocation: {
              type: 'object',
              properties: {
                latitude: { type: 'number' },
                longitude: { type: 'number' },
                address: { type: 'string' },
              },
            },
            deliveryLocation: {
              type: 'object',
              properties: {
                latitude: { type: 'number' },
                longitude: { type: 'number' },
                address: { type: 'string' },
              },
            },
            estimatedDuration: { type: 'integer', description: 'Minutes' },
            actualDuration: { type: 'integer', description: 'Minutes' },
            proofOfDelivery: {
              type: 'object',
              properties: {
                signature: { type: 'string' },
                photo: { type: 'string', format: 'uri' },
                recipientName: { type: 'string' },
                timestamp: { type: 'string', format: 'date-time' },
              },
            },
            createdAt: { type: 'string', format: 'date-time' },
          },
        },
        // Payment
        Payment: {
          type: 'object',
          properties: {
            id: { type: 'string', format: 'uuid' },
            organizationId: { type: 'string', format: 'uuid' },
            customerId: { type: 'string', format: 'uuid' },
            amount: { type: 'number', example: 25000 },
            method: { type: 'string', enum: ['cash', 'check', 'transfer'] },
            reference: { type: 'string' },
            notes: { type: 'string' },
            receivedBy: { type: 'string', format: 'uuid' },
            allocations: {
              type: 'array',
              items: {
                type: 'object',
                properties: {
                  orderId: { type: 'string', format: 'uuid' },
                  amount: { type: 'number' },
                },
              },
            },
            createdAt: { type: 'string', format: 'date-time' },
          },
        },
      },
    },
    security: [
      {
        bearerAuth: [],
      },
    ],
    tags: [
      {
        name: 'Auth',
        description: 'Authentification et gestion des tokens',
      },
      {
        name: 'Organizations',
        description: 'Gestion des organisations',
      },
      {
        name: 'Users',
        description: 'Gestion des utilisateurs',
      },
      {
        name: 'Products',
        description: 'Gestion des produits',
      },
      {
        name: 'Orders',
        description: 'Gestion des commandes',
      },
      {
        name: 'Deliveries',
        description: 'Gestion des livraisons',
      },
      {
        name: 'Payments',
        description: 'Gestion des paiements',
      },
    ],
  },
  apis: ['./src/presentation/http/routes/**/*.ts', './src/presentation/http/controllers/**/*.ts'],
};
