# Image de base Node.js
FROM node:20-alpine

# Installer les dépendances système
RUN apk add --no-cache \
    postgresql-client \
    curl \
    bash \
    tzdata \
    python3 \
    make \
    g++

# Créer un utilisateur non-root
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

WORKDIR /app

# Copier les fichiers de dépendances
COPY package*.json ./
COPY tsconfig.json ./

# Installer toutes les dépendances
RUN npm install && \
    echo "=== Vérification TypeScript ===" && \
    npx tsc --version && \
    echo "=== Contenu node_modules/.bin ===" && \
    ls -la node_modules/.bin/ | grep tsc

# Copier le code source
COPY src ./src

# Compiler TypeScript
RUN npm run build

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

# Démarrer l'application
CMD ["node", "dist/main.js"]
