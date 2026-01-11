const pool = require('../config/database');

/**
 * Enregistre une action dans les logs d'audit
 */
async function logAudit(action, userId, organizationId, details = {}, req = null) {
  try {
    const ip = req 
      ? (req.headers['x-forwarded-for'] || req.socket?.remoteAddress || 'unknown') 
      : 'system';
    const userAgent = req 
      ? (req.headers['user-agent'] || 'unknown') 
      : 'system';
    
    await pool.query(
      `INSERT INTO audit_logs (user_id, organization_id, action, details, ip_address, user_agent)
       VALUES ($1, $2, $3, $4, $5, $6)`,
      [userId, organizationId, action, JSON.stringify(details), ip.substring(0, 45), userAgent.substring(0, 255)]
    );
  } catch (error) {
    console.error('Audit log error:', error.message);
  }
}

/**
 * Récupère les logs d'audit d'une organisation
 */
async function getAuditLogs(organizationId, { limit = 100, offset = 0, action, userId } = {}) {
  let query = `
    SELECT al.*, u.name as user_name, u.email as user_email
    FROM audit_logs al
    LEFT JOIN users u ON al.user_id = u.id
    WHERE al.organization_id = $1
  `;
  const params = [organizationId];
  let paramIndex = 2;
  
  if (action) {
    query += ` AND al.action = $${paramIndex}`;
    params.push(action);
    paramIndex++;
  }
  
  if (userId) {
    query += ` AND al.user_id = $${paramIndex}`;
    params.push(userId);
    paramIndex++;
  }
  
  query += ` ORDER BY al.created_at DESC LIMIT $${paramIndex} OFFSET $${paramIndex + 1}`;
  params.push(parseInt(limit), parseInt(offset));
  
  const result = await pool.query(query, params);
  return result.rows;
}

/**
 * Récupère tous les logs d'audit (super-admin)
 */
async function getAllAuditLogs({ limit = 200, offset = 0 } = {}) {
  const result = await pool.query(
    `SELECT al.*, u.name as user_name, u.email as user_email, o.name as org_name
     FROM audit_logs al
     LEFT JOIN users u ON al.user_id = u.id
     LEFT JOIN organizations o ON al.organization_id = o.id
     ORDER BY al.created_at DESC
     LIMIT $1 OFFSET $2`,
    [parseInt(limit), parseInt(offset)]
  );
  return result.rows;
}

module.exports = {
  logAudit,
  getAuditLogs,
  getAllAuditLogs,
};
