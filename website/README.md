# Site Web Awid

Site vitrine professionnel pour l'application Awid - Gestion de livraison B2B.

## Structure
```
website/
├── index.html      # Page principale
├── styles.css      # Styles CSS
├── script.js       # JavaScript
├── favicon.svg     # Icône du site
└── README.md       # Ce fichier
```

## Hébergement Gratuit Recommandé

### 1. **Vercel** (Recommandé) ⭐
- URL: https://vercel.com
- Avantages: Déploiement automatique depuis GitHub, SSL gratuit, CDN mondial
- Commande: `vercel` ou connecter le repo GitHub

### 2. **Netlify** ⭐
- URL: https://netlify.com
- Avantages: Drag & drop, formulaires gratuits, SSL, CDN
- Commande: `netlify deploy --prod`

### 3. **GitHub Pages** (Gratuit)
- URL: https://pages.github.com
- Avantages: Intégré à GitHub, gratuit illimité
- Config: Settings > Pages > Source: main branch

### 4. **Cloudflare Pages**
- URL: https://pages.cloudflare.com
- Avantages: CDN ultra-rapide, SSL, analytics gratuits

### 5. **Render**
- URL: https://render.com
- Avantages: Simple, SSL automatique

## Déploiement sur Vercel (Recommandé)

```bash
# 1. Installer Vercel CLI
npm i -g vercel

# 2. Se connecter
vercel login

# 3. Déployer
cd website
vercel

# 4. Déployer en production
vercel --prod
```

## Déploiement sur Netlify

```bash
# 1. Installer Netlify CLI
npm i -g netlify-cli

# 2. Se connecter
netlify login

# 3. Déployer
cd website
netlify deploy --prod --dir=.
```

## Déploiement sur GitHub Pages

1. Créer un repo `awid-website` sur GitHub
2. Pousser le contenu du dossier `website/`
3. Aller dans Settings > Pages
4. Sélectionner la branche `main` et le dossier `/root`
5. Le site sera disponible sur `https://username.github.io/awid-website`

## Personnalisation

- **Couleurs**: Modifier les variables CSS dans `:root` de `styles.css`
- **Contenu**: Modifier `index.html`
- **Contact**: Remplacer l'email et téléphone dans la section contact
- **Téléchargement**: Mettre à jour le lien APK dans la section download

## Fonctionnalités

- ✅ Design responsive (mobile, tablette, desktop)
- ✅ Animations fluides
- ✅ Navigation sticky
- ✅ Démo interactive des interfaces
- ✅ Section tarification
- ✅ Formulaire de contact
- ✅ Optimisé SEO
