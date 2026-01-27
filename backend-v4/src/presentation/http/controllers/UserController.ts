import { NextFunction, Request, Response } from 'express';
import { RegisterUseCase } from '../../../application/use-cases/auth';
import {
    PostgresOrganizationRepository,
    PostgresUserRepository,
} from '../../../infrastructure/database/repositories';
import { ForbiddenError } from '../../../shared/errors/ForbiddenError';
import { NotFoundError } from '../../../shared/errors/NotFoundError';

export class UserController {
  private registerUseCase: RegisterUseCase;
  private userRepository: PostgresUserRepository;

  constructor() {
    this.userRepository = new PostgresUserRepository();
    const organizationRepository = new PostgresOrganizationRepository();

    this.registerUseCase = new RegisterUseCase(this.userRepository, organizationRepository);
  }

  async create(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      if (!['admin'].includes(req.user!.role)) {
        throw new ForbiddenError('Only admin can create users');
      }

      const result = await this.registerUseCase.execute({
        ...req.body,
        organizationId: req.user!.organizationId,
      });

      res.status(201).json({
        success: true,
        data: result,
      });
    } catch (error) {
      next(error);
    }
  }

  async getById(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const user = await this.userRepository.findById(req.params.id);
      if (!user) {
        throw new NotFoundError('User not found');
      }

      if (user.getOrganizationId() !== req.user!.organizationId) {
        throw new ForbiddenError('Access denied');
      }

      res.json({
        success: true,
        data: {
          user: {
            id: user.getId(),
            organizationId: user.getOrganizationId(),
            firstName: user.getFirstName(),
            lastName: user.getLastName(),
            email: user.getEmail().getValue(),
            phone: user.getPhone().getValue(),
            role: user.getRole(),
            isActive: user.isActive(),
            createdAt: user.getCreatedAt(),
          },
        },
      });
    } catch (error) {
      next(error);
    }
  }

  async list(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const { role } = req.query;

      const users = await this.userRepository.findByOrganization(
        req.user!.organizationId,
        role as string
      );

      res.json({
        success: true,
        data: {
          users: users.map((user) => ({
            id: user.getId(),
            firstName: user.getFirstName(),
            lastName: user.getLastName(),
            email: user.getEmail().getValue(),
            phone: user.getPhone().getValue(),
            role: user.getRole(),
            isActive: user.isActive(),
            createdAt: user.getCreatedAt(),
          })),
          total: users.length,
        },
      });
    } catch (error) {
      next(error);
    }
  }

  async update(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      if (!['admin'].includes(req.user!.role)) {
        throw new ForbiddenError('Only admin can update users');
      }

      const user = await this.userRepository.findById(req.params.id);
      if (!user) {
        throw new NotFoundError('User not found');
      }

      if (user.getOrganizationId() !== req.user!.organizationId) {
        throw new ForbiddenError('Access denied');
      }

      if (req.body.firstName) user.updateName(req.body.firstName, user.getLastName());
      if (req.body.lastName) user.updateName(user.getFirstName(), req.body.lastName);
      if (req.body.isActive !== undefined) {
        if (req.body.isActive) {
          user.activate();
        } else {
          user.deactivate();
        }
      }

      const updatedUser = await this.userRepository.update(user);

      res.json({
        success: true,
        data: {
          user: {
            id: updatedUser.getId(),
            firstName: updatedUser.getFirstName(),
            lastName: updatedUser.getLastName(),
            isActive: updatedUser.isActive(),
            updatedAt: updatedUser.getUpdatedAt(),
          },
        },
      });
    } catch (error) {
      next(error);
    }
  }

  async delete(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      if (!['admin'].includes(req.user!.role)) {
        throw new ForbiddenError('Only admin can delete users');
      }

      const user = await this.userRepository.findById(req.params.id);
      if (!user) {
        throw new NotFoundError('User not found');
      }

      if (user.getOrganizationId() !== req.user!.organizationId) {
        throw new ForbiddenError('Access denied');
      }

      await this.userRepository.delete(req.params.id);

      res.json({
        success: true,
        message: 'User deleted successfully',
      });
    } catch (error) {
      next(error);
    }
  }
}
