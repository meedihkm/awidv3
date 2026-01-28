import bcrypt from 'bcrypt';
import { Request, Response } from 'express';
import { db } from '../../../infrastructure/database/PostgresConnection';

export class UserController {
  constructor() { }

  /**
   * Get all users
   * GET /users
   */
  async getUsers(req: Request, res: Response): Promise<void> {
    try {
      const page = parseInt(req.query.page as string) || 1;
      const limit = parseInt(req.query.limit as string) || 20;
      const role = req.query.role as string;
      const isActive = req.query.is_active as string;
      const search = req.query.search as string;
      const organizationId = req.user!.organizationId;
      const offset = (page - 1) * limit;

      let whereClause = 'WHERE u.organization_id = $1';
      const params: any[] = [organizationId, limit, offset];
      let paramIndex = 4;

      if (role) {
        whereClause += ` AND u.role = $${paramIndex}`;
        params.push(role);
        paramIndex++;
      }

      if (isActive === 'true') {
        whereClause += ` AND u.is_active = true`;
      } else if (isActive === 'false') {
        whereClause += ` AND u.is_active = false`;
      }

      if (search) {
        whereClause += ` AND (u.first_name ILIKE $${paramIndex} OR u.last_name ILIKE $${paramIndex} OR u.email ILIKE $${paramIndex})`;
        params.push(`%${search}%`);
        paramIndex++;
      }

      const query = `
        SELECT 
          u.id,
          u.email,
          u.first_name,
          u.last_name,
          u.phone,
          u.role,
          u.is_active,
          u.credit_limit,
          u.current_debt,
          u.created_at,
          u.updated_at,
          org.name as organization_name
        FROM users u
        LEFT JOIN organizations org ON u.organization_id = org.id
        ${whereClause}
        ORDER BY u.created_at DESC
        LIMIT $2 OFFSET $3
      `;

      const result = await db.query(query, params);

      const users = result.map((row: any) => ({
        id: row.id,
        email: row.email,
        firstName: row.first_name,
        lastName: row.last_name,
        phone: row.phone,
        role: row.role,
        isActive: row.is_active,
        creditLimit: parseFloat(row.credit_limit) / 100 || 0,
        currentDebt: parseFloat(row.current_debt) / 100 || 0,
        createdAt: row.created_at,
        updatedAt: row.updated_at,
        organizationName: row.organization_name,
      }));

      res.json({
        success: true,
        data: users,
        pagination: {
          page,
          limit,
          total: users.length,
        },
      });
    } catch (error) {
      console.error('Error getting users:', error);
      res.status(500).json({
        success: false,
        error: 'Erreur lors de la récupération des utilisateurs',
        code: 'INTERNAL_ERROR',
      });
    }
  }

  /**
   * Get user by ID
   * GET /users/:id
   */
  async getUserById(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.params.id;
      const organizationId = req.user!.organizationId;

      const result = await db.query(`
        SELECT 
          u.id,
          u.email,
          u.first_name,
          u.last_name,
          u.phone,
          u.role,
          u.is_active,
          u.credit_limit,
          u.current_debt,
          u.address_street,
          u.address_city,
          u.address_state,
          u.address_postal_code,
          u.vehicle_type,
          u.vehicle_plate,
          u.is_available,
          u.latitude,
          u.longitude,
          u.created_at,
          u.updated_at,
          org.name as organization_name
        FROM users u
        LEFT JOIN organizations org ON u.organization_id = org.id
        WHERE u.id = $1 AND u.organization_id = $2
      `, [userId, organizationId]);

      if (result.length === 0) {
        res.status(404).json({
          success: false,
          error: 'Utilisateur non trouvé',
          code: 'NOT_FOUND',
        });
        return;
      }

      const row = result[0];
      const user = {
        id: row.id,
        email: row.email,
        firstName: row.first_name,
        lastName: row.last_name,
        phone: row.phone,
        role: row.role,
        isActive: row.is_active,
        creditLimit: parseFloat(row.credit_limit) / 100 || 0,
        currentDebt: parseFloat(row.current_debt) / 100 || 0,
        address: {
          street: row.address_street,
          city: row.address_city,
          state: row.address_state,
          postalCode: row.address_postal_code,
        },
        vehicleType: row.vehicle_type,
        vehiclePlate: row.vehicle_plate,
        isAvailable: row.is_available,
        location: row.latitude && row.longitude ? {
          latitude: parseFloat(row.latitude),
          longitude: parseFloat(row.longitude),
        } : null,
        createdAt: row.created_at,
        updatedAt: row.updated_at,
        organizationName: row.organization_name,
      };

      res.json({
        success: true,
        data: user,
      });
    } catch (error) {
      console.error('Error getting user by ID:', error);
      res.status(500).json({
        success: false,
        error: 'Erreur lors de la récupération de l\'utilisateur',
        code: 'INTERNAL_ERROR',
      });
    }
  }

  /**
   * Create user
   * POST /users
   */
  async createUser(req: Request, res: Response): Promise<void> {
    try {
      if (!['admin'].includes(req.user!.role)) {
        res.status(403).json({
          success: false,
          error: 'Seuls les admins peuvent créer des utilisateurs',
          code: 'FORBIDDEN',
        });
        return;
      }

      const {
        email,
        password,
        firstName,
        lastName,
        phone,
        role,
        creditLimit,
        addressStreet,
        addressCity,
        addressState,
        addressPostalCode,
        vehicleType,
        vehiclePlate
      } = req.body;

      // Check if email already exists
      const existingUser = await db.query(
        'SELECT id FROM users WHERE email = $1',
        [email]
      );

      if (existingUser.length > 0) {
        res.status(400).json({
          success: false,
          error: 'Un utilisateur avec cet email existe déjà',
          code: 'EMAIL_EXISTS',
        });
        return;
      }

      // Hash password
      const hashedPassword = await bcrypt.hash(password, 10);

      const result = await db.query(`
        INSERT INTO users (
          organization_id, email, password, first_name, last_name, phone, role,
          credit_limit, address_street, address_city, address_state, address_postal_code,
          vehicle_type, vehicle_plate, is_active
        )
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, true)
        RETURNING id, email, first_name, last_name, role, created_at
      `, [
        req.user!.organizationId,
        email,
        hashedPassword,
        firstName,
        lastName,
        phone || null,
        role,
        creditLimit ? Math.round(creditLimit * 100) : 0,
        addressStreet || null,
        addressCity || null,
        addressState || null,
        addressPostalCode || null,
        vehicleType || null,
        vehiclePlate || null
      ]);

      const row = result[0];
      const user = {
        id: row.id,
        email: row.email,
        firstName: row.first_name,
        lastName: row.last_name,
        role: row.role,
        createdAt: row.created_at,
      };

      res.status(201).json({
        success: true,
        data: user,
      });
    } catch (error) {
      console.error('Error creating user:', error);
      res.status(500).json({
        success: false,
        error: 'Erreur lors de la création de l\'utilisateur',
        code: 'INTERNAL_ERROR',
      });
    }
  }

  /**
   * Update user
   * PUT /users/:id
   */
  async updateUser(req: Request, res: Response): Promise<void> {
    try {
      if (!['admin'].includes(req.user!.role)) {
        res.status(403).json({
          success: false,
          error: 'Seuls les admins peuvent modifier des utilisateurs',
          code: 'FORBIDDEN',
        });
        return;
      }

      const userId = req.params.id;
      const organizationId = req.user!.organizationId;
      const {
        firstName,
        lastName,
        phone,
        isActive,
        creditLimit,
        addressStreet,
        addressCity,
        addressState,
        addressPostalCode,
        vehicleType,
        vehiclePlate
      } = req.body;

      // Check if user exists and belongs to organization
      const existingUser = await db.query(
        'SELECT id FROM users WHERE id = $1 AND organization_id = $2',
        [userId, organizationId]
      );

      if (existingUser.length === 0) {
        res.status(404).json({
          success: false,
          error: 'Utilisateur non trouvé',
          code: 'NOT_FOUND',
        });
        return;
      }

      const result = await db.query(`
        UPDATE users SET
          first_name = COALESCE($2, first_name),
          last_name = COALESCE($3, last_name),
          phone = COALESCE($4, phone),
          is_active = COALESCE($5, is_active),
          credit_limit = COALESCE($6, credit_limit),
          address_street = COALESCE($7, address_street),
          address_city = COALESCE($8, address_city),
          address_state = COALESCE($9, address_state),
          address_postal_code = COALESCE($10, address_postal_code),
          vehicle_type = COALESCE($11, vehicle_type),
          vehicle_plate = COALESCE($12, vehicle_plate),
          updated_at = NOW()
        WHERE id = $1
        RETURNING *
      `, [
        userId,
        firstName,
        lastName,
        phone,
        isActive,
        creditLimit ? Math.round(creditLimit * 100) : null,
        addressStreet,
        addressCity,
        addressState,
        addressPostalCode,
        vehicleType,
        vehiclePlate
      ]);

      const row = result[0];
      const user = {
        id: row.id,
        firstName: row.first_name,
        lastName: row.last_name,
        isActive: row.is_active,
        updatedAt: row.updated_at,
      };

      res.json({
        success: true,
        data: user,
      });
    } catch (error) {
      console.error('Error updating user:', error);
      res.status(500).json({
        success: false,
        error: 'Erreur lors de la mise à jour de l\'utilisateur',
        code: 'INTERNAL_ERROR',
      });
    }
  }

  /**
   * Delete user
   * DELETE /users/:id
   */
  async deleteUser(req: Request, res: Response): Promise<void> {
    try {
      if (!['admin'].includes(req.user!.role)) {
        res.status(403).json({
          success: false,
          error: 'Seuls les admins peuvent supprimer des utilisateurs',
          code: 'FORBIDDEN',
        });
        return;
      }

      const userId = req.params.id;
      const organizationId = req.user!.organizationId;

      const result = await db.query(
        'DELETE FROM users WHERE id = $1 AND organization_id = $2 RETURNING id',
        [userId, organizationId]
      );

      if (result.length === 0) {
        res.status(404).json({
          success: false,
          error: 'Utilisateur non trouvé',
          code: 'NOT_FOUND',
        });
        return;
      }

      res.json({
        success: true,
        message: 'Utilisateur supprimé avec succès',
      });
    } catch (error) {
      console.error('Error deleting user:', error);
      res.status(500).json({
        success: false,
        error: 'Erreur lors de la suppression de l\'utilisateur',
        code: 'INTERNAL_ERROR',
      });
    }
  }

  /**
   * Toggle active status
   * PATCH /users/:id/toggle-active
   */
  async toggleActiveStatus(req: Request, res: Response): Promise<void> {
    try {
      if (!['admin'].includes(req.user!.role)) {
        res.status(403).json({
          success: false,
          error: 'Seuls les admins peuvent modifier le statut des utilisateurs',
          code: 'FORBIDDEN',
        });
        return;
      }

      const userId = req.params.id;
      const organizationId = req.user!.organizationId;

      const result = await db.query(`
        UPDATE users 
        SET is_active = NOT is_active, updated_at = NOW()
        WHERE id = $1 AND organization_id = $2
        RETURNING *
      `, [userId, organizationId]);

      if (result.length === 0) {
        res.status(404).json({
          success: false,
          error: 'Utilisateur non trouvé',
          code: 'NOT_FOUND',
        });
        return;
      }

      const row = result[0];
      const user = {
        id: row.id,
        firstName: row.first_name,
        lastName: row.last_name,
        isActive: row.is_active,
        updatedAt: row.updated_at,
      };

      res.json({
        success: true,
        data: user,
      });
    } catch (error) {
      console.error('Error toggling active status:', error);
      res.status(500).json({
        success: false,
        error: 'Erreur lors de la modification du statut',
        code: 'INTERNAL_ERROR',
      });
    }
  }

  /**
   * Update credit limit
   * PATCH /users/:id/credit-limit
   */
  async updateCreditLimit(req: Request, res: Response): Promise<void> {
    try {
      if (!['admin'].includes(req.user!.role)) {
        res.status(403).json({
          success: false,
          error: 'Seuls les admins peuvent modifier la limite de crédit',
          code: 'FORBIDDEN',
        });
        return;
      }

      const userId = req.params.id;
      const { creditLimit } = req.body;
      const organizationId = req.user!.organizationId;

      if (typeof creditLimit !== 'number' || creditLimit < 0) {
        res.status(400).json({
          success: false,
          error: 'La limite de crédit doit être un nombre positif',
          code: 'VALIDATION_ERROR',
        });
        return;
      }

      const result = await db.query(`
        UPDATE users 
        SET credit_limit = $2, updated_at = NOW()
        WHERE id = $1 AND organization_id = $3
        RETURNING *
      `, [userId, Math.round(creditLimit * 100), organizationId]);

      if (result.length === 0) {
        res.status(404).json({
          success: false,
          error: 'Utilisateur non trouvé',
          code: 'NOT_FOUND',
        });
        return;
      }

      const row = result[0];
      const user = {
        id: row.id,
        firstName: row.first_name,
        lastName: row.last_name,
        creditLimit: parseFloat(row.credit_limit) / 100,
        updatedAt: row.updated_at,
      };

      res.json({
        success: true,
        data: user,
      });
    } catch (error) {
      console.error('Error updating credit limit:', error);
      res.status(500).json({
        success: false,
        error: 'Erreur lors de la mise à jour de la limite de crédit',
        code: 'INTERNAL_ERROR',
      });
    }
  }

  /**
   * Reset password
   * POST /users/:id/reset-password
   */
  async resetPassword(req: Request, res: Response): Promise<void> {
    try {
      if (!['admin'].includes(req.user!.role)) {
        res.status(403).json({
          success: false,
          error: 'Seuls les admins peuvent réinitialiser les mots de passe',
          code: 'FORBIDDEN',
        });
        return;
      }

      const userId = req.params.id;
      const { password } = req.body;
      const organizationId = req.user!.organizationId;

      if (!password || password.length < 6) {
        res.status(400).json({
          success: false,
          error: 'Le mot de passe doit contenir au moins 6 caractères',
          code: 'VALIDATION_ERROR',
        });
        return;
      }

      // Hash new password
      const hashedPassword = await bcrypt.hash(password, 10);

      const result = await db.query(`
        UPDATE users 
        SET password = $2, updated_at = NOW()
        WHERE id = $1 AND organization_id = $3
        RETURNING id, first_name, last_name
      `, [userId, hashedPassword, organizationId]);

      if (result.length === 0) {
        res.status(404).json({
          success: false,
          error: 'Utilisateur non trouvé',
          code: 'NOT_FOUND',
        });
        return;
      }

      res.json({
        success: true,
        message: 'Mot de passe réinitialisé avec succès',
      });
    } catch (error) {
      console.error('Error resetting password:', error);
      res.status(500).json({
        success: false,
        error: 'Erreur lors de la réinitialisation du mot de passe',
        code: 'INTERNAL_ERROR',
      });
    }
  }

  /**
   * Get users by role
   * GET /users/by-role/:role
   */
  async getUsersByRole(req: Request, res: Response): Promise<void> {
    try {
      const role = req.params.role;
      const organizationId = req.user!.organizationId;

      const result = await db.query(`
        SELECT 
          u.id,
          u.email,
          u.first_name,
          u.last_name,
          u.phone,
          u.role,
          u.is_active,
          u.created_at
        FROM users u
        WHERE u.role = $1 AND u.organization_id = $2 AND u.is_active = true
        ORDER BY u.first_name, u.last_name
      `, [role, organizationId]);

      const users = result.map((row: any) => ({
        id: row.id,
        email: row.email,
        firstName: row.first_name,
        lastName: row.last_name,
        phone: row.phone,
        role: row.role,
        isActive: row.is_active,
        createdAt: row.created_at,
      }));

      res.json({
        success: true,
        data: users,
      });
    } catch (error) {
      console.error('Error getting users by role:', error);
      res.status(500).json({
        success: false,
        error: 'Erreur lors de la récupération des utilisateurs par rôle',
        code: 'INTERNAL_ERROR',
      });
    }
  }
}