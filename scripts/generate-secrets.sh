#!/bin/bash

# ============================================
# GÉNÉRATEUR DE SECRETS POUR AWID LIVRAISON
# ============================================
# Ce script génère tous les secrets nécessaires

echo "🔐 Génération des secrets pour AWID Livraison..."
echo ""
echo "============================================"
echo ""

# Générer DB_PASSWORD
DB_PASSWORD=$(openssl rand -base64 32 | tr -d "=+/" | cut -c1-32)
echo "📦 DB_PASSWORD (PostgreSQL):"
echo "$DB_PASSWORD"
echo ""

# Générer JWT_SECRET
JWT_SECRET=$(openssl rand -hex 64)
echo "🔑 JWT_SECRET (64 caractères):"
echo "$JWT_SECRET"
echo ""

# Générer SUPER_ADMIN_KEY
SUPER_ADMIN_KEY=$(openssl rand -hex 32)
echo "👑 SUPER_ADMIN_KEY (32 caractères):"
echo "$SUPER_ADMIN_KEY"
echo ""

echo "============================================"
echo ""
echo "✅ Secrets générés avec succès !"
echo ""
echo "📋 PROCHAINES ÉTAPES :"
echo ""
echo "1. Copier ces valeurs dans Coolify :"
echo "   - Aller dans votre projet > Environment"
echo "   - Ajouter ces 3 variables"
echo ""
echo "2. Ou créer un fichier .env.local :"
echo ""
echo "cat > .env.local << EOF"
echo "DB_PASSWORD=$DB_PASSWORD"
echo "JWT_SECRET=$JWT_SECRET"
echo "SUPER_ADMIN_KEY=$SUPER_ADMIN_KEY"
echo "EOF"
echo ""
echo "⚠️  IMPORTANT : Sauvegarder ces secrets dans un endroit sûr !"
echo ""
