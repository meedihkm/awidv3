-- =====================================================
-- MIGRATION: Renommer 'cafeteria' en 'customer'
-- Uniformiser le rôle client dans toute la base de données
-- =====================================================

-- Étape 1: Mettre à jour tous les utilisateurs avec role 'cafeteria' vers 'customer'
UPDATE users 
SET role = 'customer' 
WHERE role = 'cafeteria';

-- Étape 2: Vérifier le résultat
SELECT 
    role, 
    COUNT(*) as count 
FROM users 
GROUP BY role 
ORDER BY role;

-- Note: Cette migration est idempotente (peut être exécutée plusieurs fois sans problème)
