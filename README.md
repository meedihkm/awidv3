# 📦 Awid - Gestion de Livraison B2B

Application complète de gestion de commandes et livraisons B2B pour restaurants et cafétérias.
Comprend une API Node.js/Express robuste et une application mobile Flutter.

## 🚀 Démarrage Rapide

### Prérequis
- Node.js v18+
- PostgreSQL
- Flutter SDK (pour le mobile)

### Installation (API)

```bash
# 1. Installer les dépendances
npm install

# 2. Configurer l'environnement
cp .env.example .env
# Modifiez .env avec vos accès BDD

# 3. Lancer le serveur de développement
npm run dev
```

L'API sera accessible sur `http://localhost:3000`.

## 📚 Documentation

- **[API Swagger](/api-v2/config/swagger.js)**: Accessible sur `http://localhost:3000/api-docs` une fois le serveur lancé.
- **[Architecture](./ARCHITECTURE.md)**: Vue d'ensemble technique et diagrammes.
- **[Contribution](./CONTRIBUTING.md)**: Guide pour les développeurs.
- **[Changelog](./CHANGELOG.md)**: Historique des modifications.

## 🏗️ Structure du Projet

```
/
├── api-v2/             # Backend Express
│   ├── config/         # Config (DB, Swagger, Auth)
│   ├── middleware/     # Auth, RateLimit, Validation
│   ├── routes/         # Endpoints API
│   └── index.js        # Entry point
├── mobile/             # Application Flutter
├── docs/               # Documentation additionnelle (Audit sécu)
├── artillery/          # Tests de charge
└── tests/              # Tests E2E / Intégration
```

## 🧪 Tests

### Backend
Coverage actuel: **High** (>80%)

```bash
npm test              # Lancer tous les tests
npm run test:coverage # Rapport de couverture
```

### Mobile
Coverage actuel: **Good** (>60%)

```bash
cd mobile
flutter test
```

## 🔒 Sécurité

Ce projet a fait l'objet d'un audit de sécurité (OWASP ZAP).
- [Rapport d'Audit](./docs/SECURITY_AUDIT.md)
- [Bugs Corrigés](./AUDIT_BUGS_REPORT.md)

---
*Développé pour Awid - 2026*
