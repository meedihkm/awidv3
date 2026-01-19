# Vérification des Types - Base de Données

## Types Confirmés dans la Base

### Tables Principales
- `users.id` → **TEXT**
- `organizations.id` → **TEXT**
- `deliveries.id` → **TEXT**
- `orders.id` → **TEXT**
- `products.id` → **TEXT**

### Tables Nouvelles (nos migrations)
- `payment_transactions.id` → **UUID** ✅
- `favorite_orders.id` → **UUID** ✅
- `notifications.id` → **UUID** ✅

## Corrections Appliquées

### sql_payment_system.sql
- ✅ `client_id` → TEXT
- ✅ `organization_id` → TEXT
- ✅ `recorded_by` → TEXT
- ✅ `delivery_id` → TEXT
- ✅ `p_target_orders` → TEXT[]

### sql_favorite_orders_system.sql
- ✅ `client_id` → TEXT
- ✅ `organization_id` → TEXT
- ✅ `user_id` (preferences) → TEXT

### sql_notifications_system.sql
- ✅ `user_id` → TEXT
- ✅ `organization_id` → TEXT

## Règle Générale
**Toutes les foreign keys vers tables existantes doivent être TEXT**
**Seulement les nouvelles tables peuvent utiliser UUID pour leur propre id**
