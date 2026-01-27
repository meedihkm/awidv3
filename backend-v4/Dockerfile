# Image de base Node.js
FROM node:20-alpine

# Installer les dépendances système
RUN apk add --no-cache \
    postgresql-client \
    curl \
    bash \
    tzdata

# Créer un utilisateur non-root
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

WORKDIR /app

# Copier package.json et installer les dépendances
COPY package.json ./

# Installer les dépendances en production + tsx pour exécuter TypeScript
RUN npm install --production --legacy-peer-deps && \
    npm install tsx --legacy-peer-deps

# Copier le code source et la configuration
COPY tsconfig.json ./
COPY src ./src

# Créer les dossiers nécessaires
RUN mkdir -p uploads logs && \
    chown -R nodejs:nodejs /app

# Changer vers l'utilisateur non-root
USER nodejs

# Exposer le port
EXPOSE 3000

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:3000/health || exit 1

# Démarrer l'application avec tsx (exécute TypeScript directement)
CMD ["npx", "tsx", "src/main.ts"]
