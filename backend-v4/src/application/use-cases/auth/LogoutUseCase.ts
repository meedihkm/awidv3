import { IUserRepository } from '../../../domain/repositories/IUserRepository';

interface LogoutInput {
  userId: string;
}

interface LogoutOutput {
  success: boolean;
}

export class LogoutUseCase {
  constructor(private userRepository: IUserRepository) {}

  async execute(input: LogoutInput): Promise<LogoutOutput> {
    return {
      success: true,
    };
  }
}
