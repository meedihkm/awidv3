const express = require('express');
const cors = require('cors');
const helmet = require('helmet');

const corsOptions = require('./config/cors');
const { globalLimiter } = require('./middleware/rateLimit');

// Routes
const authRoutes = require('./routes/auth.routes');
const productsRoutes = require('./routes/products.routes');
const usersRoutes = require('./routes/users.routes');
const ordersRoutes = require('./routes/orders.routes');
const deliveriesRoutes = require('./routes/deliveries.routes');
const organizationRoutes = require('./routes/organization.routes');
const superAdminRoutes = require('./routes/superAdmin.routes');

const app = express();

// Trust proxy pour Vercel
app.set('trust proxy', 1);

// Middleware sécurité
app.use(helmet({
  contentSecurityPolicy: false,
  crossOriginEmbedderPolicy: false
}));

app.use(cors(corsOptions));
app.use(express.json({ limit: '1mb' }));
app.use('/api/', globalLimiter);

// Routes publiques
app.get('/', (req, res) => {
  res.json({ status: 'ok', version: '2.0.0', name: 'Awid API', timestamp: new Date().toISOString() });
});

app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', version: '2.0.0', timestamp: new Date().toISOString() });
});

// Routes API
app.use('/api/auth', authRoutes);
app.use('/api/products', productsRoutes);
app.use('/api/users', usersRoutes);
app.use('/api/orders', ordersRoutes);
app.use('/api/deliveries', deliveriesRoutes);
app.use('/api/deliverers', deliveriesRoutes); // Alias pour compatibilité
app.use('/api/organization', organizationRoutes);
app.use('/api/financial', organizationRoutes); // Routes financières dans organization
app.use('/api/audit-logs', organizationRoutes); // Routes audit dans organization
app.use('/api/super-admin', superAdminRoutes);

// Page Super Admin HTML
app.get('/api/admin', (req, res) => {
  res.sendFile('super-admin.html', { root: __dirname + '/..' });
});

// 404 handler
app.use('/api/*', (req, res) => {
  res.status(404).json({ error: 'Route non trouvée' });
});

// Error handler
app.use((err, req, res, next) => {
  console.error('Server error:', err);
  res.status(500).json({ error: 'Erreur serveur interne' });
});

module.exports = app;
