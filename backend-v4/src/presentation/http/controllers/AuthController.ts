import { NextFunction, Request, Response } from 'express';
import {
    ChangePasswordUseCase,
    LoginUseCase,
    LogoutUseCase,
    RefreshTokenUseCase,
    RegisterUseCase,
} from '../../../application/use-cases/auth';
import {
    PostgresOrganizationRepository,
    PostgresUserRepository,
} from '../../../infrastructure/database/repositories';

export class AuthController {
  private loginUseCase: LoginUseCase;
  private registerUseCase: RegisterUseCase;
  private refreshTokenUseCase: RefreshTokenUseCase;
  private logoutUseCase: LogoutUseCase;
  private changePasswordUseCase: ChangePasswordUseCase;

  constructor() {
    const userRepository = new PostgresUserRepository();
    const organizationRepository = new PostgresOrganizationRepository();

    this.loginUseCase = new LoginUseCase(userRepository);
    this.registerUseCase = new RegisterUseCase(userRepository, organizationRepository);
    this.refreshTokenUseCase = new RefreshTokenUseCase(userRepository);
    this.logoutUseCase = new LogoutUseCase(userRepository);
    this.changePasswordUseCase = new ChangePasswordUseCase(userRepository);
  }

  async login(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const result = await this.loginUseCase.execute({
        email: req.body.email,
        password: req.body.password,
      });

      res.json({
        success: true,
        data: result,
      });
    } catch (error) {
      next(error);
    }
  }

  async register(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const result = await this.registerUseCase.execute(req.body);

      res.status(201).json({
        success: true,
        data: result,
      });
    } catch (error) {
      next(error);
    }
  }

  async refreshToken(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const result = await this.refreshTokenUseCase.execute({
        refreshToken: req.body.refreshToken,
      });

      res.json({
        success: true,
        data: result,
      });
    } catch (error) {
      next(error);
    }
  }

  async logout(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const result = await this.logoutUseCase.execute({
        userId: req.user!.userId,
      });

      res.json({
        success: true,
        data: result,
      });
    } catch (error) {
      next(error);
    }
  }

  async changePassword(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      const result = await this.changePasswordUseCase.execute({
        userId: req.user!.userId,
        currentPassword: req.body.currentPassword,
        newPassword: req.body.newPassword,
      });

      res.json({
        success: true,
        data: result,
      });
    } catch (error) {
      next(error);
    }
  }
}
