# 📱 AWID Mobile v4

**Version**: 4.0.0  
**Date**: 29 Janvier 2026  
**Status**: ✅ Production Ready

Application mobile Flutter pour la gestion de livraison de produits alimentaires connectant cuisines, clients et livreurs en temps réel.

[![Flutter](https://img.shields.io/badge/Flutter-3.16+-blue)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.2+-blue)](https://dart.dev/)
[![Tests](https://img.shields.io/badge/Tests-1119-green)](./docs/TESTING_GUIDE.md)
[![Coverage](https://img.shields.io/badge/Coverage-75%25-brightgreen)](./docs/TESTING_GUIDE.md)

---

## ✨ Fonctionnalités

### 👨‍🍳 Interface Cuisine
- ✅ Gestion des commandes en temps réel
- ✅ Tableau Kanban de production (drag & drop)
- ✅ Gestion du stock avec alertes automatiques
- ✅ Statistiques de production
- ✅ Suivi des temps de préparation

### 🏪 Interface Client
- ✅ Consultation des commandes
- ✅ Suivi GPS des livraisons en temps réel
- ✅ Gestion du compte et crédit
- ✅ Historique des transactions
- ✅ Gestion des emballages consignés

### 🚚 Interface Livreur
- ✅ Liste des livraisons assignées
- ✅ Navigation GPS intégrée
- ✅ Preuve de livraison (photo + signature)
- ✅ Collecte de paiements
- ✅ Gestion des emballages

### 👤 Interface Admin
- ✅ Gestion des utilisateurs
- ✅ Rapports et statistiques
- ✅ Configuration système
- ✅ Monitoring en temps réel

### � Fonctionnalités Transverses
- ✅ Mode hors ligne avec synchronisation automatique
- ✅ Notifications push en temps réel (WebSocket)
- ✅ Thème clair/sombre
- ✅ Multi-langue (FR/EN)
- ✅ Optimisation des images
- ✅ Cache intelligent

---

## 🚀 Quick Start

### Prérequis

- Flutter SDK 3.16.0+
- Dart SDK 3.2.0+
- Android Studio / VS Code
- Xcode (pour iOS)

### Installation

```bash
# Cloner le repository
git clone https://github.com/awid/mobile-v4.git
cd mobile-v4

# Installer les dépendances
flutter pub get

# Générer les fichiers
flutter pub run build_runner build --delete-conflicting-outputs

# Lancer l'application
flutter run
```

### Configuration

Créez `.env` à la racine:

```env
API_BASE_URL=https://api.awid.com/v4
WEBSOCKET_URL=wss://api.awid.com
SENTRY_DSN=your_sentry_dsn
GOOGLE_MAPS_API_KEY=your_google_maps_key
```

---

## 📚 Documentation

### 📖 Guides Utilisateur
- [Guide Utilisateur Complet](docs/USER_GUIDE.md) - Guide détaillé pour tous les utilisateurs
- [Guide de Dépannage](docs/TROUBLESHOOTING.md) - Solutions aux problèmes courants

### 🛠️ Guides Développeur
- [Guide Développeur](docs/DEVELOPER_GUIDE.md) - Setup, conventions et best practices
- [Architecture](docs/ARCHITECTURE.md) - Architecture détaillée de l'application
- [API Documentation](docs/API_DOCUMENTATION.md) - Documentation complète de l'API REST et WebSocket
- [Guide de Tests](docs/TESTING_GUIDE.md) - Comment écrire et exécuter les tests

### 🚀 Guides Déploiement
- [Guide de Déploiement](docs/DEPLOYMENT_GUIDE.md) - Build et déploiement Android/iOS

### 📊 Status du Projet
- [Status du Projet](PROJECT_STATUS.md) - État actuel du développement
- [Plan Mobile v4](PLAN_MOBILE_V4.md) - Plan de développement complet
- [Sprint 10 Progress](SPRINT_10_PROGRESS.md) - Progression des tests et documentation

---

## 🏗️ Architecture

### Clean Architecture

Le projet suit les principes de Clean Architecture avec 3 couches distinctes:

```
lib/
├── core/                 # Code partagé
│   ├── config/          # Configuration (API, theme, app)
│   ├── network/         # HTTP (Dio) & WebSocket (Socket.IO)
│   ├── services/        # Services globaux (connectivity, sync, cache)
│   ├── storage/         # Stockage local (Hive, Secure Storage)
│   ├── theme/           # Thème de l'application
│   ├── utils/           # Utilitaires (error handler, formatters, validators)
│   └── widgets/         # Widgets partagés
│
└── features/            # Fonctionnalités par domaine
    ├── auth/            # Authentification
    ├── kitchen/         # Interface cuisine
    ├── customer/        # Interface client
    ├── deliverer/       # Interface livreur
    └── admin/           # Interface admin
```

### Structure par Feature

Chaque feature suit la Clean Architecture:

```
feature/
├── data/
│   ├── datasources/     # Sources de données (API, Local, WebSocket)
│   ├── models/          # Modèles de données (JSON ↔ Entity)
│   └── repositories/    # Implémentations des repositories
├── domain/
│   ├── entities/        # Entités métier (pure Dart)
│   ├── repositories/    # Interfaces des repositories
│   └── usecases/        # Cas d'utilisation (business logic)
└── presentation/
    ├── pages/           # Écrans de l'application
    ├── widgets/         # Composants UI réutilisables
    └── providers/       # State management (Riverpod)
```

---

## 🛠️ Stack Technique

### Core
- **Flutter**: 3.16.0+ - Framework UI
- **Dart**: 3.2.0+ - Langage

### State Management
- **Riverpod**: 2.4.0 - State management réactif

### Networking
- **Dio**: 5.4.0 - Client HTTP avec interceptors
- **Socket.IO Client**: 2.0.3 - WebSocket temps réel

### Storage
- **Hive**: 2.2.3 - Base de données locale NoSQL
- **Flutter Secure Storage**: 9.0.0 - Stockage sécurisé (tokens, credentials)

### Services Externes
- **Firebase**: Analytics, Crashlytics, Cloud Messaging
- **Sentry**: Error tracking et monitoring
- **Google Maps**: Navigation GPS et tracking

### UI/UX
- **Cached Network Image**: Cache d'images optimisé
- **Shimmer**: Animations de chargement
- **Lottie**: Animations vectorielles

### Testing
- **Mockito**: 5.4.0 - Mocking pour tests
- **Flutter Test**: Tests unitaires et widgets

---

## 🧪 Tests

### Exécuter les Tests

```bash
# Tous les tests
flutter test

# Tests spécifiques
flutter test test/domain/
flutter test test/data/
flutter test test/presentation/

# Avec coverage
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

### Scripts de Test

```bash
# Tous les tests
./scripts/run_tests.sh -a

# Tests unitaires seulement
./scripts/run_tests.sh -u

# Tests widgets seulement
./scripts/run_tests.sh -w

# Avec coverage
./scripts/run_tests.sh -c

# Mode watch (re-run automatique)
./scripts/run_tests.sh --watch
```

### Statistiques de Tests

- **Tests écrits**: 1,119
- **Coverage**: ~75%
- **Fichiers de tests**: 40
- **Assertions**: ~3,500
- **Temps d'exécution**: < 90s

### Types de Tests

- ✅ Tests unitaires (Domain & Data layers)
- ✅ Tests de widgets (Presentation layer)
- ✅ Tests d'intégration (Repositories)
- ✅ Tests de providers (State management)
- ✅ Tests de services (Core services)

---

## 📦 Build

### Android

```bash
# Debug
flutter build apk --debug

# Release
flutter build apk --release

# App Bundle (recommandé pour Play Store)
flutter build appbundle --release
```

### iOS

```bash
# Debug
flutter build ios --debug

# Release
flutter build ios --release

# Archive (pour App Store)
flutter build ipa --release
```

### Scripts de Build

```bash
# Build Android
./scripts/build_android.sh

# Build iOS
./scripts/build_ios.sh

# Générer coverage
./scripts/generate_coverage.sh
```

---

## 🔄 CI/CD

### GitHub Actions

Le projet utilise GitHub Actions pour l'intégration continue:

- ✅ Tests automatiques sur chaque PR
- ✅ Analyse statique du code (`flutter analyze`)
- ✅ Vérification du formatage
- ✅ Build Android/iOS
- ✅ Génération du coverage
- ✅ Déploiement automatique sur les stores (tags)

Configuration: [`.github/workflows/ci.yml`](.github/workflows/ci.yml)

---

## 🤝 Contribution

### Workflow

1. Fork le projet
2. Créer une branche feature (`git checkout -b feature/amazing-feature`)
3. Commit les changements (`git commit -m 'feat: add amazing feature'`)
4. Push vers la branche (`git push origin feature/amazing-feature`)
5. Ouvrir une Pull Request

### Conventions

#### Commits
Format [Conventional Commits](https://www.conventionalcommits.org/):
- `feat:` Nouvelle fonctionnalité
- `fix:` Correction de bug
- `docs:` Documentation
- `style:` Formatage
- `refactor:` Refactoring
- `test:` Tests
- `chore:` Maintenance

#### Code
- Suivre les [conventions Dart](https://dart.dev/guides/language/effective-dart)
- Utiliser `flutter format .` avant de commit
- Pas de warnings (`flutter analyze`)
- Ajouter des tests pour toute nouvelle fonctionnalité
- Documenter les fonctions publiques

### Code Review Checklist

- [ ] Code suit les conventions
- [ ] Tests ajoutés/mis à jour
- [ ] Documentation mise à jour
- [ ] Pas de warnings
- [ ] Build réussit
- [ ] Tests passent (coverage maintenu)

---

## 📊 Métriques du Projet

### Développement

- **Sprints complétés**: 10/10 ✅
- **Fonctionnalités**: 100% ✅
- **Tests**: 1,119 tests
- **Coverage**: ~75%
- **Lignes de code**: ~50,000
- **Fichiers**: 200+

### Performance

- **Temps de démarrage**: < 2s
- **Temps de build**: ~3 min (Android), ~5 min (iOS)
- **Taille de l'app**: ~25 MB (Android), ~30 MB (iOS)
- **FPS moyen**: 60 FPS

---

## 📝 Changelog

### Version 4.0.0 (27 Janvier 2026)

#### ✨ Ajouté
- Interface cuisine complète avec Kanban drag & drop
- Interface client avec suivi GPS en temps réel
- Interface livreur avec preuve de livraison (photo + signature)
- Interface admin avec dashboard et statistiques
- Mode hors ligne avec synchronisation automatique
- WebSocket pour mises à jour temps réel
- Notifications push (Firebase Cloud Messaging)
- Gestion des emballages consignés
- Collecte de paiements avec allocation
- Thème clair/sombre
- Multi-langue (FR/EN)

#### ⚡ Amélioré
- Performance optimisée (lazy loading, pagination, cache)
- UI/UX modernisée avec Material Design 3
- Support Android 13+ et iOS 13+
- Sécurité renforcée (certificate pinning, secure storage)
- Optimisation des images (compression, cache)

#### 🧪 Tests
- 1,119 tests ajoutés (unitaires, widgets, intégration)
- Coverage ~75%
- CI/CD configuré avec GitHub Actions
- Documentation complète

---

## 📞 Support

### Contact

- **Email**: support@awid.com
- **Téléphone**: +33 1 23 45 67 89
- **Horaires**: Lundi-Vendredi, 9h-18h

### Liens Utiles

- [Documentation Complète](https://docs.awid.com)
- [API Documentation](docs/API_DOCUMENTATION.md)
- [Guide de Dépannage](docs/TROUBLESHOOTING.md)
- [GitHub Issues](https://github.com/awid/mobile-v4/issues)

---

## � Licence

Copyright © 2026 AWID. Tous droits réservés.

---

## 👥 Équipe

Développé avec ❤️ par l'équipe AWID

---

## 🙏 Remerciements

- [Flutter](https://flutter.dev/) - Framework UI
- [Riverpod](https://riverpod.dev/) - State management
- [Dio](https://pub.dev/packages/dio) - HTTP client
- [Socket.IO](https://socket.io/) - WebSocket
- [Hive](https://pub.dev/packages/hive) - Local database
- [Firebase](https://firebase.google.com/) - Backend services
- [Sentry](https://sentry.io/) - Error tracking

---

## 📊 Progression des Sprints

| Sprint | Nom | Status | Progression |
|--------|-----|--------|-------------|
| 1 | Setup & Core | ✅ | 100% |
| 2 | Authentification | ✅ | 100% |
| 3 | Admin Dashboard | ✅ | 100% |
| 4 | Admin Gestion | ✅ | 100% |
| 5 | Livreur Dashboard | ✅ | 100% |
| 6 | Livreur Actions | ✅ | 100% |
| 7 | Client Interface | ✅ | 100% |
| 8 | Cuisine Kanban | ✅ | 100% |
| 9 | Polish & Optimisation | ✅ | 100% |
| 10 | Tests & Documentation | ✅ | 100% |

**Progression Globale**: 100% ✅

---

**Version**: 4.0.0  
**Build**: 40  
**Status**: ✅ Production Ready  
**Dernière mise à jour**: 27 Janvier 2026

🎉 **Tous les sprints complétés! Application prête pour la production.**
