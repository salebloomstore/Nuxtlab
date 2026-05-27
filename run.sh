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

# cat > .env << EOF
# NESTJS_WEBAPI_IO_DATA=${NESTJS_WEBAPI_IO_DATA}
# EOF

# =========================
# BUILD
# =========================

echo "📦 Installing dependencies..."
npm install

echo "📦 Building project..."
npm run build

# =========================
# RUN
# =========================

echo "🚀 Starting NuxtJS..."
node .output/server/index.mjs
