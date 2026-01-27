/**
 * Infrastructure: Cache Service
 * Service de cache avec Redis
 */
import { RedisConnection } from './RedisConnection';

export interface CacheOptions {
  ttl?: number; // Time to live in seconds
  prefix?: string;
}

export class CacheService {
  private redis = RedisConnection.getInstance();
  private defaultTTL = 3600; // 1 hour
  private defaultPrefix = 'awid:';

  constructor() {}

  private getKey(key: string, prefix?: string): string {
    const finalPrefix = prefix || this.defaultPrefix;
    return `${finalPrefix}${key}`;
  }

  async get<T>(key: string, options?: CacheOptions): Promise<T | null> {
    try {
      const client = this.redis.getClient();
      const fullKey = this.getKey(key, options?.prefix);
      const value = await client.get(fullKey);

      if (!value) {
        return null;
      }

      return JSON.parse(value) as T;
    } catch (error) {
      console.error(`Cache get error for key ${key}:`, error);
      return null;
    }
  }

  async set<T>(key: string, value: T, options?: CacheOptions): Promise<boolean> {
    try {
      const client = this.redis.getClient();
      const fullKey = this.getKey(key, options?.prefix);
      const ttl = options?.ttl || this.defaultTTL;

      await client.setEx(fullKey, ttl, JSON.stringify(value));
      return true;
    } catch (error) {
      console.error(`Cache set error for key ${key}:`, error);
      return false;
    }
  }

  async delete(key: string, options?: CacheOptions): Promise<boolean> {
    try {
      const client = this.redis.getClient();
      const fullKey = this.getKey(key, options?.prefix);
      await client.del(fullKey);
      return true;
    } catch (error) {
      console.error(`Cache delete error for key ${key}:`, error);
      return false;
    }
  }

  async deletePattern(pattern: string, options?: CacheOptions): Promise<number> {
    try {
      const client = this.redis.getClient();
      const fullPattern = this.getKey(pattern, options?.prefix);
      const keys = await client.keys(fullPattern);

      if (keys.length === 0) {
        return 0;
      }

      await client.del(keys);
      return keys.length;
    } catch (error) {
      console.error(`Cache deletePattern error for pattern ${pattern}:`, error);
      return 0;
    }
  }

  async exists(key: string, options?: CacheOptions): Promise<boolean> {
    try {
      const client = this.redis.getClient();
      const fullKey = this.getKey(key, options?.prefix);
      const result = await client.exists(fullKey);
      return result === 1;
    } catch (error) {
      console.error(`Cache exists error for key ${key}:`, error);
      return false;
    }
  }

  async increment(key: string, options?: CacheOptions): Promise<number> {
    try {
      const client = this.redis.getClient();
      const fullKey = this.getKey(key, options?.prefix);
      const result = await client.incr(fullKey);

      // Set TTL if specified
      if (options?.ttl) {
        await client.expire(fullKey, options.ttl);
      }

      return result;
    } catch (error) {
      console.error(`Cache increment error for key ${key}:`, error);
      return 0;
    }
  }

  async decrement(key: string, options?: CacheOptions): Promise<number> {
    try {
      const client = this.redis.getClient();
      const fullKey = this.getKey(key, options?.prefix);
      const result = await client.decr(fullKey);

      // Set TTL if specified
      if (options?.ttl) {
        await client.expire(fullKey, options.ttl);
      }

      return result;
    } catch (error) {
      console.error(`Cache decrement error for key ${key}:`, error);
      return 0;
    }
  }

  async getOrSet<T>(key: string, factory: () => Promise<T>, options?: CacheOptions): Promise<T> {
    // Try to get from cache
    const cached = await this.get<T>(key, options);
    if (cached !== null) {
      return cached;
    }

    // Generate value
    const value = await factory();

    // Store in cache
    await this.set(key, value, options);

    return value;
  }

  async setHash(key: string, field: string, value: any, options?: CacheOptions): Promise<boolean> {
    try {
      const client = this.redis.getClient();
      const fullKey = this.getKey(key, options?.prefix);
      await client.hSet(fullKey, field, JSON.stringify(value));

      // Set TTL if specified
      if (options?.ttl) {
        await client.expire(fullKey, options.ttl);
      }

      return true;
    } catch (error) {
      console.error(`Cache setHash error for key ${key}, field ${field}:`, error);
      return false;
    }
  }

  async getHash<T>(key: string, field: string, options?: CacheOptions): Promise<T | null> {
    try {
      const client = this.redis.getClient();
      const fullKey = this.getKey(key, options?.prefix);
      const value = await client.hGet(fullKey, field);

      if (!value) {
        return null;
      }

      return JSON.parse(value) as T;
    } catch (error) {
      console.error(`Cache getHash error for key ${key}, field ${field}:`, error);
      return null;
    }
  }

  async getAllHash<T>(key: string, options?: CacheOptions): Promise<Record<string, T>> {
    try {
      const client = this.redis.getClient();
      const fullKey = this.getKey(key, options?.prefix);
      const hash = await client.hGetAll(fullKey);

      const result: Record<string, T> = {};
      for (const [field, value] of Object.entries(hash)) {
        result[field] = JSON.parse(value) as T;
      }

      return result;
    } catch (error) {
      console.error(`Cache getAllHash error for key ${key}:`, error);
      return {};
    }
  }

  async deleteHash(key: string, field: string, options?: CacheOptions): Promise<boolean> {
    try {
      const client = this.redis.getClient();
      const fullKey = this.getKey(key, options?.prefix);
      await client.hDel(fullKey, field);
      return true;
    } catch (error) {
      console.error(`Cache deleteHash error for key ${key}, field ${field}:`, error);
      return false;
    }
  }

  async addToSet(key: string, value: string, options?: CacheOptions): Promise<boolean> {
    try {
      const client = this.redis.getClient();
      const fullKey = this.getKey(key, options?.prefix);
      await client.sAdd(fullKey, value);

      // Set TTL if specified
      if (options?.ttl) {
        await client.expire(fullKey, options.ttl);
      }

      return true;
    } catch (error) {
      console.error(`Cache addToSet error for key ${key}:`, error);
      return false;
    }
  }

  async removeFromSet(key: string, value: string, options?: CacheOptions): Promise<boolean> {
    try {
      const client = this.redis.getClient();
      const fullKey = this.getKey(key, options?.prefix);
      await client.sRem(fullKey, value);
      return true;
    } catch (error) {
      console.error(`Cache removeFromSet error for key ${key}:`, error);
      return false;
    }
  }

  async getSet(key: string, options?: CacheOptions): Promise<string[]> {
    try {
      const client = this.redis.getClient();
      const fullKey = this.getKey(key, options?.prefix);
      return await client.sMembers(fullKey);
    } catch (error) {
      console.error(`Cache getSet error for key ${key}:`, error);
      return [];
    }
  }

  async isInSet(key: string, value: string, options?: CacheOptions): Promise<boolean> {
    try {
      const client = this.redis.getClient();
      const fullKey = this.getKey(key, options?.prefix);
      return await client.sIsMember(fullKey, value);
    } catch (error) {
      console.error(`Cache isInSet error for key ${key}:`, error);
      return false;
    }
  }

  async clear(prefix?: string): Promise<number> {
    return this.deletePattern('*', { prefix });
  }
}
