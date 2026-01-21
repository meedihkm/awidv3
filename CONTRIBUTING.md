# Guide de Contribution - Awid

Merci de vouloir contribuer au projet Awid ! Voici les règles et standards à suivre.

## Installation de l'environnement

1.  **Prérequis**
    *   Node.js >= 18
    *   PostgreSQL >= 14
    *   Flutter SDK (pour le mobile)

2.  **Setup Backend**
    ```bash
    # Installation des dépendances
    npm install
    
    # Configuration
    cp .env.example .env
    # Remplir les variables DB_*, JWT_*, etc.
    
    # Lancement
    npm run dev
    ```

## Standards de Code

### Backend (Node.js)
- **Style**: Utiliser le style par défaut (pas de linter strict configuré actuellement, mais code propre requis).
- **Structure**:
    - **Routes**: `api-v2/routes/` - Définition des endpoints.
    - **Middleware**: `api-v2/middleware/` - Logique transverse (Auth, Validation).
    - **Config**: `api-v2/config/` - Configuration (DB, Swagger, Logger).
- **Documentation**: Toute nouvelle route DOIT être documentée avec `@swagger`.

### Mobile (Flutter)
- **Style**: Respecter les conventions Dart (`flutter analyze`).
- **Tests**: Tout nouveau widget/logique doit avoir un test associé.

## Git Flow

- **Master/Main**: Branche de production stable.
- **Develop** (ou branches features) : Développement en cours.
- **Commits**: Utiliser [Conventional Commits](https://www.conventionalcommits.org/)
    - `feat: ajouter login`
    - `fix: corriger calcul montant`
    - `docs: mettre à jour readme`
    - `test: ajouter tests unitaires`

## Tests

Avant de pousser votre code, assurez-vous que tous les tests passent :

```bash
# Backend
npm test

# Mobile
cd mobile
flutter test
```
