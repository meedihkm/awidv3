# 🔐 AWID Security Audit - Sprint 1.1

**Date**: Janvier 2026  
**Version**: 2.0.0  
**Auditeur**: Sprint 1.1 Sécurité

---

## Résumé Exécutif

Ce document résume les corrections de sécurité appliquées à AWID API v2 dans le cadre du Sprint 1.1 "Fondations - Sécurité".

### Vulnérabilités Corrigées

| Catégorie | Sévérité | Statut |
|-----------|----------|--------|
| CORS permissif | 🟠 Moyenne | ✅ Corrigé |
| SSL PostgreSQL non vérifié | 🔴 Haute | ✅ Corrigé |
| Fuite données inter-orgs | 🔴 Haute | ✅ Corrigé |
| Absence 2FA Super-Admin | 🟠 Moyenne | ✅ Implémenté |
| CSP désactivé | 🟠 Moyenne | ✅ Corrigé |
| HSTS absent | 🟠 Moyenne | ✅ Corrigé |

---

## 1. Configuration CORS

### Problème Initial
```javascript
// AVANT: Trop permissif
if (origin.includes('vercel.app')) {
  return callback(null, true); // Autorise TOUS les *.vercel.app!
}
```

### Correction Appliquée

**Fichier**: `api-v2/config/cors.js`

- ✅ Whitelist stricte via `ALLOWED_ORIGINS`
- ✅ Blocage explicite avec code 403
- ✅ Logging des rejets en production
- ✅ Support header `x-2fa-code` pour 2FA

### Configuration Production

```env
ALLOWED_ORIGINS="https://votre-app.vercel.app,https://admin.votre-domaine.com"
```

---

## 2. SSL PostgreSQL

### Problème Initial
```javascript
// AVANT: Vulnérable MITM
ssl: { rejectUnauthorized: false }
```

### Correction Appliquée

**Fichier**: `api-v2/config/database.js`

- ✅ `rejectUnauthorized: true` par défaut en production
- ✅ Support certificat CA personnalisé (`DATABASE_SSL_CA`)
- ✅ Avertissement si SSL désactivé
- ✅ Logging sans `console.log` en production

### Configuration Production

```env
# Validation SSL activée (recommandé)
DATABASE_SSL_REJECT_UNAUTHORIZED="true"

# Certificat CA optionnel (si requis par votre provider)
DATABASE_SSL_CA="/path/to/ca-certificate.crt"
```

> ⚠️ **Note Supabase/Neon**: Ces providers utilisent des certificats valides. 
> Si vous rencontrez des erreurs SSL, contactez le support pour obtenir le certificat CA.

---

## 3. Protection Multi-Tenant (organization_id)

### Problème Initial
```javascript
// AVANT: Pas de filtre organization_id
WHERE deliverer_id = $1 // Un admin peut voir les données de TOUTES les orgs!
```

### Correction Appliquée

**Fichier**: `api-v2/routes/deliveries.routes.js`

- ✅ Vérification que le livreur appartient à l'organisation
- ✅ Retour 404 si tentative d'accès à une autre organisation

```javascript
// APRÈS
const delivererCheck = await pool.query(
  'SELECT id FROM users WHERE id = $1 AND organization_id = $2',
  [delivererId, req.user.organization_id]
);
```

---

## 4. 2FA Super-Admin (TOTP)

### Implémentation

**Fichiers**:
- `api-v2/services/twofa.service.js` (nouveau)
- `api-v2/routes/superAdmin.routes.js` (modifié)

### Fonctionnalités

| Endpoint | Description |
|----------|-------------|
| `GET /super-admin/2fa/status` | Vérifie si 2FA est activé |
| `POST /super-admin/2fa/setup` | Configure 2FA, retourne secret + QR |
| `POST /super-admin/2fa/verify` | Vérifie code et active 2FA |
| `POST /super-admin/2fa/disable` | Désactive 2FA (requiert code) |

### Caractéristiques

- ✅ Compatible Google Authenticator, Authy, etc.
- ✅ 8 backup codes générés (usage unique)
- ✅ Backup codes hashés en SHA-256
- ✅ Table `super_admin_config` créée automatiquement

### Activation

1. Appeler `POST /super-admin/2fa/setup`
2. Scanner le QR code avec une app TOTP
3. Appeler `POST /super-admin/2fa/verify` avec le code
4. **Conserver les backup codes en lieu sûr!**

---

## 5. Headers de Sécurité (CSP + HSTS)

### Fichiers Créés

- `api-v2/config/security.js` (configuration Helmet)
- `api-v2/middleware/httpsRedirect.js` (redirection HTTP→HTTPS)

### Headers Configurés

| Header | Valeur |
|--------|--------|
| Content-Security-Policy | Strict avec `default-src: 'self'` |
| Strict-Transport-Security | `max-age=31536000; includeSubDomains; preload` |
| X-Content-Type-Options | `nosniff` |
| X-Frame-Options | `DENY` |
| Referrer-Policy | `strict-origin-when-cross-origin` |
| Permissions-Policy | Toutes fonctionnalités désactivées |

### Test des Headers

```bash
curl -I https://votre-api.vercel.app/api/health
```

Vérifier la présence de:
- `Strict-Transport-Security`
- `Content-Security-Policy`
- `X-Content-Type-Options: nosniff`

---

## 6. Audit des Secrets

### Vérifications Effectuées

- ✅ Aucun secret hardcodé dans le code source
- ✅ `.env.example` mis à jour avec toutes les variables
- ✅ Génération de secrets documentée

### Commandes de Génération

```bash
# JWT Secret (64 bytes recommandé)
node -e "console.log(require('crypto').randomBytes(64).toString('hex'))"

# Super Admin Key (32 bytes minimum)
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
```

---

## Checklist de Validation

### Tests Automatisés

```bash
# 1. Vérifier blocage CORS
curl -H "Origin: https://evil.com" -I https://api.votre-app.com/api/health
# Attendu: 403 Forbidden

# 2. Vérifier headers de sécurité
curl -I https://api.votre-app.com/api/health | grep -E "(Strict-Transport|Content-Security)"
# Attendu: Headers présents

# 3. Tester redirection HTTPS
curl -I http://api.votre-app.com/api/health
# Attendu: 301 vers HTTPS
```

### Tests Manuels

- [ ] Connexion DB SSL vérifié (pas d'avertissement dans les logs)
- [ ] Panel super-admin accessible
- [ ] 2FA: setup → verify → test fonctionnel
- [ ] Accès location_history d'une autre org → 404

---

## Recommandations Futures

### Priorité Haute

1. **Rate Limiting 2FA**: Limiter les tentatives de vérification
2. **Rotation des secrets**: Script automatique tous les 90 jours
3. **Audit logging 2FA**: Logger toutes les opérations 2FA

### Priorité Moyenne

4. **WAF**: Ajouter un Web Application Firewall (Cloudflare, AWS WAF)
5. **Dependency audit**: `npm audit` automatique en CI/CD
6. **Penetration testing**: Audit externe annuel

---

## Fichiers Modifiés/Créés

| Fichier | Action | Description |
|---------|--------|-------------|
| `api-v2/config/cors.js` | ✏️ Modifié | Whitelist CORS stricte |
| `api-v2/config/database.js` | ✏️ Modifié | SSL PostgreSQL sécurisé |
| `api-v2/config/security.js` | ➕ Nouveau | Configuration Helmet CSP/HSTS |
| `api-v2/middleware/httpsRedirect.js` | ➕ Nouveau | Redirection HTTP→HTTPS |
| `api-v2/services/twofa.service.js` | ➕ Nouveau | Service 2FA TOTP |
| `api-v2/routes/superAdmin.routes.js` | ✏️ Modifié | Endpoints 2FA |
| `api-v2/routes/deliveries.routes.js` | ✏️ Modifié | Filtre organization_id |
| `api-v2/index.js` | ✏️ Modifié | Intégration middlewares sécurité |
| `.env.example` | ✏️ Modifié | Variables sécurité ajoutées |
| `package.json` | ✏️ Modifié | Ajout dépendance `otplib` |

---

## Dépendances Ajoutées

| Package | Version | Usage |
|---------|---------|-------|
| `otplib` | ^12.0.1 | Génération/validation TOTP pour 2FA |

**Installation**: `npm install`

---

*Document généré le 20 Janvier 2026 - AWID Sprint 1.1 Sécurité*

---

## 7. Audit Automatisé (Sprint 1.4)

### Outil: OWASP ZAP (Zed Attack Proxy)

### Procédure de Scan
1. **Démarrer l'API** :
   ```bash
   npm start
   ```

2. **Scanner avec OWASP ZAP (Docker)** :
   ```bash
   # Scan rapide (Baseline)
   docker run -v $(pwd):/zap/wrk/:rw -t owasp/zap2docker-stable zap-baseline.py \
     -t http://host.docker.internal:3000 \
     -r owasp-report.html
     
   # Scan complet (Full Scan)
   docker run -v $(pwd):/zap/wrk/:rw -t owasp/zap2docker-stable zap-full-scan.py \
     -t http://host.docker.internal:3000 \
     -r owasp-full-report.html
   ```

### Liste de Contrôle (Vulnérabilités Communes)

| Vulnérabilité (OWASP Top 10) | Statut Code Review | Mécanisme de Défense |
|------------------------------|--------------------|----------------------|
| **Injection (SQL)** | ✅ Sécurisé | Requêtes paramétrées (`pg` library) uniquement. Pas de concaténation de chaînes. |
| **Broken Authentication** | ✅ Sécurisé | JWT (signé), Bcrypt (12 rounds), Rate Limiting, 2FA (Super Admin). |
| **Sensitive Data Exposure** | ✅ Sécurisé | HTTPS forcé, HSTS, Mots de passe hashés, Secrets en ENV. |
| **XML External Entities (XXE)** | ✅ Sécurisé | Body parser JSON limité à 1MB. XML désactivé. |
| **Broken Access Control** | ✅ Sécurisé | Middlewares `authenticate`, `requireAdmin`, vérification `organization_id` systématique. |
| **Security Misconfiguration** | ✅ Sécurisé | Headers Helmet (CSP, FrameGuard, NoSniff). Stack traces masquées en prod. |
| **XSS** | ✅ Sécurisé | Content-Security-Policy strict, Input validation (Zod). |
| **Insecure Deserialization** | ✅ Sécurisé | Pas de désérialisation d'objets complexes. JSON pur. |
| **Using Components with Known Vuln.** | ⚠️ À Surveiller | `npm audit` doit être exécuté régulièrement. |
| **Insufficient Logging** | ✅ Sécurisé | Audit Logging complet en base (`audit_logs`) + Sentry + Winston. |

### Note sur les Faux Positifs
Le scanneur peut signaler `Missing Anti-CSRF Tokens`. Comme l'API utilise JWT (Auth Bearer) et non des cookies de session, cette alerte est un faux positif attendu pour une API REST Stateless.
