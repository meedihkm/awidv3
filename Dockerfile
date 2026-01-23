# Dockerfile pour AWID Backend
FROM node:18-alpine

# Installer les dépendances système
RUN apk add --no-cache postgresql-client curl

# Créer le répertoire de l'app
WORKDIR /app

# Copier les fichiers de dépendances
COPY package*.json ./

# Installer les dépendances de production
RUN npm ci --only=production && npm cache clean --force

# Copier le code source
COPY api-v2 ./api-v2

# Créer le dossier uploads avec les bonnes permissions
RUN mkdir -p api-v2/uploads && chmod 755 api-v2/uploads

# Exposer le port
EXPOSE 3000

# Healthcheck pour Coolify
HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
  CMD node -e "require('http').get('http://localhost:3000/api/health', (r) => {process.exit(r.statusCode === 200 ? 0 : 1)})" || exit 1

# Démarrer l'application
CMD ["node", "api-v2/index.js"]
