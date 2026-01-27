/**
 * Validation Error
 * Erreur de validation des données
 */
import { AppError } from './AppError';

export class ValidationError extends AppError {
  constructor(
    message: string = 'Données invalides',
    public readonly details?: Array<{ field: string; message: string }>
  ) {
    super(message, 400, 'VALIDATION_ERROR');
  }

  toJSON(): Record<string, unknown> {
    return {
      ...super.toJSON(),
      details: this.details,
    };
  }
}
