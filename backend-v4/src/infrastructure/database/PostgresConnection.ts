import { Pool, PoolClient, PoolConfig } from 'pg';
import { envConfig } from '../../config/env.validation';

/**
 * PostgreSQL Connection Manager
 * Gère le pool de connexions à la base de données
 */
export class PostgresConnection {
  private static instance: PostgresConnection;
  private pool: Pool;
  private isConnected: boolean = false;

  private constructor() {
    const config: PoolConfig = {
      host: envConfig.DATABASE_HOST,
      port: envConfig.DATABASE_PORT,
      database: envConfig.DATABASE_NAME,
      user: envConfig.DATABASE_USER,
      password: envConfig.DATABASE_PASSWORD,
      max: 20, // Maximum de connexions dans le pool
      idleTimeoutMillis: 30000, // Fermer les connexions inactives après 30s
      connectionTimeoutMillis: 5000, // Timeout de connexion 5s
      ssl: envConfig.NODE_ENV === 'production' ? { rejectUnauthorized: false } : false,
    };

    this.pool = new Pool(config);

    // Gestion des erreurs du pool
    this.pool.on('error', (err) => {
      console.error('Unexpected error on idle client', err);
      process.exit(-1);
    });

    // Log des connexions en développement
    if (envConfig.NODE_ENV === 'development') {
      this.pool.on('connect', () => {
        console.log('📦 New database connection established');
      });

      this.pool.on('remove', () => {
        console.log('📦 Database connection removed from pool');
      });
    }
  }

  /**
   * Singleton instance
   */
  public static getInstance(): PostgresConnection {
    if (!PostgresConnection.instance) {
      PostgresConnection.instance = new PostgresConnection();
    }
    return PostgresConnection.instance;
  }

  /**
   * Teste la connexion à la base de données
   */
  public async connect(): Promise<void> {
    try {
      const client = await this.pool.connect();
      const result = await client.query('SELECT NOW()');
      client.release();

      this.isConnected = true;
      console.log('✅ Database connected successfully at', result.rows[0].now);
    } catch (error) {
      this.isConnected = false;
      console.error('❌ Database connection failed:', error);
      throw error;
    }
  }

  /**
   * Ferme toutes les connexions du pool
   */
  public async disconnect(): Promise<void> {
    try {
      await this.pool.end();
      this.isConnected = false;
      console.log('✅ Database disconnected successfully');
    } catch (error) {
      console.error('❌ Error disconnecting from database:', error);
      throw error;
    }
  }

  /**
   * Obtient le pool de connexions
   */
  public getPool(): Pool {
    return this.pool;
  }

  /**
   * Obtient une connexion du pool
   */
  public async getClient(): Promise<PoolClient> {
    return await this.pool.connect();
  }

  /**
   * Exécute une requête simple
   */
  public async query<T = any>(text: string, params?: any[]): Promise<T[]> {
    const start = Date.now();
    try {
      const result = await this.pool.query(text, params);
      const duration = Date.now() - start;

      if (envConfig.NODE_ENV === 'development') {
        console.log('📊 Query executed', { text, duration, rows: result.rowCount });
      }

      return result.rows;
    } catch (error) {
      console.error('❌ Query error:', { text, error });
      throw error;
    }
  }

  /**
   * Exécute une transaction
   */
  public async transaction<T>(
    callback: (client: PoolClient) => Promise<T>
  ): Promise<T> {
    const client = await this.pool.connect();

    try {
      await client.query('BEGIN');
      const result = await callback(client);
      await client.query('COMMIT');
      return result;
    } catch (error) {
      await client.query('ROLLBACK');
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Vérifie l'état de la connexion
   */
  public async healthCheck(): Promise<{
    status: 'healthy' | 'unhealthy';
    message: string;
    details?: any;
  }> {
    try {
      const client = await this.pool.connect();
      const result = await client.query('SELECT NOW(), version()');
      client.release();

      return {
        status: 'healthy',
        message: 'Database connection is healthy',
        details: {
          timestamp: result.rows[0].now,
          version: result.rows[0].version,
          totalConnections: this.pool.totalCount,
          idleConnections: this.pool.idleCount,
          waitingRequests: this.pool.waitingCount,
        },
      };
    } catch (error) {
      return {
        status: 'unhealthy',
        message: 'Database connection failed',
        details: error instanceof Error ? error.message : 'Unknown error',
      };
    }
  }

  /**
   * Obtient les statistiques du pool
   */
  public getPoolStats() {
    return {
      total: this.pool.totalCount,
      idle: this.pool.idleCount,
      waiting: this.pool.waitingCount,
    };
  }

  /**
   * Vérifie si la connexion est établie
   */
  public isHealthy(): boolean {
    return this.isConnected;
  }
}

// Export singleton instance
export const db = PostgresConnection.getInstance();
