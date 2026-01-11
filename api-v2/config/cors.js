const allowedOrigins = process.env.CORS_ORIGINS 
  ? process.env.CORS_ORIGINS.split(',') 
  : ['http://localhost:3000', 'http://localhost:8080'];

const corsOptions = {
  origin: (origin, callback) => {
    // Permettre les requêtes sans origin (apps mobiles, Postman)
    if (!origin) return callback(null, true);
    
    // En production, vérifier l'origin
    if (process.env.NODE_ENV === 'production') {
      if (allowedOrigins.includes(origin)) {
        return callback(null, true);
      }
      return callback(new Error('CORS non autorisé'), false);
    }
    
    // En dev, tout autoriser
    return callback(null, true);
  },
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization', 'x-super-admin-key'],
};

module.exports = corsOptions;
