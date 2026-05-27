#!/bin/bash

# =====================================================
# NUXTJS BOOTSTRAP SCRIPT
# =====================================================
# tail -f /dev/null
set -e
source /var/www/cache/.env

cd /var/www/app

# cat > .env << EOF
# NESTJS_WEBAPI_IO_DATA=${NESTJS_WEBAPI_IO_DATA}
# EOF


# =========================
# BUILD + RUN
# =========================

echo "📦 Installing dependencies..."
npm install

echo "📦 Building project..."

npm run build

echo "🚀 Starting NuxtJS..."

node .output/server/index.mjs
