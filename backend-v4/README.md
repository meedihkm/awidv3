# AWID Backend v4.0

Système de gestion de livraison multi-organisation pour le marché algérien.

## 🏗️ Architecture

Ce projet suit les principes de **Clean Architecture** avec une séparation claire des responsabilités :

```
src/
├── domain/          # Logique métier pure (entités, value objects, services)
├── application/     # Cas d'utilisation, DTOs, validators
├── infrastructure/  # Adaptateurs externes (DB, cache, queue, APIs)
├── presentation/    # API REST, WebSocket, controllers
├── shared/          # Utilitaires partagés
└── config/          # Configuration
```

## 🚀 Démarrage Rapide

### Prérequis

- Node.js >= 20.0.0
- PostgreSQL >= 16
- Redis >= 7
- npm >= 10.0.0

### Installation

```bash
# Installer les dépendances
npm install

# Copier le fichier d'environnement
cp .env.example .env

# Éditer .env avec vos configurations
nano .env

# Créer la base de données
createdb awid_dev

# Lancer les migrations
npm run migrate

# Seed (optionnel)
npm run seed
```

### Développement

```bash
# Mode développement avec hot-reload
npm run dev

# Build
npm run build

# Production
npm start

# Tests
npm test
npm run test:coverage

# Linting
npm run lint
npm run lint:fix

# Format
npm run format
```

## 📚 Stack Technique

- **Runtime**: Node.js 20 LTS
- **Langage**: TypeScript 5.x
- **Framework**: Express.js
- **Validation**: Zod
- **Database**: PostgreSQL 16
- **Cache**: Redis 7
- **Queue**: BullMQ
- **WebSocket**: Socket.io
- **Auth**: JWT + bcrypt
- **Logging**: Winston
- **Testing**: Vitest

## 🔐 Sécurité

- Authentification JWT avec rotation des tokens
- Chiffrement bcrypt (12 rounds)
- Rate limiting intelligent
- Helmet.js pour headers sécurisés
- CORS configuré
- Validation Zod sur toutes les entrées
- Audit logging complet

## 📖 Documentation API

La documentation API est disponible via Swagger UI :

```
http://localhost:3000/api-docs
```

## 🧪 Tests

```bash
# Tests unitaires
npm test

# Tests avec couverture
npm run test:coverage

# Tests avec UI
npm run test:ui

# Tests d'intégration
npm run test:integration

# Tests E2E
npm run test:e2e
```

## 📦 Scripts Disponibles

- `npm run dev` - Développement avec hot-reload
- `npm run build` - Build production
- `npm start` - Démarrer en production
- `npm test` - Lancer les tests
- `npm run lint` - Vérifier le code
- `npm run format` - Formater le code
- `npm run migrate` - Lancer les migrations
- `npm run seed` - Seed la base de données

## 🌍 Variables d'Environnement

Voir `.env.example` pour la liste complète des variables.

Variables essentielles :
- `DATABASE_URL` - URL PostgreSQL
- `REDIS_URL` - URL Redis
- `JWT_SECRET` - Secret JWT (min 32 caractères)
- `NODE_ENV` - Environnement (development/production)

## 📝 Conventions de Code

- **Naming**: camelCase pour variables/fonctions, PascalCase pour classes
- **Imports**: Chemins absolus avec alias (@domain, @application, etc.)
- **Types**: Toujours typer explicitement
- **Errors**: Utiliser les classes d'erreur personnalisées
- **Commits**: Convention Conventional Commits

## 🤝 Contribution

1. Créer une branche feature (`git checkout -b feature/amazing-feature`)
2. Commit les changements (`git commit -m 'feat: add amazing feature'`)
3. Push la branche (`git push origin feature/amazing-feature`)
4. Ouvrir une Pull Request

## 📄 Licence

MIT

## 👥 Équipe

AWID Development Team

---

**Version**: 4.0.0  
**Date**: Janvier 2026
