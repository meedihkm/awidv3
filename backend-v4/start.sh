#!/bin/bash
set -e

echo "🚀 Starting AWID Backend..."
echo "📁 Working directory: $(pwd)"
echo "📦 Node version: $(node --version)"
echo "📦 NPM version: $(npm --version)"

echo "📂 Listing files:"
ls -la

echo "📂 Checking src directory:"
ls -la src/

echo "🔧 Starting application with tsx..."
exec npx --yes tsx src/main.ts
