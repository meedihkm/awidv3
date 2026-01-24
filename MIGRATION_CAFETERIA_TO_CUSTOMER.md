# Migration: Cafeteria → Customer

## 📋 Résumé

Cette migration uniformise la terminologie en remplaçant `'cafeteria'` par `'customer'` partout dans le code et la base de données.

## ✅ Ce qui a été fait (Commits)

### Commit 340abdc - Refactorisation complète

- ✅ Backend: Tous les fichiers `.js` mis à jour
- ✅ Flutter: Dossier `features/cafeteria` renommé en `features/customer`
- ✅ Flutter: `CafeteriaDashboard` renommé en `CustomerDashboard`
- ✅ Tous les imports et références mis à jour
- ✅ Migration SQL créée

## 🗄️ Migration Base de Données

### ⚠️ IMPORTANT: À exécuter AVANT de redéployer

Exécutez ce SQL dans votre base de données PostgreSQL:

```sql
-- Mettre à jour tous les utilisateurs avec role 'cafeteria' vers 'customer'
UPDATE users
SET role = 'customer'
WHERE role = 'cafeteria';

-- Vérifier le résultat
SELECT
    role,
    COUNT(*) as count
FROM users
GROUP BY role
ORDER BY role;
```

### Résultat attendu:

```
role      | count
----------+-------
admin     | X
customer  | Y  (ancien cafeteria + customer)
deliverer | Z
kitchen   | W
```

## 📱 Étapes de déploiement

### 1. Base de données (PREMIER)

```bash
# Connectez-vous à votre base PostgreSQL
psql -h <host> -U <user> -d <database>

# Exécutez la migration
\i api-v2/migrations/rename_cafeteria_to_customer.sql

# Ou copiez-collez le SQL directement
```

### 2. Backend (DEUXIÈME)

```bash
# Dans Coolify, cliquez sur "Redeploy"
# Le backend va automatiquement pull le commit 340abdc
```

### 3. Flutter (TROISIÈME)

```bash
# Rebuild l'APK
cd mobile
flutter clean
flutter pub get
flutter build apk --release

# L'APK sera dans: mobile/build/app/outputs/flutter-apk/app-release.apk
```

## 🔍 Vérifications post-migration

### Backend

1. Vérifiez les logs Coolify - aucune erreur de rôle
2. Testez l'endpoint `/api/users` - les clients doivent avoir `role: 'customer'`
3. Testez la création de commande récurrente

### Flutter

1. Connexion avec compte client fonctionne
2. Dashboard client s'affiche correctement
3. Création de commande fonctionne
4. Commandes récurrentes fonctionnent

## 🐛 Rollback (si nécessaire)

Si vous devez revenir en arrière:

```sql
-- Rollback SQL
UPDATE users
SET role = 'cafeteria'
WHERE role = 'customer';
```

```bash
# Rollback Git
git revert 340abdc
git push origin main
```

## 📝 Notes importantes

- Cette migration est **idempotente** (peut être exécutée plusieurs fois)
- Les utilisateurs existants avec `role = 'customer'` ne sont pas affectés
- Tous les anciens `'cafeteria'` deviennent `'customer'`
- Le code ne reconnaît plus `'cafeteria'` comme rôle valide

## ✨ Avantages

1. **Terminologie claire**: "Customer" est plus universel que "Cafeteria"
2. **Code simplifié**: Plus besoin de gérer deux rôles similaires
3. **Maintenance facilitée**: Un seul terme à maintenir
4. **Évolutivité**: Facile d'ajouter d'autres types de clients à l'avenir
