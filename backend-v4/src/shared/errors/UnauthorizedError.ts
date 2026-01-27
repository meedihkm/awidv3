/**
 * Unauthorized Error
 * Erreur d'authentification
 */
import { AppError } from './AppError';

export class UnauthorizedError extends AppError {
  constructor(message: string = 'Non authentifié') {
    super(message, 401, 'UNAUTHORIZED');
  }
}
