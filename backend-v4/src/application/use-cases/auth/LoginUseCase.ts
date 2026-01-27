/**
 * Use Case: Login
 * Authentifie un utilisateur et génère des tokens JWT
 */
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { envConfig } from '../../../config/env.validation';
import { IUserRepository } from '../../../domain/repositories/IUserRepository';
import { UnauthorizedError } from '../../../shared/errors/UnauthorizedError';

export interface LoginInput {
  email: string;
  password: string;
  remember?: boolean;
  deviceInfo?: {
    platform?: string;
    deviceId?: string;
    appVersion?: string;
  };
}

export interface LoginOutput {
  user: {
    id: string;
    email: string;
    firstName: string;
    lastName: string;
    role: string;
    organizationId: string;
  };
  tokens: {
    accessToken: string;
    refreshToken: string;
  };
}

export class LoginUseCase {
  constructor(private userRepository: IUserRepository) { }

  async execute(input: LoginInput): Promise<LoginOutput> {
    // Trouver l'utilisateur par email
    const user = await this.userRepository.findByEmail(input.email);

    if (!user) {
      throw new UnauthorizedError('Email ou mot de passe incorrect');
    }

    // Vérifier si l'utilisateur est actif
    if (!user.isActive()) {
      throw new UnauthorizedError('Compte désactivé');
    }

    // Vérifier le mot de passe
    const isPasswordValid = await bcrypt.compare(input.password, user.getPasswordHash());

    if (!isPasswordValid) {
      throw new UnauthorizedError('Email ou mot de passe incorrect');
    }

    // Enregistrer la connexion
    user.recordLogin();
    await this.userRepository.update(user);

    // Générer les tokens
    const accessToken = this.generateAccessToken(
      user.getId(),
      user.getOrganizationId(),
      user.getRole()
    );
    const refreshToken = this.generateRefreshToken(user.getId());

    return {
      user: {
        id: user.getId(),
        email: user.getEmail().value,
        firstName: user.getFirstName(),
        lastName: user.getLastName(),
        role: user.getRole(),
        organizationId: user.getOrganizationId(),
      },
      tokens: {
        accessToken,
        refreshToken,
      },
    };
  }

  private generateAccessToken(userId: string, organizationId: string, role: string): string {
    return jwt.sign(
      {
        userId,
        organizationId,
        role,
        type: 'access',
      },
      envConfig.JWT_SECRET,
      { expiresIn: envConfig.JWT_EXPIRES_IN }
    );
  }

  private generateRefreshToken(userId: string): string {
    return jwt.sign(
      {
        userId,
        type: 'refresh',
      },
      envConfig.JWT_REFRESH_SECRET,
      { expiresIn: envConfig.JWT_REFRESH_EXPIRES_IN }
    );
  }
}
