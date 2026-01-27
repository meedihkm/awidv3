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

echo "📂 Checking if main.ts exists:"
if [ -f "src/main.ts" ]; then
    echo "✅ src/main.ts found"
else
    echo "❌ src/main.ts NOT found"
    exit 1
fi

echo "🔧 Starting application with tsx..."
echo "Command: npx --yes tsx src/main.ts"

# Run with explicit error handling and output
npx --yes tsx src/main.ts 2>&1 | tee /app/logs/startup.log || {
    EXIT_CODE=$?
    echo ""
    echo "❌ Application crashed with exit code $EXIT_CODE"
    echo "📋 Showing startup log:"
    cat /app/logs/startup.log 2>/dev/null || echo "No startup log found"
    echo ""
    echo "📋 Showing last 50 lines of other logs if any:"
    tail -n 50 /app/logs/*.log 2>/dev/null || echo "No other log files found"
    exit $EXIT_CODE
}
