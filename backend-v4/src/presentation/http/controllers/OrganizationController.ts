import { NextFunction, Request, Response } from 'express';
import { PostgresOrganizationRepository } from '../../../infrastructure/database/repositories';
import { ForbiddenError } from '../../../shared/errors/ForbiddenError';
import { NotFoundError } from '../../../shared/errors/NotFoundError';

export class OrganizationController {
  private organizationRepository: PostgresOrganizationRepository;

  constructor() {
    this.organizationRepository = new PostgresOrganizationRepository();
  }

  async getById(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const organization = await this.organizationRepository.findById(req.params.id);
      if (!organization) {
        throw new NotFoundError('Organization not found');
      }

      if (organization.getId() !== req.user!.organizationId) {
        throw new ForbiddenError('Access denied');
      }

      const address = organization.getAddress();

      res.json({
        success: true,
        data: {
          organization: {
            id: organization.getId(),
            name: organization.getName(),
            type: organization.getType(),
            description: organization.getDescription(),
            email: organization.getEmail().getValue(),
            phone: organization.getPhone().getValue(),
            address: {
              street: address.street,
              city: address.city,
              state: address.state,
              postalCode: address.postalCode,
              country: address.country,
            },
            defaultCreditLimit: organization.getDefaultCreditLimit().getAmount(),
            defaultCreditDays: organization.getDefaultCreditDays(),
            currency: organization.getCurrency(),
            isActive: organization.isActive(),
            createdAt: organization.getCreatedAt(),
          },
        },
      });
    } catch (error) {
      next(error);
    }
  }

  async update(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      if (!['admin'].includes(req.user!.role)) {
        throw new ForbiddenError('Only admin can update organization');
      }

      const organization = await this.organizationRepository.findById(req.user!.organizationId);
      if (!organization) {
        throw new NotFoundError('Organization not found');
      }

      if (req.body.name) organization.updateName(req.body.name);
      if (req.body.description !== undefined) organization.updateDescription(req.body.description);

      const updatedOrganization = await this.organizationRepository.update(organization);

      res.json({
        success: true,
        data: {
          organization: {
            id: updatedOrganization.getId(),
            name: updatedOrganization.getName(),
            description: updatedOrganization.getDescription(),
            updatedAt: updatedOrganization.getUpdatedAt(),
          },
        },
      });
    } catch (error) {
      next(error);
    }
  }
}
