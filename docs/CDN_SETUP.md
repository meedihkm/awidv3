# Configuration CDN & Mise en Cache

## 🌍 Objectif
Accélérer la distribution des assets statiques (images, CSS, JS) et réduire la charge sur le serveur API via un CDN (Content Delivery Network).

## 1. Choix du CDN

Nous recommandons **Cloudflare** (version gratuite suffisante) ou **Vercel Edge Network**.

### Configuration Cloudflare
1.  **Enregistrement** : Créer un compte et ajouter le domaine.
2.  **DNS** : Faire pointer les DNS du domaine vers Cloudflare.
3.  **Proxy** : Activer le nuage orange (Proxy) pour les enregistrements `A` ou `CNAME` de l'API et du frontend.

## 2. Stratégie de Cache (Cache-Control)

L'API doit renvoyer les bons headers pour dire au CDN quoi mettre en cache.

### Assets Statiques (Images Produits / Avatars)
Ces fichiers changent rarement. On utilise une stratégie de cache agressif.

**Header Recommandé :**
```http
Cache-Control: public, max-age=31536000, immutable
```
- `public` : Peut être caché par le CDN.
- `max-age=31536000` : 1 an (cache long terme).
- `immutable` : Le fichier ne changera jamais (si on modifie l'image, on change le nom du fichier, ex: timestamp).

### Réponses API Dynamiques (Produits, Listes)
Ces données changent. On utilise un cache court ou une revalidation.

**Header Recommandé (pour `/api/products` par exemple) :**
```http
Cache-Control: public, max-age=300, stale-while-revalidate=60
```
- `max-age=300` : Cache frais pendant 5 minutes.
- `stale-while-revalidate=60` : Servir le cache périmé pendant 1 minute tout en rechargeant en arrière-plan.

**Pour les données utilisateur (`/api/orders`, `/api/users`) :**
```http
Cache-Control: private, no-cache
```
- `private` : Uniquement pour le navigateur de l'utilisateur (pas de CDN partagé).
- `no-cache` : Toujours valider avec le serveur (ETag).

## 3. Configuration Nginx (Reverse Proxy)

Si vous hébergez sur un VPS avec Nginx, ajoutez la compression Gzip pour les fichiers statiques :

```nginx
gzip on;
gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
```
