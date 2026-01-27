/**
 * Base Application Error
 * Classe de base pour toutes les erreurs de l'application
 */
export class AppError extends Error {
  constructor(
    public readonly message: string,
    public readonly statusCode: number = 500,
    public readonly code: string = 'INTERNAL_ERROR',
    public readonly isOperational: boolean = true
  ) {
    super(message);
    this.name = this.constructor.name;
    Error.captureStackTrace(this, this.constructor);
  }

  toJSON(): Record<string, unknown> {
    return {
      success: false,
      error: this.message,
      code: this.code,
      statusCode: this.statusCode,
    };
  }
}
