import * as bcrypt from 'bcrypt';
import { IUserRepository } from '../../../domain/repositories/IUserRepository';
import { NotFoundError } from '../../../shared/errors/NotFoundError';
import { UnauthorizedError } from '../../../shared/errors/UnauthorizedError';
import { ValidationError } from '../../../shared/errors/ValidationError';

interface ChangePasswordInput {
  userId: string;
  currentPassword: string;
  newPassword: string;
}

interface ChangePasswordOutput {
  success: boolean;
}

export class ChangePasswordUseCase {
  constructor(private userRepository: IUserRepository) {}

  async execute(input: ChangePasswordInput): Promise<ChangePasswordOutput> {
    const user = await this.userRepository.findById(input.userId);
    if (!user) {
      throw new NotFoundError('User not found');
    }

    const isPasswordValid = await bcrypt.compare(input.currentPassword, user.getPasswordHash());
    if (!isPasswordValid) {
      throw new UnauthorizedError('Current password is incorrect');
    }

    if (input.newPassword.length < 8) {
      throw new ValidationError('New password must be at least 8 characters');
    }

    const newPasswordHash = await bcrypt.hash(input.newPassword, 12);
    user.updatePassword(newPasswordHash);

    await this.userRepository.update(user);

    return {
      success: true,
    };
  }
}
