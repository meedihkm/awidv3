const express = require('express');
const router = express.Router();
const { authenticateToken } = require('../middleware/auth');
const { validateRequest } = require('../middleware/validate');
const { createFavorite, updateFavorite } = require('../schemas/validation');
const db = require('../config/database');

// ============================================
// 1. GET /api/favorites/my-favorites
// ============================================
// Récupère les favoris du client connecté

router.get('/my-favorites', authenticateToken, async (req, res) => {
  try {
    const clientId = req.user.userId;
    
    const result = await db.query(
      'SELECT * FROM get_client_favorites($1)',
      [clientId]
    );
    
    res.json({
      success: true,
      data: result.rows
    });
  } catch (error) {
    console.error('Error fetching favorites:', error);
    res.status(500).json({
      success: false,
      message: 'Erreur lors de la récupération des favoris',
      error: error.message
    });
  }
});

// ============================================
// 2. POST /api/favorites/create
// ============================================
// Crée un nouveau favori (manuel ou depuis pattern)

router.post('/create', authenticateToken, validateRequest(createFavorite), async (req, res) => {
  try {
    const { name, items, fromPattern } = req.body;
    const clientId = req.user.userId;
    const organizationId = req.user.organizationId;
    
    // Calculer le total
    let total = 0;
    for (const item of items) {
      total += item.quantity * item.unitPrice;
    }
    
    // Créer le favori
    const result = await db.query(
      `INSERT INTO favorite_orders (
        client_id, organization_id, name, items, total, is_auto_detected
      ) VALUES ($1, $2, $3, $4, $5, $6)
      RETURNING *`,
      [clientId, organizationId, name, JSON.stringify(items), total, fromPattern || false]
    );
    
    res.json({
      success: true,
      message: 'Favori créé avec succès',
      data: result.rows[0]
    });
  } catch (error) {
    console.error('Error creating favorite:', error);
    res.status(500).json({
      success: false,
      message: 'Erreur lors de la création du favori',
      error: error.message
    });
  }
});

// ============================================
// 3. PUT /api/favorites/:id
// ============================================
// Met à jour un favori existant

router.put('/:id', authenticateToken, validateRequest(updateFavorite), async (req, res) => {
  try {
    const { id } = req.params;
    const { name, items } = req.body;
    const clientId = req.user.userId;
    
    // Vérifier que le favori appartient au client
    const checkResult = await db.query(
      'SELECT id FROM favorite_orders WHERE id = $1 AND client_id = $2',
      [id, clientId]
    );
    
    if (checkResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Favori non trouvé'
      });
    }
    
    // Calculer le nouveau total
    let total = 0;
    for (const item of items) {
      total += item.quantity * item.unitPrice;
    }
    
    // Mettre à jour
    const result = await db.query(
      `UPDATE favorite_orders
       SET name = $1, items = $2, total = $3, updated_at = CURRENT_TIMESTAMP
       WHERE id = $4 AND client_id = $5
       RETURNING *`,
      [name, JSON.stringify(items), total, id, clientId]
    );
    
    res.json({
      success: true,
      message: 'Favori mis à jour',
      data: result.rows[0]
    });
  } catch (error) {
    console.error('Error updating favorite:', error);
    res.status(500).json({
      success: false,
      message: 'Erreur lors de la mise à jour',
      error: error.message
    });
  }
});

// ============================================
// 4. DELETE /api/favorites/:id
// ============================================
// Supprime (désactive) un favori

router.delete('/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const clientId = req.user.userId;
    
    const result = await db.query(
      `UPDATE favorite_orders
       SET is_active = false, updated_at = CURRENT_TIMESTAMP
       WHERE id = $1 AND client_id = $2
       RETURNING id`,
      [id, clientId]
    );
    
    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Favori non trouvé'
      });
    }
    
    res.json({
      success: true,
      message: 'Favori supprimé'
    });
  } catch (error) {
    console.error('Error deleting favorite:', error);
    res.status(500).json({
      success: false,
      message: 'Erreur lors de la suppression',
      error: error.message
    });
  }
});

// ============================================
// 5. POST /api/favorites/:id/use
// ============================================
// Enregistre l'utilisation d'un favori

router.post('/:id/use', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const clientId = req.user.userId;
    
    // Vérifier que le favori appartient au client
    const checkResult = await db.query(
      'SELECT id FROM favorite_orders WHERE id = $1 AND client_id = $2 AND is_active = true',
      [id, clientId]
    );
    
    if (checkResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Favori non trouvé'
      });
    }
    
    // Mettre à jour les stats
    await db.query('SELECT update_favorite_usage($1)', [id]);
    
    res.json({
      success: true,
      message: 'Utilisation enregistrée'
    });
  } catch (error) {
    console.error('Error recording favorite usage:', error);
    res.status(500).json({
      success: false,
      message: 'Erreur lors de l\'enregistrement',
      error: error.message
    });
  }
});

// ============================================
// 6. POST /api/favorites/detect-pattern
// ============================================
// Détecte un pattern après création de commande

router.post('/detect-pattern', authenticateToken, async (req, res) => {
  try {
    const { items } = req.body;
    const clientId = req.user.userId;
    const organizationId = req.user.organizationId;
    
    if (!items || !Array.isArray(items) || items.length === 0) {
      return res.status(400).json({
        success: false,
        message: 'Items requis'
      });
    }
    
    // Détecter le pattern
    const result = await db.query(
      'SELECT * FROM detect_order_pattern($1, $2, $3)',
      [clientId, organizationId, JSON.stringify(items)]
    );
    
    const patternData = result.rows[0].detect_order_pattern;
    
    res.json({
      success: true,
      data: patternData
    });
  } catch (error) {
    console.error('Error detecting pattern:', error);
    res.status(500).json({
      success: false,
      message: 'Erreur lors de la détection',
      error: error.message
    });
  }
});

// ============================================
// 7. GET /api/favorites/preferences
// ============================================
// Récupère les préférences de l'utilisateur

router.get('/preferences', authenticateToken, async (req, res) => {
  try {
    const userId = req.user.userId;
    
    let result = await db.query(
      'SELECT * FROM user_preferences WHERE user_id = $1',
      [userId]
    );
    
    // Si pas de préférences, créer avec valeurs par défaut
    if (result.rows.length === 0) {
      result = await db.query(
        `INSERT INTO user_preferences (user_id, favorite_orders_enabled, auto_suggest_enabled, min_pattern_count)
         VALUES ($1, true, true, 3)
         RETURNING *`,
        [userId]
      );
    }
    
    res.json({
      success: true,
      data: result.rows[0]
    });
  } catch (error) {
    console.error('Error fetching preferences:', error);
    res.status(500).json({
      success: false,
      message: 'Erreur lors de la récupération des préférences',
      error: error.message
    });
  }
});

// ============================================
// 8. PUT /api/favorites/preferences
// ============================================
// Met à jour les préférences de l'utilisateur

router.put('/preferences', authenticateToken, async (req, res) => {
  try {
    const userId = req.user.userId;
    const { favorite_orders_enabled, auto_suggest_enabled, min_pattern_count } = req.body;
    
    const result = await db.query(
      `INSERT INTO user_preferences (user_id, favorite_orders_enabled, auto_suggest_enabled, min_pattern_count)
       VALUES ($1, $2, $3, $4)
       ON CONFLICT (user_id)
       DO UPDATE SET
         favorite_orders_enabled = EXCLUDED.favorite_orders_enabled,
         auto_suggest_enabled = EXCLUDED.auto_suggest_enabled,
         min_pattern_count = EXCLUDED.min_pattern_count,
         updated_at = CURRENT_TIMESTAMP
       RETURNING *`,
      [userId, favorite_orders_enabled, auto_suggest_enabled, min_pattern_count]
    );
    
    res.json({
      success: true,
      message: 'Préférences mises à jour',
      data: result.rows[0]
    });
  } catch (error) {
    console.error('Error updating preferences:', error);
    res.status(500).json({
      success: false,
      message: 'Erreur lors de la mise à jour',
      error: error.message
    });
  }
});

// ============================================
// 9. GET /api/favorites/stats (Admin)
// ============================================
// Statistiques sur l'utilisation des favoris

router.get('/stats', authenticateToken, async (req, res) => {
  try {
    // Vérifier que c'est un admin
    if (req.user.role !== 'admin' && req.user.role !== 'superadmin') {
      return res.status(403).json({
        success: false,
        message: 'Accès non autorisé'
      });
    }
    
    const organizationId = req.user.organizationId;
    
    const result = await db.query(
      `SELECT
        COUNT(DISTINCT f.client_id) AS clients_with_favorites,
        COUNT(f.id) AS total_favorites,
        SUM(f.order_count) AS total_favorite_orders,
        AVG(f.order_count) AS avg_orders_per_favorite,
        COUNT(CASE WHEN f.is_auto_detected THEN 1 END) AS auto_detected_count,
        COUNT(CASE WHEN NOT f.is_auto_detected THEN 1 END) AS manual_count
       FROM favorite_orders f
       WHERE f.organization_id = $1 AND f.is_active = true`,
      [organizationId]
    );
    
    res.json({
      success: true,
      data: result.rows[0]
    });
  } catch (error) {
    console.error('Error fetching stats:', error);
    res.status(500).json({
      success: false,
      message: 'Erreur lors de la récupération des statistiques',
      error: error.message
    });
  }
});

module.exports = router;
