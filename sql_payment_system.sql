-- =============================================
-- SYSTÈME DE GESTION DES DETTES
-- Date: 19 Janvier 2026
-- =============================================

-- =============================================
-- 1. TABLE PAYMENT_TRANSACTIONS
-- =============================================

CREATE TABLE IF NOT EXISTS payment_transactions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id TEXT NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    client_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    payment_type VARCHAR(20) NOT NULL CHECK (payment_type IN ('delivery', 'debt_only')),
    payment_mode VARCHAR(20) NOT NULL DEFAULT 'auto' CHECK (payment_mode IN ('auto', 'manual')),
    delivery_id TEXT REFERENCES deliveries(id) ON DELETE SET NULL,
    target_orders JSONB DEFAULT '[]', -- Liste des order_id si mode manuel
    orders_affected JSONB DEFAULT '[]', -- Résultat: commandes impactées avec montants
    recorded_by TEXT NOT NULL REFERENCES users(id) ON DELETE SET NULL,
    recorded_by_role VARCHAR(20) NOT NULL CHECK (recorded_by_role IN ('admin', 'deliverer')),
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index pour performance
CREATE INDEX IF NOT EXISTS idx_payment_transactions_client ON payment_transactions(client_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_payment_transactions_org ON payment_transactions(organization_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_payment_transactions_delivery ON payment_transactions(delivery_id) WHERE delivery_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_payment_transactions_recorded_by ON payment_transactions(recorded_by, created_at DESC);

-- Contrainte CASCADE
ALTER TABLE payment_transactions DROP CONSTRAINT IF EXISTS payment_transactions_organization_id_fkey;
ALTER TABLE payment_transactions ADD CONSTRAINT payment_transactions_organization_id_fkey 
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;

-- =============================================
-- 2. VUE: DETTE PAR CLIENT
-- =============================================

CREATE OR REPLACE VIEW client_debts_view AS
SELECT 
    u.id as client_id,
    u.organization_id,
    u.name as client_name,
    u.email as client_email,
    u.phone as client_phone,
    COALESCE(SUM(o.total - o.amount_paid), 0) as total_debt,
    COUNT(o.id) FILTER (WHERE o.total > o.amount_paid) as unpaid_orders_count,
    MAX(o.created_at) as last_order_date,
    COALESCE(SUM(o.total), 0) as total_ordered,
    COALESCE(SUM(o.amount_paid), 0) as total_paid
FROM users u
LEFT JOIN orders o ON u.id = o.cafeteria_id
WHERE u.role = 'cafeteria' AND u.active = true
GROUP BY u.id, u.organization_id, u.name, u.email, u.phone;

-- =============================================
-- 3. FONCTION: APPLIQUER PAIEMENT
-- =============================================

CREATE OR REPLACE FUNCTION apply_payment_to_client(
    p_client_id TEXT,
    p_amount DECIMAL(10,2),
    p_organization_id TEXT,
    p_recorded_by TEXT,
    p_recorded_by_role VARCHAR(20),
    p_payment_mode VARCHAR(20) DEFAULT 'auto',
    p_delivery_id TEXT DEFAULT NULL,
    p_target_orders TEXT[] DEFAULT NULL,
    p_notes TEXT DEFAULT NULL
) RETURNS JSONB AS $$
DECLARE
    v_remaining_amount DECIMAL(10,2);
    v_order RECORD;
    v_debt_before DECIMAL(10,2);
    v_amount_to_apply DECIMAL(10,2);
    v_orders_affected JSONB := '[]'::JSONB;
    v_transaction_id UUID;
    v_payment_type VARCHAR(20);
BEGIN
    -- Calculer la dette avant paiement
    SELECT COALESCE(SUM(total - amount_paid), 0) INTO v_debt_before
    FROM orders WHERE cafeteria_id = p_client_id AND total > amount_paid;
    
    v_remaining_amount := p_amount;
    
    -- Déterminer le type de paiement
    IF p_delivery_id IS NOT NULL THEN
        v_payment_type := 'delivery';
    ELSE
        v_payment_type := 'debt_only';
    END IF;
    
    -- MODE MANUEL: Appliquer sur les commandes spécifiées
    IF p_payment_mode = 'manual' AND p_target_orders IS NOT NULL THEN
        FOR v_order IN 
            SELECT * FROM orders 
            WHERE id = ANY(p_target_orders)
              AND cafeteria_id = p_client_id
              AND total > amount_paid
            ORDER BY created_at ASC
        LOOP
            v_amount_to_apply := LEAST(v_remaining_amount, v_order.total - v_order.amount_paid);
            
            UPDATE orders 
            SET 
                amount_paid = amount_paid + v_amount_to_apply,
                payment_status = CASE 
                    WHEN amount_paid + v_amount_to_apply >= total THEN 'paid'
                    WHEN amount_paid + v_amount_to_apply > 0 THEN 'partial'
                    ELSE 'unpaid'
                END,
                updated_at = NOW()
            WHERE id = v_order.id;
            
            v_orders_affected := v_orders_affected || jsonb_build_object(
                'order_id', v_order.id,
                'order_number', v_order.order_number,
                'amount_applied', v_amount_to_apply,
                'previous_status', v_order.payment_status,
                'new_status', CASE 
                    WHEN v_order.amount_paid + v_amount_to_apply >= v_order.total THEN 'paid'
                    WHEN v_order.amount_paid + v_amount_to_apply > 0 THEN 'partial'
                    ELSE 'unpaid'
                END
            );
            
            v_remaining_amount := v_remaining_amount - v_amount_to_apply;
            EXIT WHEN v_remaining_amount <= 0;
        END LOOP;
    END IF;
    
    -- MODE AUTO ou reste après mode manuel: Appliquer sur les commandes les plus anciennes
    IF v_remaining_amount > 0 THEN
        -- Si c'est une livraison, payer d'abord la commande de cette livraison
        IF p_delivery_id IS NOT NULL THEN
            FOR v_order IN 
                SELECT o.* FROM orders o
                JOIN deliveries d ON d.order_id = o.id
                WHERE d.id = p_delivery_id AND o.total > o.amount_paid
            LOOP
                v_amount_to_apply := LEAST(v_remaining_amount, v_order.total - v_order.amount_paid);
                
                UPDATE orders 
                SET 
                    amount_paid = amount_paid + v_amount_to_apply,
                    payment_status = CASE 
                        WHEN amount_paid + v_amount_to_apply >= total THEN 'paid'
                        WHEN amount_paid + v_amount_to_apply > 0 THEN 'partial'
                        ELSE 'unpaid'
                    END,
                    updated_at = NOW()
                WHERE id = v_order.id;
                
                v_orders_affected := v_orders_affected || jsonb_build_object(
                    'order_id', v_order.id,
                    'order_number', v_order.order_number,
                    'amount_applied', v_amount_to_apply,
                    'previous_status', v_order.payment_status,
                    'new_status', CASE 
                        WHEN v_order.amount_paid + v_amount_to_apply >= v_order.total THEN 'paid'
                        WHEN v_order.amount_paid + v_amount_to_apply > 0 THEN 'partial'
                        ELSE 'unpaid'
                    END
                );
                
                v_remaining_amount := v_remaining_amount - v_amount_to_apply;
                EXIT WHEN v_remaining_amount <= 0;
            END LOOP;
        END IF;
        
        -- Appliquer le reste sur les autres commandes impayées (plus anciennes d'abord)
        IF v_remaining_amount > 0 THEN
            FOR v_order IN 
                SELECT * FROM orders 
                WHERE cafeteria_id = p_client_id 
                  AND total > amount_paid
                  AND (p_delivery_id IS NULL OR id NOT IN (
                      SELECT order_id FROM deliveries WHERE id = p_delivery_id
                  ))
                ORDER BY created_at ASC
            LOOP
                v_amount_to_apply := LEAST(v_remaining_amount, v_order.total - v_order.amount_paid);
                
                UPDATE orders 
                SET 
                    amount_paid = amount_paid + v_amount_to_apply,
                    payment_status = CASE 
                        WHEN amount_paid + v_amount_to_apply >= total THEN 'paid'
                        WHEN amount_paid + v_amount_to_apply > 0 THEN 'partial'
                        ELSE 'unpaid'
                    END,
                    updated_at = NOW()
                WHERE id = v_order.id;
                
                v_orders_affected := v_orders_affected || jsonb_build_object(
                    'order_id', v_order.id,
                    'order_number', v_order.order_number,
                    'amount_applied', v_amount_to_apply,
                    'previous_status', v_order.payment_status,
                    'new_status', CASE 
                        WHEN v_order.amount_paid + v_amount_to_apply >= v_order.total THEN 'paid'
                        WHEN v_order.amount_paid + v_amount_to_apply > 0 THEN 'partial'
                        ELSE 'unpaid'
                    END
                );
                
                v_remaining_amount := v_remaining_amount - v_amount_to_apply;
                EXIT WHEN v_remaining_amount <= 0;
            END LOOP;
        END IF;
    END IF;
    
    -- Enregistrer la transaction
    INSERT INTO payment_transactions (
        organization_id,
        client_id,
        amount,
        payment_type,
        payment_mode,
        delivery_id,
        target_orders,
        orders_affected,
        recorded_by,
        recorded_by_role,
        notes
    ) VALUES (
        p_organization_id,
        p_client_id,
        p_amount,
        v_payment_type,
        p_payment_mode,
        p_delivery_id,
        COALESCE(array_to_json(p_target_orders)::JSONB, '[]'::JSONB),
        v_orders_affected,
        p_recorded_by,
        p_recorded_by_role,
        p_notes
    ) RETURNING id INTO v_transaction_id;
    
    -- Retourner le résultat
    RETURN jsonb_build_object(
        'success', true,
        'transaction_id', v_transaction_id,
        'amount_applied', p_amount,
        'payment_mode', p_payment_mode,
        'orders_affected', v_orders_affected,
        'debt_before', v_debt_before,
        'debt_after', (SELECT COALESCE(SUM(total - amount_paid), 0) FROM orders WHERE cafeteria_id = p_client_id AND total > amount_paid),
        'debt_cleared', (SELECT COUNT(*) = 0 FROM orders WHERE cafeteria_id = p_client_id AND total > amount_paid)
    );
END;
$$ LANGUAGE plpgsql;

-- =============================================
-- 4. FONCTION: OBTENIR DÉTAILS DETTE CLIENT
-- =============================================

CREATE OR REPLACE FUNCTION get_client_debt_details(p_client_id TEXT)
RETURNS JSONB AS $$
DECLARE
    v_result JSONB;
BEGIN
    SELECT jsonb_build_object(
        'client', jsonb_build_object(
            'id', u.id,
            'name', u.name,
            'email', u.email,
            'phone', u.phone
        ),
        'total_debt', COALESCE(SUM(o.total - o.amount_paid) FILTER (WHERE o.total > o.amount_paid), 0),
        'unpaid_orders', jsonb_agg(
            jsonb_build_object(
                'id', o.id,
                'order_number', o.order_number,
                'date', o.created_at,
                'total', o.total,
                'amount_paid', o.amount_paid,
                'remaining', o.total - o.amount_paid,
                'payment_status', o.payment_status
            ) ORDER BY o.created_at ASC
        ) FILTER (WHERE o.total > o.amount_paid),
        'payment_history', (
            SELECT jsonb_agg(
                jsonb_build_object(
                    'id', pt.id,
                    'date', pt.created_at,
                    'amount', pt.amount,
                    'payment_type', pt.payment_type,
                    'payment_mode', pt.payment_mode,
                    'orders_affected', pt.orders_affected,
                    'recorded_by', jsonb_build_object(
                        'id', rec.id,
                        'name', rec.name,
                        'role', pt.recorded_by_role
                    ),
                    'notes', pt.notes
                ) ORDER BY pt.created_at DESC
            )
            FROM payment_transactions pt
            LEFT JOIN users rec ON pt.recorded_by = rec.id
            WHERE pt.client_id = p_client_id
        )
    ) INTO v_result
    FROM users u
    LEFT JOIN orders o ON u.id = o.cafeteria_id
    WHERE u.id = p_client_id
    GROUP BY u.id, u.name, u.email, u.phone;
    
    RETURN v_result;
END;
$$ LANGUAGE plpgsql;

-- =============================================
-- 5. VÉRIFICATIONS
-- =============================================

-- Vérifier que la table est créée
SELECT 'Table payment_transactions créée' as status 
WHERE EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'payment_transactions');

-- Vérifier que la vue est créée
SELECT 'Vue client_debts_view créée' as status 
WHERE EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'client_debts_view');

-- Vérifier que les fonctions sont créées
SELECT 'Fonction apply_payment_to_client créée' as status 
WHERE EXISTS (SELECT 1 FROM pg_proc WHERE proname = 'apply_payment_to_client');

SELECT 'Fonction get_client_debt_details créée' as status 
WHERE EXISTS (SELECT 1 FROM pg_proc WHERE proname = 'get_client_debt_details');

SELECT 'Migration système de paiement terminée avec succès!' as final_status;
