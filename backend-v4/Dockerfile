# Multi-stage build pour optimiser la taille de l'image
FROM node:20-alpine AS builder

# Installer les dépendances système nécessaires pour la compilation
RUN apk add --no-cache python3 make g++

WORKDIR /app

# Copier les fichiers de dépendances
COPY package.json package-lock.json ./
COPY tsconfig.json ./

# Installer toutes les dépendances (dev + prod) avec npm ci pour garantir la reproductibilité
RUN npm ci

# Copier le code source
COPY src ./src

# Compiler TypeScript en JavaScript
RUN npm run build

# Stage de production
FROM node:20-alpine

# Installer les dépendances système pour la production
RUN apk add --no-cache \
    postgresql-client \
    curl \
    bash \
    tzdata

# Créer un utilisateur non-root pour la sécurité
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

WORKDIR /app

# Copier package.json et package-lock.json
COPY package.json package-lock.json ./

# Installer UNIQUEMENT les dépendances de production
RUN npm ci --only=production

# Copier les fichiers compilés depuis le builder
COPY --from=builder --chown=nodejs:nodejs /app/dist ./dist

# Copier les migrations et seeds si nécessaires
COPY --from=builder --chown=nodejs:nodejs /app/src/infrastructure/database/migrations ./dist/infrastructure/database/migrations
COPY --from=builder --chown=nodejs:nodejs /app/src/infrastructure/database/seeds ./dist/infrastructure/database/seeds

# Créer les dossiers nécessaires avec les bonnes permissions
RUN mkdir -p uploads logs && \
    chown -R nodejs:nodejs /app

# Changer vers l'utilisateur non-root
USER nodejs

# Exposer le port
EXPOSE 3000

# Healthcheck pour vérifier que l'application répond
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:3000/health || exit 1

# Démarrer l'application compilée
CMD ["node", "dist/main.js"]
