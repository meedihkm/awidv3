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

// Page Super Admin HTML (inline pour Vercel serverless)
app.get('/api/admin', (req, res) => {
  res.setHeader('Content-Type', 'text/html');
  res.send(`<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Super Admin - Awid v2</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background: #1a1a2e; color: #fff; padding: 20px; }
        .container { max-width: 1200px; margin: 0 auto; }
        h1 { color: #2E7D32; margin-bottom: 20px; }
        .card { background: #16213e; border-radius: 10px; padding: 20px; margin-bottom: 20px; }
        .stats { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px; }
        .stat-box { background: #0f3460; padding: 20px; border-radius: 8px; text-align: center; }
        .stat-box h3 { color: #2E7D32; font-size: 2em; }
        .stat-box p { color: #aaa; }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #0f3460; }
        th { background: #0f3460; color: #2E7D32; }
        tr:hover { background: #0f3460; }
        .btn { padding: 8px 16px; border: none; border-radius: 5px; cursor: pointer; margin: 2px; }
        .btn-danger { background: #e94560; color: #fff; }
        .btn-success { background: #2E7D32; color: #fff; }
        .btn-warning { background: #f39c12; color: #000; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; color: #aaa; }
        .form-group input { width: 100%; padding: 10px; border: 1px solid #0f3460; border-radius: 5px; background: #1a1a2e; color: #fff; }
        .tabs { display: flex; gap: 10px; margin-bottom: 20px; flex-wrap: wrap; }
        .tab { padding: 10px 20px; background: #0f3460; border: none; color: #fff; cursor: pointer; border-radius: 5px; }
        .tab.active { background: #2E7D32; color: #fff; }
        .hidden { display: none; }
        .status-active { color: #00ff00; }
        .status-inactive { color: #ff0000; }
        #login-section { max-width: 400px; margin: 50px auto; }
        #login-section h2 { color: #2E7D32; margin-bottom: 20px; text-align: center; }
        .error-msg { color: #e94560; margin-top: 10px; text-align: center; }
        #main-content { display: none; }
    </style>
</head>
<body>
    <div class="container">
        <h1>ⴰⵡⵉⴷ Super Admin Panel v2</h1>
        <div id="login-section" class="card">
            <h2>Authentification</h2>
            <form id="login-form">
                <div class="form-group">
                    <label>Clé Super Admin</label>
                    <input type="password" id="admin-key" required placeholder="Entrez votre clé secrète">
                </div>
                <button type="submit" class="btn btn-success" style="width:100%">Se connecter</button>
                <p id="login-error" class="error-msg hidden"></p>
            </form>
        </div>
        <div id="main-content">
            <div class="tabs">
                <button class="tab active" onclick="showTab('stats')">📊 Stats</button>
                <button class="tab" onclick="showTab('orgs')">🏢 Organisations</button>
                <button class="tab" onclick="showTab('users')">👥 Utilisateurs</button>
                <button class="tab" onclick="showTab('create')">➕ Créer Organisation</button>
                <button class="tab btn-danger" onclick="logout()" style="margin-left:auto">🚪 Déconnexion</button>
            </div>
            <div id="stats" class="card"><h2>Statistiques Globales</h2><div id="stats-content" class="stats"></div></div>
            <div id="orgs" class="card hidden"><h2>Organisations</h2><table><thead><tr><th>ID</th><th>Nom</th><th>Type</th><th>Statut</th><th>Actions</th></tr></thead><tbody id="orgs-table"></tbody></table></div>
            <div id="users" class="card hidden"><h2>Tous les Utilisateurs</h2><table><thead><tr><th>Nom</th><th>Email</th><th>Rôle</th><th>Organisation</th><th>Statut</th></tr></thead><tbody id="users-table"></tbody></table></div>
            <div id="create" class="card hidden"><h2>Créer une Organisation</h2><form id="create-form"><div class="form-group"><label>Nom</label><input type="text" id="org-name" required></div><div class="form-group"><label>Type</label><input type="text" id="org-type" value="restaurant"></div><div class="form-group"><label>Email Admin</label><input type="email" id="admin-email" required></div><div class="form-group"><label>Mot de passe (min 6)</label><input type="password" id="admin-password" required minlength="6"></div><div class="form-group"><label>Nom Admin</label><input type="text" id="admin-name" required></div><div class="form-group"><label>Téléphone</label><input type="text" id="admin-phone"></div><button type="submit" class="btn btn-success">Créer</button></form></div>
        </div>
    </div>
    <script>
        const API = window.location.origin + '/api';
        let KEY = '';
        function getHeaders() { return { 'Content-Type': 'application/json', 'x-super-admin-key': KEY }; }
        function checkAuth() { const k = sessionStorage.getItem('superAdminKey'); if (k) { KEY = k; showMainContent(); } }
        document.getElementById('login-form').onsubmit = async (e) => { e.preventDefault(); const key = document.getElementById('admin-key').value; try { const res = await fetch(API + '/super-admin/test', { headers: { 'Content-Type': 'application/json', 'x-super-admin-key': key } }); const data = await res.json(); if (data.success) { KEY = key; sessionStorage.setItem('superAdminKey', key); showMainContent(); } else { document.getElementById('login-error').textContent = 'Clé invalide'; document.getElementById('login-error').classList.remove('hidden'); } } catch (err) { document.getElementById('login-error').textContent = 'Erreur'; document.getElementById('login-error').classList.remove('hidden'); } };
        function showMainContent() { document.getElementById('login-section').style.display = 'none'; document.getElementById('main-content').style.display = 'block'; loadStats(); loadOrgs(); loadUsers(); }
        function logout() { sessionStorage.removeItem('superAdminKey'); KEY = ''; document.getElementById('login-section').style.display = 'block'; document.getElementById('main-content').style.display = 'none'; }
        async function fetchAPI(endpoint) { const res = await fetch(API + endpoint, { headers: getHeaders() }); if (res.status === 403) { logout(); return { success: false }; } return res.json(); }
        function esc(t) { if (!t) return ''; const d = document.createElement('div'); d.textContent = t; return d.innerHTML; }
        async function loadStats() { const data = await fetchAPI('/super-admin/stats'); if (data.success) { document.getElementById('stats-content').innerHTML = '<div class="stat-box"><h3>'+data.data.totalOrganizations+'</h3><p>Organisations</p></div><div class="stat-box"><h3>'+data.data.activeOrganizations+'</h3><p>Actives</p></div><div class="stat-box"><h3>'+data.data.totalUsers+'</h3><p>Utilisateurs</p></div><div class="stat-box"><h3>'+data.data.totalOrders+'</h3><p>Commandes</p></div>'; } }
        async function loadOrgs() { const data = await fetchAPI('/super-admin/organizations'); if (data.success) { document.getElementById('orgs-table').innerHTML = data.data.map(o => '<tr><td>'+o.id+'</td><td>'+esc(o.name)+'</td><td>'+esc(o.type)+'</td><td class="'+(o.active?'status-active':'status-inactive')+'">'+(o.active?'Actif':'Inactif')+'</td><td><button class="btn btn-warning" onclick="toggleOrg(&#39;'+o.id+'&#39;,'+(!o.active)+')">'+(o.active?'Désactiver':'Activer')+'</button> <button class="btn btn-danger" onclick="deleteOrg(&#39;'+o.id+'&#39;)">Supprimer</button></td></tr>').join(''); } }
        async function loadUsers() { const data = await fetchAPI('/super-admin/users'); if (data.success) { document.getElementById('users-table').innerHTML = data.data.map(u => '<tr><td>'+esc(u.name)+'</td><td>'+esc(u.email)+'</td><td>'+esc(u.role)+'</td><td>'+esc(u.organization_name)+'</td><td class="'+(u.active?'status-active':'status-inactive')+'">'+(u.active?'Actif':'Inactif')+'</td></tr>').join(''); } }
        async function toggleOrg(id, active) { await fetch(API + '/super-admin/organizations/' + id + '/status', { method: 'PATCH', headers: getHeaders(), body: JSON.stringify({ active }) }); loadOrgs(); loadStats(); loadUsers(); }
        async function deleteOrg(id) { if (confirm('Supprimer cette organisation et toutes ses données ?')) { await fetch(API + '/super-admin/organizations/' + id, { method: 'DELETE', headers: getHeaders() }); loadOrgs(); loadStats(); loadUsers(); } }
        document.getElementById('create-form').onsubmit = async (e) => { e.preventDefault(); const body = { name: document.getElementById('org-name').value, type: document.getElementById('org-type').value, adminEmail: document.getElementById('admin-email').value, adminPassword: document.getElementById('admin-password').value, adminName: document.getElementById('admin-name').value, adminPhone: document.getElementById('admin-phone').value }; const res = await fetch(API + '/super-admin/organizations', { method: 'POST', headers: getHeaders(), body: JSON.stringify(body) }); const data = await res.json(); if (data.success) { alert('Organisation créée !'); e.target.reset(); loadOrgs(); loadStats(); } else { alert('Erreur: ' + (data.error || 'Inconnue')); } };
        function showTab(tab) { document.querySelectorAll('#main-content .card').forEach(c => c.classList.add('hidden')); document.querySelectorAll('.tab').forEach(t => t.classList.remove('active')); document.getElementById(tab).classList.remove('hidden'); event.target.classList.add('active'); }
        checkAuth();
    </script>
</body>
</html>`);
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
