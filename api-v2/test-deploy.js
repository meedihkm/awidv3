// Test simple pour vérifier que Vercel peut démarrer l'app
console.log('=== Test de déploiement ===');
console.log('NODE_VERSION:', process.version);
console.log('ENV:', process.env.NODE_ENV);

try {
  console.log('Chargement express...');
  const express = require('express');
  console.log('✓ Express chargé');
  
  console.log('Chargement cors...');
  const cors = require('cors');
  console.log('✓ CORS chargé');
  
  console.log('Chargement helmet...');
  const helmet = require('helmet');
  console.log('✓ Helmet chargé');
  
  console.log('Chargement config/cors...');
  const corsOptions = require('./config/cors');
  console.log('✓ Config CORS chargé');
  
  console.log('Chargement middleware/rateLimit...');
  const { globalLimiter } = require('./middleware/rateLimit');
  console.log('✓ RateLimit chargé');
  
  console.log('Chargement routes/auth.routes...');
  const authRoutes = require('./routes/auth.routes');
  console.log('✓ Auth routes chargé');
  
  console.log('\n✅ Tous les modules se chargent correctement!');
  
} catch (error) {
  console.error('\n❌ Erreur de chargement:');
  console.error(error.message);
  console.error(error.stack);
  process.exit(1);
}
