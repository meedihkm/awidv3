/**
 * Not Found Error
 * Erreur quand une ressource n'est pas trouvée
 */
import { AppError } from './AppError';

export class NotFoundError extends AppError {
  constructor(resource: string = 'Ressource', id?: string) {
    const message = id ? `${resource} avec l'ID ${id} introuvable` : `${resource} introuvable`;
    super(message, 404, 'NOT_FOUND');
  }
}
