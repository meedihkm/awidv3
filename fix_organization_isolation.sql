-- =============================================
-- FIX CRITIQUE: ISOLATION DES DONNÉES PAR ORGANISATION
-- Date: 19 Janvier 2026
-- =============================================
-- Ce script corrige le bug d'isolation des données entre organisations
-- EXÉCUTER CE SCRIPT SUR VOTRE BASE SUPABASE IMMÉDIATEMENT
-- =============================================

-- =============================================
-- ÉTAPE 1: AJOUTER LES CONTRAINTES CASCADE MANQUANTES
-- =============================================

-- Users -> Organizations (CASCADE DELETE)
ALTER TABLE users DROP CONSTRAINT IF EXISTS users_organization_id_fkey;
ALTER TABLE users ADD CONSTRAINT users_organization_id_fkey 
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;

-- Products -> Organizations (CASCADE DELETE)
ALTER TABLE products DROP CONSTRAINT IF EXISTS products_organization_id_fkey;
ALTER TABLE products ADD CONSTRAINT products_organization_id_fkey 
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;

-- Orders -> Organizations (CASCADE DELETE)
ALTER TABLE orders DROP CONSTRAINT IF EXISTS orders_organization_id_fkey;
ALTER TABLE orders ADD CONSTRAINT orders_organization_id_fkey 
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;

-- Deliveries -> Organizations (CASCADE DELETE)
ALTER TABLE deliveries DROP CONSTRAINT IF EXISTS deliveries_organization_id_fkey;
ALTER TABLE deliveries ADD CONSTRAINT deliveries_organization_id_fkey 
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;

-- Audit_logs -> Organizations (CASCADE DELETE)
ALTER TABLE audit_logs DROP CONSTRAINT IF EXISTS audit_logs_organization_id_fkey;
ALTER TABLE audit_logs ADD CONSTRAINT audit_logs_organization_id_fkey 
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;

-- Order_sequences -> Organizations (CASCADE DELETE)
ALTER TABLE order_sequences DROP CONSTRAINT IF EXISTS order_sequences_organization_id_fkey;
ALTER TABLE order_sequences ADD CONSTRAINT order_sequences_organization_id_fkey 
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;

-- Order_items -> Orders (CASCADE DELETE)
ALTER TABLE order_items DROP CONSTRAINT IF EXISTS order_items_order_id_fkey;
ALTER TABLE order_items ADD CONSTRAINT order_items_order_id_fkey 
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE;

-- Refresh_tokens -> Users (CASCADE DELETE)
ALTER TABLE refresh_tokens DROP CONSTRAINT IF EXISTS refresh_tokens_user_id_fkey;
ALTER TABLE refresh_tokens ADD CONSTRAINT refresh_tokens_user_id_fkey 
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;

-- Location_history -> Users (CASCADE DELETE)
ALTER TABLE location_history DROP CONSTRAINT IF EXISTS location_history_deliverer_id_fkey;
ALTER TABLE location_history ADD CONSTRAINT location_history_deliverer_id_fkey 
    FOREIGN KEY (deliverer_id) REFERENCES users(id) ON DELETE CASCADE;

-- =============================================
-- ÉTAPE 2: VÉRIFIER L'ISOLATION DES DONNÉES
-- =============================================

-- Cette requête montre toutes les organisations et le nombre d'enregistrements associés
SELECT 
    o.id as organization_id,
    o.name as organization_name,
    o.created_at,
    (SELECT COUNT(*) FROM users WHERE organization_id = o.id) as users_count,
    (SELECT COUNT(*) FROM products WHERE organization_id = o.id) as products_count,
    (SELECT COUNT(*) FROM orders WHERE organization_id = o.id) as orders_count,
    (SELECT COUNT(*) FROM deliveries WHERE organization_id = o.id) as deliveries_count,
    (SELECT COUNT(*) FROM audit_logs WHERE organization_id = o.id) as audit_logs_count
FROM organizations o
ORDER BY o.created_at DESC;

-- =============================================
-- ÉTAPE 3: NETTOYER LES DONNÉES ORPHELINES (SI NÉCESSAIRE)
-- =============================================

-- Trouver les données qui n'appartiennent à aucune organisation existante
-- (ceci ne devrait rien retourner si tout est correct)

-- Users orphelins
SELECT 'USERS ORPHELINS' as type, COUNT(*) as count
FROM users u
WHERE NOT EXISTS (SELECT 1 FROM organizations o WHERE o.id = u.organization_id);

-- Products orphelins
SELECT 'PRODUCTS ORPHELINS' as type, COUNT(*) as count
FROM products p
WHERE NOT EXISTS (SELECT 1 FROM organizations o WHERE o.id = p.organization_id);

-- Orders orphelins
SELECT 'ORDERS ORPHELINS' as type, COUNT(*) as count
FROM orders ord
WHERE NOT EXISTS (SELECT 1 FROM organizations o WHERE o.id = ord.organization_id);

-- Deliveries orphelines
SELECT 'DELIVERIES ORPHELINES' as type, COUNT(*) as count
FROM deliveries d
WHERE NOT EXISTS (SELECT 1 FROM organizations o WHERE o.id = d.organization_id);

-- Audit logs orphelins
SELECT 'AUDIT_LOGS ORPHELINS' as type, COUNT(*) as count
FROM audit_logs a
WHERE NOT EXISTS (SELECT 1 FROM organizations o WHERE o.id = a.organization_id);

-- =============================================
-- ÉTAPE 4: SUPPRIMER LES DONNÉES ORPHELINES (OPTIONNEL)
-- =============================================
-- ATTENTION: Décommentez ces lignes SEULEMENT si vous voulez supprimer les données orphelines
-- Ceci supprimera définitivement les données qui n'appartiennent à aucune organisation

-- DELETE FROM users WHERE NOT EXISTS (SELECT 1 FROM organizations o WHERE o.id = users.organization_id);
-- DELETE FROM products WHERE NOT EXISTS (SELECT 1 FROM organizations o WHERE o.id = products.organization_id);
-- DELETE FROM orders WHERE NOT EXISTS (SELECT 1 FROM organizations o WHERE o.id = orders.organization_id);
-- DELETE FROM deliveries WHERE NOT EXISTS (SELECT 1 FROM organizations o WHERE o.id = deliveries.organization_id);
-- DELETE FROM audit_logs WHERE NOT EXISTS (SELECT 1 FROM organizations o WHERE o.id = audit_logs.organization_id);

-- =============================================
-- ÉTAPE 5: TESTER LA SUPPRESSION CASCADE
-- =============================================
-- Pour tester que la suppression CASCADE fonctionne correctement:
-- 1. Créez une organisation de test
-- 2. Ajoutez quelques données (users, products, orders)
-- 3. Supprimez l'organisation
-- 4. Vérifiez que TOUTES les données associées ont été supprimées

-- Exemple de test (NE PAS EXÉCUTER EN PRODUCTION):
/*
-- Créer une org de test
INSERT INTO organizations (id, name, type) VALUES ('test-org-delete', 'Test Delete', 'restaurant');

-- Ajouter un user de test
INSERT INTO users (organization_id, email, password, name, role) 
VALUES ('test-org-delete', 'test@delete.com', 'hash', 'Test User', 'admin');

-- Supprimer l'org de test
DELETE FROM organizations WHERE id = 'test-org-delete';

-- Vérifier que le user a été supprimé aussi
SELECT COUNT(*) FROM users WHERE organization_id = 'test-org-delete'; -- Devrait retourner 0
*/

-- =============================================
-- ÉTAPE 6: VÉRIFICATION FINALE
-- =============================================

-- Cette requête vérifie que toutes les contraintes CASCADE sont en place
SELECT
    tc.table_name,
    tc.constraint_name,
    tc.constraint_type,
    kcu.column_name,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name,
    rc.delete_rule
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
    AND tc.table_schema = kcu.table_schema
JOIN information_schema.constraint_column_usage AS ccu
    ON ccu.constraint_name = tc.constraint_name
    AND ccu.table_schema = tc.table_schema
LEFT JOIN information_schema.referential_constraints AS rc
    ON tc.constraint_name = rc.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
    AND tc.table_schema = 'public'
    AND (ccu.table_name = 'organizations' OR ccu.table_name = 'users' OR ccu.table_name = 'orders')
ORDER BY tc.table_name, tc.constraint_name;

-- =============================================
-- FIN DU SCRIPT
-- =============================================

SELECT 'Script de correction terminé avec succès!' as status;
SELECT 'Vérifiez les résultats ci-dessus pour confirmer que tout est correct.' as next_step;
