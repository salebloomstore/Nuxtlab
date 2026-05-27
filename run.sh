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

cat > .env << EOF
NESTJS_WEBAPI_IO_DATA=${NESTJS_WEBAPI_IO_DATA}
EOF

# =========================
# BUILD
# =========================

echo "📦 Installing dependencies..."

# TypeScript toolchain
npm install -D typescript@5.9.3 ts-node@10.9.2 @types/node@24.12.4
npm install nuxt@4.4.6

npm install

echo "📦 Building project..."
npm run build

# =========================
# RUN
# =========================

echo "🚀 Starting NuxtJS..."
node .output/server/index.mjs
