# 🔍 Rapport d'Audit - Bugs Potentiels Awid

## Date: 11 Janvier 2026

---

## 🔴 BUGS CRITIQUES (À corriger immédiatement)

### 1. Route `/api/deliverers/:id/location-history` inexistante dans V2
**Fichier**: `api-v2/routes/deliveries.routes.js`
**Problème**: La route est définie comme `/:id/location-history` mais l'app Flutter appelle `/deliverers/:id/history`
**Impact**: Crash lors de l'affichage de l'historique GPS
**Solution**: Harmoniser les noms de routes

### 2. Champ `organization_id` manquant dans certaines requêtes
**Fichier**: `api-v2/routes/deliveries.routes.js` ligne 264
**Problème**: La requête `location_history` ne filtre pas par `organization_id`
**Impact**: Fuite de données potentielle entre organisations

### 3. Table `location_history` potentiellement inexistante
**Problème**: La table n'est pas créée par défaut
**Impact**: Erreur 500 sur les routes d'historique GPS
**Solution**: Exécuter la migration SQL

---

## 🟠 BUGS MOYENS (À corriger rapidement)

### 4. Parsing null non sécurisé dans V1
**Fichier**: `api/index.js`
**Problème**: `parseFloat(item.price)` peut retourner NaN si price est null
**Lignes**: 371, 394, 855, 887, etc.
**Solution**: Utiliser `safeParseFloat(value)` helper
**Status**: ✅ CORRIGÉ

### 5. Incohérence noms de champs API vs Flutter
**Problème**: L'API retourne `organization_id` mais Flutter attend `organizationId`
**Impact**: Certains champs peuvent être null dans l'app
**Fichiers concernés**:
- `api/index.js` - retourne snake_case pour certains champs
- `mobile/lib/core/models/*.dart` - attend camelCase

### 6. Route `/api/audit-logs` mal montée dans V2
**Fichier**: `api-v2/index.js`
**Problème**: Montée sur `/api/audit-logs` mais route définie comme `/`
**Status**: ✅ CORRIGÉ

### 7. Routes `/api/financial/*` mal montées dans V2
**Fichier**: `api-v2/routes/organization.routes.js`
**Problème**: Routes définies comme `/financial/debts` au lieu de `/debts`
**Status**: ✅ CORRIGÉ

---

## 🟡 BUGS MINEURS (À surveiller)

### 8. Gestion d'erreur manquante dans certaines routes
**Fichiers**: Plusieurs routes n'ont pas de try/catch complet
**Impact**: Erreurs non gérées peuvent crasher le serveur

### 9. Validation UUID manquante sur certains paramètres
**Fichier**: `api/index.js`
**Problème**: Les paramètres `:id` ne sont pas validés comme UUID
**Impact**: Injection SQL potentielle (faible risque avec pg)

### 10. Refresh token non révoqué après logout
**Problème**: Si l'utilisateur ne fournit pas le refreshToken au logout, il reste valide
**Impact**: Session zombie possible

---

## 🔒 PROBLÈMES DE SÉCURITÉ

### 11. Rate limiting insuffisant sur certaines routes
**Routes concernées**:
- `/api/products` - pas de limite spécifique
- `/api/orders` - pas de limite spécifique
**Recommandation**: Ajouter des limites par utilisateur

### 12. Logs d'audit incomplets
**Problème**: Certaines actions sensibles ne sont pas loguées
**Actions manquantes**:
- Modification de mot de passe
- Changement de rôle utilisateur

---

## 📱 BUGS FLUTTER

### 13. Null safety non respecté dans certains modèles
**Fichier**: `mobile/lib/core/models/delivery_model.dart`
**Problème**: `Order.fromJson(json['order'] ?? {})` peut créer un Order invalide
**Solution**: Vérifier que order n'est pas null avant de créer Delivery

### 14. Gestion d'erreur réseau insuffisante
**Fichier**: `mobile/lib/core/services/api_service.dart`
**Problème**: Les erreurs réseau (timeout, no internet) ne sont pas bien gérées
**Impact**: L'app peut crasher sans connexion

### 15. Memory leak potentiel
**Fichier**: `mobile/lib/features/admin/presentation/pages/financial_page.dart`
**Problème**: TabController non disposé si erreur dans initState
**Solution**: Déplacer dispose dans un bloc finally

---

## ✅ CORRECTIONS DÉJÀ APPLIQUÉES

1. ✅ Colonne `u.address` retirée des requêtes SQL (V1 et V2)
2. ✅ Routes `/api/financial/*` corrigées dans V2
3. ✅ Route `/api/audit-logs` corrigée dans V2
4. ✅ Fichier `sql_migrations.sql` mis à jour avec toutes les colonnes
5. ✅ Helper `safeParseFloat` ajouté dans V2 (`order.service.js`)
6. ✅ Helper `safeParseFloat` ajouté dans V1 (`api/index.js`) - évite NaN sur valeurs null
7. ✅ Route `/api/deliverers/:id/history` harmonisée (V1 et V2)

---

## 📋 MIGRATIONS SQL À EXÉCUTER

```sql
-- Si pas déjà fait, exécuter ces migrations sur Supabase:

-- Table location_history (si inexistante)
CREATE TABLE IF NOT EXISTS location_history (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    deliverer_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    latitude DECIMAL(10,8) NOT NULL,
    longitude DECIMAL(11,8) NOT NULL,
    recorded_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_location_history_deliverer ON location_history(deliverer_id);
CREATE INDEX IF NOT EXISTS idx_location_history_date ON location_history(recorded_at);

-- Colonnes manquantes potentielles
ALTER TABLE users ADD COLUMN IF NOT EXISTS latitude DECIMAL(10,8);
ALTER TABLE users ADD COLUMN IF NOT EXISTS longitude DECIMAL(11,8);
ALTER TABLE users ADD COLUMN IF NOT EXISTS location_updated_at TIMESTAMP WITH TIME ZONE;

ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS failed_at TIMESTAMP WITH TIME ZONE;
ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS postponed_to DATE;
ALTER TABLE deliveries ADD COLUMN IF NOT EXISTS attempts INTEGER DEFAULT 0;
```

---

## 🎯 PRIORITÉ DES CORRECTIONS

1. **URGENT**: Exécuter les migrations SQL
2. **HAUTE**: Corriger les incohérences de noms de champs
3. **MOYENNE**: Améliorer la gestion d'erreurs
4. **BASSE**: Optimiser le rate limiting
