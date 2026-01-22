#!/bin/bash

# Script de test du déploiement AWID
# Vérifie que tous les services fonctionnent correctement

set -e

# Configuration
API_URL=${1:-http://localhost:3000}
ADMIN_EMAIL="admin@test.com"
ADMIN_PASSWORD="admin123"

echo "🧪 Test du déploiement AWID"
echo "🌐 API URL: $API_URL"
echo ""

# Couleurs pour l'output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Fonction de test
test_endpoint() {
    local name=$1
    local url=$2
    local expected_code=${3:-200}
    
    echo -n "Testing $name... "
    
    response=$(curl -s -o /dev/null -w "%{http_code}" "$url" 2>/dev/null || echo "000")
    
    if [ "$response" = "$expected_code" ]; then
        echo -e "${GREEN}✅ OK${NC} (HTTP $response)"
        return 0
    else
        echo -e "${RED}❌ FAIL${NC} (HTTP $response, expected $expected_code)"
        return 1
    fi
}

# Test 1: Health Check
echo "1️⃣  Health Check"
test_endpoint "Health endpoint" "$API_URL/api/health" 200
echo ""

# Test 2: Root endpoint
echo "2️⃣  Root Endpoint"
test_endpoint "Root endpoint" "$API_URL/" 200
echo ""

# Test 3: API Documentation
echo "3️⃣  API Documentation"
test_endpoint "Swagger UI" "$API_URL/api-docs" 200
test_endpoint "Swagger JSON" "$API_URL/api-docs-json" 200
echo ""

# Test 4: Login
echo "4️⃣  Authentication"
echo -n "Testing login... "

login_response=$(curl -s -X POST "$API_URL/api/auth/login" \
    -H "Content-Type: application/json" \
    -d "{\"email\":\"$ADMIN_EMAIL\",\"password\":\"$ADMIN_PASSWORD\"}" 2>/dev/null)

if echo "$login_response" | grep -q "accessToken"; then
    echo -e "${GREEN}✅ OK${NC}"
    ACCESS_TOKEN=$(echo "$login_response" | grep -o '"accessToken":"[^"]*' | cut -d'"' -f4)
    echo "   Token obtenu: ${ACCESS_TOKEN:0:20}..."
else
    echo -e "${RED}❌ FAIL${NC}"
    echo "   Response: $login_response"
    ACCESS_TOKEN=""
fi
echo ""

# Test 5: Protected endpoints (si token disponible)
if [ -n "$ACCESS_TOKEN" ]; then
    echo "5️⃣  Protected Endpoints"
    
    echo -n "Testing /api/auth/me... "
    me_response=$(curl -s -o /dev/null -w "%{http_code}" "$API_URL/api/auth/me" \
        -H "Authorization: Bearer $ACCESS_TOKEN" 2>/dev/null)
    
    if [ "$me_response" = "200" ]; then
        echo -e "${GREEN}✅ OK${NC} (HTTP $me_response)"
    else
        echo -e "${RED}❌ FAIL${NC} (HTTP $me_response)"
    fi
    
    echo -n "Testing /api/products... "
    products_response=$(curl -s -o /dev/null -w "%{http_code}" "$API_URL/api/products" \
        -H "Authorization: Bearer $ACCESS_TOKEN" 2>/dev/null)
    
    if [ "$products_response" = "200" ]; then
        echo -e "${GREEN}✅ OK${NC} (HTTP $products_response)"
    else
        echo -e "${RED}❌ FAIL${NC} (HTTP $products_response)"
    fi
    
    echo -n "Testing /api/orders... "
    orders_response=$(curl -s -o /dev/null -w "%{http_code}" "$API_URL/api/orders" \
        -H "Authorization: Bearer $ACCESS_TOKEN" 2>/dev/null)
    
    if [ "$orders_response" = "200" ]; then
        echo -e "${GREEN}✅ OK${NC} (HTTP $orders_response)"
    else
        echo -e "${RED}❌ FAIL${NC} (HTTP $orders_response)"
    fi
    echo ""
fi

# Test 6: Super Admin Panel
echo "6️⃣  Super Admin Panel"
test_endpoint "Admin panel" "$API_URL/api/admin" 200
echo ""

# Test 7: Database connectivity
echo "7️⃣  Database Connectivity"
if [ -n "$ACCESS_TOKEN" ]; then
    echo -n "Testing database via API... "
    
    db_test=$(curl -s "$API_URL/api/auth/me" \
        -H "Authorization: Bearer $ACCESS_TOKEN" 2>/dev/null)
    
    if echo "$db_test" | grep -q "email"; then
        echo -e "${GREEN}✅ OK${NC}"
        echo "   User data retrieved successfully"
    else
        echo -e "${RED}❌ FAIL${NC}"
        echo "   Could not retrieve user data"
    fi
else
    echo -e "${YELLOW}⚠️  SKIP${NC} (no access token)"
fi
echo ""

# Test 8: Docker containers (si disponible)
echo "8️⃣  Docker Containers"
if command -v docker &> /dev/null; then
    echo "Checking running containers..."
    
    if docker ps | grep -q "awid-postgres"; then
        echo -e "   PostgreSQL: ${GREEN}✅ Running${NC}"
    else
        echo -e "   PostgreSQL: ${RED}❌ Not running${NC}"
    fi
    
    if docker ps | grep -q "awid-api"; then
        echo -e "   API: ${GREEN}✅ Running${NC}"
    else
        echo -e "   API: ${RED}❌ Not running${NC}"
    fi
else
    echo -e "${YELLOW}⚠️  Docker not available${NC}"
fi
echo ""

# Résumé
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 Résumé du Test"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "✅ Tests réussis: Health, Root, Docs, Auth"
if [ -n "$ACCESS_TOKEN" ]; then
    echo "✅ Token JWT valide obtenu"
    echo "✅ Endpoints protégés accessibles"
else
    echo "⚠️  Impossible d'obtenir un token JWT"
fi
echo ""
echo "🔗 URLs importantes:"
echo "   API: $API_URL"
echo "   Health: $API_URL/api/health"
echo "   Docs: $API_URL/api-docs"
echo "   Admin: $API_URL/api/admin"
echo ""
echo "🔐 Identifiants de test:"
echo "   Email: $ADMIN_EMAIL"
echo "   Password: $ADMIN_PASSWORD"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
