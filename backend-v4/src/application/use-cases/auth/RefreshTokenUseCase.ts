import jwt from 'jsonwebtoken';
import { envConfig } from '../../../config/env.validation';
import { IUserRepository } from '../../../domain/repositories/IUserRepository';
import { UnauthorizedError } from '../../../shared/errors/UnauthorizedError';

interface RefreshTokenInput {
  refreshToken: string;
}

interface RefreshTokenOutput {
  accessToken: string;
  refreshToken: string;
}

export class RefreshTokenUseCase {
  constructor(private userRepository: IUserRepository) { }

  async execute(input: RefreshTokenInput): Promise<RefreshTokenOutput> {
    try {
      const decoded = jwt.verify(input.refreshToken, envConfig.JWT_REFRESH_SECRET) as {
        userId: string;
        type: string;
      };

      if (decoded.type !== 'refresh') {
        throw new UnauthorizedError('Invalid token type');
      }

      const user = await this.userRepository.findById(decoded.userId);
      if (!user) {
        throw new UnauthorizedError('User not found');
      }

      if (!user.isActive) {
        throw new UnauthorizedError('User is not active');
      }

      const accessToken = jwt.sign(
        {
          userId: user.getId(),
          organizationId: user.getOrganizationId(),
          role: user.getRole(),
          type: 'access',
        },
        envConfig.JWT_SECRET,
        { expiresIn: envConfig.JWT_EXPIRES_IN }
      );

      const refreshToken = jwt.sign(
        {
          userId: user.getId(),
          type: 'refresh',
        },
        envConfig.JWT_REFRESH_SECRET,
        { expiresIn: envConfig.JWT_REFRESH_EXPIRES_IN }
      );

      return {
        accessToken,
        refreshToken,
      };
    } catch (error) {
      if (error instanceof jwt.JsonWebTokenError) {
        throw new UnauthorizedError('Invalid token');
      }
      if (error instanceof jwt.TokenExpiredError) {
        throw new UnauthorizedError('Token expired');
      }
      throw error;
    }
  }
}
