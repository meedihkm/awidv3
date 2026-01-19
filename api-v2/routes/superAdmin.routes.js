const express = require('express');
const bcrypt = require('bcryptjs');
const router = express.Router();

const pool = require('../config/database');
const { authenticateSuperAdmin } = require('../middleware/auth');
const { validate } = require('../middleware/validate');
const { superAdminLimiter } = require('../middleware/rateLimit');
const { logAudit, getAllAuditLogs } = require('../services/audit.service');
const { revokeAllOrgTokens } = require('../services/token.service');

// GET /api/super-admin/test
router.get('/test', superAdminLimiter, authenticateSuperAdmin, (req, res) => {
  res.json({ success: true, message: 'Super-admin OK' });
});

// GET /api/super-admin/stats
router.get('/stats', authenticateSuperAdmin, async (req, res) => {
  try {
    const orgs = await pool.query('SELECT COUNT(*) as count FROM organizations');
    const activeOrgs = await pool.query('SELECT COUNT(*) as count FROM organizations WHERE active = true');
    const users = await pool.query('SELECT COUNT(*) as count FROM users');
    const orders = await pool.query('SELECT COUNT(*) as count FROM orders');
    
    res.json({
      success: true,
      data: {
        totalOrganizations: parseInt(orgs.rows[0].count),
        activeOrganizations: parseInt(activeOrgs.rows[0].count),
        totalUsers: parseInt(users.rows[0].count),
        totalOrders: parseInt(orders.rows[0].count)
      }
    });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// GET /api/super-admin/organizations
router.get('/organizations', authenticateSuperAdmin, async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM organizations ORDER BY created_at DESC');
    res.json({ success: true, data: result.rows });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// POST /api/super-admin/organizations
router.post('/organizations', authenticateSuperAdmin, validate('createOrganization'), async (req, res) => {
  try {
    const { name, type, adminEmail, adminPassword, adminName, adminPhone } = req.body;
    
    const orgResult = await pool.query(
      'INSERT INTO organizations (name, type) VALUES ($1, $2) RETURNING *',
      [name, type || 'restaurant']
    );
    const org = orgResult.rows[0];
    
    const hashedPassword = await bcrypt.hash(adminPassword, 12);
    await pool.query(
      'INSERT INTO users (organization_id, email, password, name, phone, role) VALUES ($1, $2, $3, $4, $5, $6)',
      [org.id, adminEmail.trim().toLowerCase(), hashedPassword, adminName, adminPhone || '', 'admin']
    );
    
    await logAudit('ORG_CREATED', null, org.id, { name, adminEmail }, req);
    
    res.json({ success: true, data: org });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur', details: error.message });
  }
});

// DELETE /api/super-admin/organizations/:id
router.delete('/organizations/:id', authenticateSuperAdmin, async (req, res) => {
  try {
    // Grâce aux contraintes CASCADE dans la base de données,
    // supprimer l'organisation supprimera automatiquement:
    // - users (et leurs refresh_tokens, location_history via CASCADE)
    // - products
    // - orders (et leurs order_items via CASCADE)
    // - deliveries
    // - audit_logs
    // - order_sequences
    
    const result = await pool.query('DELETE FROM organizations WHERE id = $1 RETURNING id', [req.params.id]);
    
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Organisation non trouvée' });
    }
    
    res.json({ success: true, message: 'Organisation et toutes ses données supprimées' });
  } catch (error) {
    console.error('Delete org error:', error);
    res.status(500).json({ error: 'Erreur serveur: ' + error.message });
  }
});

// GET /api/super-admin/users
router.get('/users', authenticateSuperAdmin, async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT u.id, u.email, u.name, u.phone, u.role, u.active, u.created_at, 
              o.name as organization_name, o.id as organization_id
       FROM users u 
       JOIN organizations o ON u.organization_id = o.id 
       ORDER BY u.created_at DESC`
    );
    res.json({ success: true, data: result.rows });
  } catch (error) {
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// PATCH /api/super-admin/organizations/:id/status
router.patch('/organizations/:id/status', authenticateSuperAdmin, validate('toggleOrgStatus'), async (req, res) => {
  try {
    const { active } = req.body;
    await pool.query('UPDATE organizations SET active = $1 WHERE id = $2', [active, req.params.id]);
    await pool.query('UPDATE users SET active = $1 WHERE organization_id = $2', [active, req.params.id]);
    
    // Révoquer tous les tokens si désactivation
    if (!active) {
      await revokeAllOrgTokens(req.params.id);
    }
    
    await logAudit('ORG_STATUS_CHANGED', null, req.params.id, { active }, req);
    
    res.json({ success: true });
  } catch (error) {
    console.error('Toggle org status error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

// GET /api/super-admin/audit-logs
router.get('/audit-logs', authenticateSuperAdmin, async (req, res) => {
  try {
    const { limit, offset } = req.query;
    const logs = await getAllAuditLogs({ limit, offset });
    res.json({ success: true, data: logs });
  } catch (error) {
    console.error('Super admin audit logs error:', error);
    res.status(500).json({ error: 'Erreur serveur' });
  }
});

module.exports = router;
