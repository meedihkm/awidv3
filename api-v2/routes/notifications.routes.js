const express = require('express');
const router = express.Router();
const { authenticateToken } = require('../middleware/auth');
const db = require('../config/database');

// ============================================
// 1. GET /api/notifications
// ============================================
// Récupère les notifications de l'utilisateur

router.get('/', authenticateToken, async (req, res) => {
  try {
    const userId = req.user.userId;
    const { limit = 50, unreadOnly = false } = req.query;
    
    const result = await db.query(
      'SELECT * FROM get_user_notifications($1, $2, $3)',
      [userId, parseInt(limit), unreadOnly === 'true']
    );
    
    res.json({
      success: true,
      data: result.rows
    });
  } catch (error) {
    console.error('Error fetching notifications:', error);
    res.status(500).json({
      success: false,
      message: 'Erreur lors de la récupération des notifications',
      error: error.message
    });
  }
});

// ============================================
// 2. GET /api/notifications/unread-count
// ============================================
// Compte les notifications non lues

router.get('/unread-count', authenticateToken, async (req, res) => {
  try {
    const userId = req.user.userId;
    
    const result = await db.query(
      'SELECT get_unread_count($1) as count',
      [userId]
    );
    
    res.json({
      success: true,
      data: { count: result.rows[0].count }
    });
  } catch (error) {
    console.error('Error counting unread notifications:', error);
    res.status(500).json({
      success: false,
      message: 'Erreur lors du comptage',
      error: error.message
    });
  }
});

// ============================================
// 3. PUT /api/notifications/:id/read
// ============================================
// Marque une notification comme lue

router.put('/:id/read', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const userId = req.user.userId;
    
    const result = await db.query(
      'SELECT mark_notification_read($1, $2) as success',
      [id, userId]
    );
    
    if (result.rows[0].success) {
      res.json({
        success: true,
        message: 'Notification marquée comme lue'
      });
    } else {
      res.status(404).json({
        success: false,
        message: 'Notification non trouvée ou déjà lue'
      });
    }
  } catch (error) {
    console.error('Error marking notification as read:', error);
    res.status(500).json({
      success: false,
      message: 'Erreur lors de la mise à jour',
      error: error.message
    });
  }
});

// ============================================
// 4. PUT /api/notifications/read-all
// ============================================
// Marque toutes les notifications comme lues

router.put('/read-all', authenticateToken, async (req, res) => {
  try {
    const userId = req.user.userId;
    
    const result = await db.query(
      'SELECT mark_all_notifications_read($1) as count',
      [userId]
    );
    
    res.json({
      success: true,
      message: `${result.rows[0].count} notification(s) marquée(s) comme lue(s)`,
      data: { count: result.rows[0].count }
    });
  } catch (error) {
    console.error('Error marking all notifications as read:', error);
    res.status(500).json({
      success: false,
      message: 'Erreur lors de la mise à jour',
      error: error.message
    });
  }
});

// ============================================
// 5. DELETE /api/notifications/:id
// ============================================
// Supprime une notification

router.delete('/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const userId = req.user.userId;
    
    const result = await db.query(
      'DELETE FROM notifications WHERE id = $1 AND user_id = $2 RETURNING id',
      [id, userId]
    );
    
    if (result.rows.length > 0) {
      res.json({
        success: true,
        message: 'Notification supprimée'
      });
    } else {
      res.status(404).json({
        success: false,
        message: 'Notification non trouvée'
      });
    }
  } catch (error) {
    console.error('Error deleting notification:', error);
    res.status(500).json({
      success: false,
      message: 'Erreur lors de la suppression',
      error: error.message
    });
  }
});

// ============================================
// 6. GET /api/notifications/preferences
// ============================================
// Récupère les préférences de notification

router.get('/preferences', authenticateToken, async (req, res) => {
  try {
    const userId = req.user.userId;
    
    let result = await db.query(
      'SELECT * FROM notification_preferences WHERE user_id = $1',
      [userId]
    );
    
    // Si pas de préférences, créer avec valeurs par défaut
    if (result.rows.length === 0) {
      result = await db.query(
        `INSERT INTO notification_preferences (user_id)
         VALUES ($1)
         RETURNING *`,
        [userId]
      );
    }
    
    res.json({
      success: true,
      data: result.rows[0]
    });
  } catch (error) {
    console.error('Error fetching notification preferences:', error);
    res.status(500).json({
      success: false,
      message: 'Erreur lors de la récupération des préférences',
      error: error.message
    });
  }
});

// ============================================
// 7. PUT /api/notifications/preferences
// ============================================
// Met à jour les préférences de notification

router.put('/preferences', authenticateToken, async (req, res) => {
  try {
    const userId = req.user.userId;
    const {
      payment_notifications,
      debt_notifications,
      favorite_notifications,
      debt_reminders_enabled,
      debt_reminder_frequency,
      quiet_hours_start,
      quiet_hours_end
    } = req.body;
    
    const result = await db.query(
      `INSERT INTO notification_preferences (
        user_id,
        payment_notifications,
        debt_notifications,
        favorite_notifications,
        debt_reminders_enabled,
        debt_reminder_frequency,
        quiet_hours_start,
        quiet_hours_end
      ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
      ON CONFLICT (user_id)
      DO UPDATE SET
        payment_notifications = EXCLUDED.payment_notifications,
        debt_notifications = EXCLUDED.debt_notifications,
        favorite_notifications = EXCLUDED.favorite_notifications,
        debt_reminders_enabled = EXCLUDED.debt_reminders_enabled,
        debt_reminder_frequency = EXCLUDED.debt_reminder_frequency,
        quiet_hours_start = EXCLUDED.quiet_hours_start,
        quiet_hours_end = EXCLUDED.quiet_hours_end,
        updated_at = CURRENT_TIMESTAMP
      RETURNING *`,
      [
        userId,
        payment_notifications,
        debt_notifications,
        favorite_notifications,
        debt_reminders_enabled,
        debt_reminder_frequency,
        quiet_hours_start,
        quiet_hours_end
      ]
    );
    
    res.json({
      success: true,
      message: 'Préférences mises à jour',
      data: result.rows[0]
    });
  } catch (error) {
    console.error('Error updating notification preferences:', error);
    res.status(500).json({
      success: false,
      message: 'Erreur lors de la mise à jour',
      error: error.message
    });
  }
});

// ============================================
// 8. POST /api/notifications/send-debt-reminders (Admin/Cron)
// ============================================
// Envoie les rappels de dette

router.post('/send-debt-reminders', authenticateToken, async (req, res) => {
  try {
    // Vérifier que c'est un admin
    if (req.user.role !== 'admin' && req.user.role !== 'superadmin') {
      return res.status(403).json({
        success: false,
        message: 'Accès non autorisé'
      });
    }
    
    const organizationId = req.user.organizationId;
    
    // Récupérer clients avec dettes et préférences activées
    const clientsResult = await db.query(
      `SELECT
        u.id,
        u.name,
        u.organization_id,
        cd.debt,
        cd.order_count,
        np.debt_reminders_enabled,
        np.debt_reminder_frequency,
        MAX(n.created_at) as last_reminder
       FROM users u
       INNER JOIN client_debts_view cd ON cd.client_id = u.id
       LEFT JOIN notification_preferences np ON np.user_id = u.id
       LEFT JOIN notifications n ON n.user_id = u.id AND n.type = 'debt_reminder'
       WHERE u.organization_id = $1
         AND u.role = 'cafeteria'
         AND cd.debt > 0
         AND COALESCE(np.debt_reminders_enabled, false) = true
       GROUP BY u.id, u.name, u.organization_id, cd.debt, cd.order_count, np.debt_reminders_enabled, np.debt_reminder_frequency`,
      [organizationId]
    );
    
    let sentCount = 0;
    
    for (const client of clientsResult.rows) {
      const frequency = client.debt_reminder_frequency || 7;
      const lastReminder = client.last_reminder ? new Date(client.last_reminder) : null;
      const daysSinceLastReminder = lastReminder
        ? Math.floor((Date.now() - lastReminder.getTime()) / (1000 * 60 * 60 * 24))
        : 999;
      
      // Envoyer si pas de rappel ou si fréquence dépassée
      if (daysSinceLastReminder >= frequency) {
        await db.query(
          'SELECT notify_debt_reminder($1, $2, $3, $4)',
          [client.id, client.organization_id, client.debt, client.order_count]
        );
        sentCount++;
      }
    }
    
    res.json({
      success: true,
      message: `${sentCount} rappel(s) envoyé(s)`,
      data: { sent: sentCount, total: clientsResult.rows.length }
    });
  } catch (error) {
    console.error('Error sending debt reminders:', error);
    res.status(500).json({
      success: false,
      message: 'Erreur lors de l\'envoi des rappels',
      error: error.message
    });
  }
});

// ============================================
// 9. GET /api/notifications/stats (Admin)
// ============================================
// Statistiques sur les notifications

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
        COUNT(*) as total_notifications,
        COUNT(CASE WHEN is_read = false THEN 1 END) as unread_count,
        COUNT(CASE WHEN type = 'payment_recorded' THEN 1 END) as payment_notifications,
        COUNT(CASE WHEN type = 'debt_cleared' THEN 1 END) as debt_cleared_notifications,
        COUNT(CASE WHEN type = 'favorite_suggested' THEN 1 END) as favorite_notifications,
        COUNT(CASE WHEN type = 'debt_reminder' THEN 1 END) as debt_reminders,
        COUNT(DISTINCT user_id) as users_with_notifications
       FROM notifications
       WHERE organization_id = $1
         AND created_at > CURRENT_TIMESTAMP - INTERVAL '30 days'`,
      [organizationId]
    );
    
    res.json({
      success: true,
      data: result.rows[0]
    });
  } catch (error) {
    console.error('Error fetching notification stats:', error);
    res.status(500).json({
      success: false,
      message: 'Erreur lors de la récupération des statistiques',
      error: error.message
    });
  }
});

module.exports = router;
