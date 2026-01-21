-- =====================================================
-- SYSTÈME DE LOCALISATION ET HISTORIQUE GPS
-- =====================================================
-- Description: Trigger et fonctions pour mise à jour automatique des adresses clients
-- Date: 2026-01-19
-- Note: La table location_history existe déjà dans sql_migrations_v2_optimized.sql
-- =====================================================

-- Extension pour UUID (si pas déjà activée)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- =====================================================
-- FONCTION: update_client_address_from_delivery
-- =====================================================
-- Met à jour automatiquement l'adresse du client avec la position du livreur
-- lors de la livraison si le client n'a pas encore d'adresse
CREATE OR REPLACE FUNCTION update_client_address_from_delivery()
RETURNS TRIGGER AS $$
DECLARE
  v_client_id TEXT;
  v_client_has_address BOOLEAN;
  v_deliverer_lat DOUBLE PRECISION;
  v_deliverer_lng DOUBLE PRECISION;
  v_order_id TEXT;
BEGIN
  -- Vérifier si le statut passe à 'delivered'
  IF NEW.status = 'delivered' AND OLD.status != 'delivered' THEN
    
    -- Récupérer l'ID du client et l'order_id
    SELECT o.cafeteria_id, d.order_id
    INTO v_client_id, v_order_id
    FROM deliveries d
    JOIN orders o ON d.order_id = o.id
    WHERE d.id = NEW.id;
    
    -- Vérifier si le client a déjà une adresse GPS
    SELECT (address_lat IS NOT NULL AND address_lng IS NOT NULL)
    INTO v_client_has_address
    FROM users
    WHERE id = v_client_id;
    
    -- Si le client n'a pas d'adresse GPS
    IF NOT v_client_has_address THEN
      
      -- Récupérer la position actuelle du livreur
      SELECT latitude, longitude
      INTO v_deliverer_lat, v_deliverer_lng
      FROM users
      WHERE id = NEW.deliverer_id
      AND latitude IS NOT NULL 
      AND longitude IS NOT NULL;
      
      -- Si le livreur a une position valide
      IF v_deliverer_lat IS NOT NULL AND v_deliverer_lng IS NOT NULL THEN
        
        -- Mettre à jour l'adresse du client avec la position du livreur
        UPDATE users
        SET 
          address_lat = v_deliverer_lat,
          address_lng = v_deliverer_lng,
          updated_at = NOW()
        WHERE id = v_client_id;
        
        -- Log dans audit si la table existe
        BEGIN
          INSERT INTO audit_logs (
            user_id,
            organization_id,
            action,
            entity_type,
            entity_id,
            details
          ) VALUES (
            NEW.deliverer_id,
            NEW.organization_id,
            'auto_update_client_location',
            'user',
            v_client_id,
            jsonb_build_object(
              'delivery_id', NEW.id,
              'order_id', v_order_id,
              'latitude', v_deliverer_lat,
              'longitude', v_deliverer_lng,
              'source', 'deliverer_location_on_delivery'
            )
          );
        EXCEPTION WHEN undefined_table THEN
          -- Ignorer si audit_logs n'existe pas
          NULL;
        END;
        
      END IF;
    END IF;
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- =====================================================
-- TRIGGER: trigger_update_client_address_on_delivery
-- =====================================================
-- Déclenche la mise à jour de l'adresse client après livraison
DROP TRIGGER IF EXISTS trigger_update_client_address_on_delivery ON deliveries;
CREATE TRIGGER trigger_update_client_address_on_delivery
  AFTER UPDATE ON deliveries
  FOR EACH ROW
  EXECUTE FUNCTION update_client_address_from_delivery();

-- =====================================================
-- FONCTION: get_deliverer_location_stats
-- =====================================================
-- Statistiques de localisation pour un livreur sur une période
CREATE OR REPLACE FUNCTION get_deliverer_location_stats(
  p_deliverer_id TEXT,
  p_start_date DATE DEFAULT CURRENT_DATE,
  p_end_date DATE DEFAULT CURRENT_DATE
)
RETURNS TABLE (
  date DATE,
  total_points INTEGER,
  first_location TIMESTAMP,
  last_location TIMESTAMP,
  duration_hours NUMERIC,
  avg_accuracy NUMERIC
) AS $$
BEGIN
  RETURN QUERY
  SELECT 
    DATE(recorded_at) as date,
    COUNT(*)::INTEGER as total_points,
    MIN(recorded_at) as first_location,
    MAX(recorded_at) as last_location,
    ROUND(EXTRACT(EPOCH FROM (MAX(recorded_at) - MIN(recorded_at))) / 3600, 2) as duration_hours,
    ROUND(AVG(accuracy), 2) as avg_accuracy
  FROM location_history
  WHERE deliverer_id = p_deliverer_id
  AND DATE(recorded_at) BETWEEN p_start_date AND p_end_date
  GROUP BY DATE(recorded_at)
  ORDER BY date DESC;
END;
$$ LANGUAGE plpgsql;

-- =====================================================
-- COMMENTAIRES
-- =====================================================
COMMENT ON FUNCTION update_client_address_from_delivery() IS 'Met à jour automatiquement l''adresse GPS du client avec la position du livreur lors de la livraison';
COMMENT ON FUNCTION get_deliverer_location_stats(TEXT, DATE, DATE) IS 'Statistiques de localisation pour un livreur sur une période donnée';

-- =====================================================
-- DONNÉES DE TEST (optionnel - commenter en production)
-- =====================================================
-- Note: La fonction cleanup_old_location_history() existe déjà dans sql_migrations_v2_optimized.sql
-- SELECT cleanup_old_location_history(90); -- Nettoyer l'historique de plus de 90 jours
