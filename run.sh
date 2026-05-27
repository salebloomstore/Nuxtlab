#!/bin/bash

# =====================================================
# NUXTJS BOOTSTRAP SCRIPT
# =====================================================
# tail -f /dev/null
set -e
source /var/www/cache/.env

# =========================
# ALWAYS ENSURE ENV
# =========================

cd /var/www/app

echo "🔧 Ensuring .env..."

cat > .env << EOF
NESTJS_WEBAPI_IO_DATA=${NESTJS_WEBAPI_IO_DATA}
EOF

# =========================
# BUILD
# =========================

echo "📦 Installing pnpm..."
npm install -g pnpm@11.1.3

echo "📦 Installing dependencies..."
pnpm install

echo "📦 Building project..."
pnpm run build

# =========================
# RUN
# =========================

echo "🚀 Starting NuxtJS..."
node .output/server/index.mjs
