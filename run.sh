#!/bin/bash

# =====================================================
# NUXTJS BOOTSTRAP SCRIPT
# =====================================================

set -e
source /var/www/cache/.env

cd /var/www

echo "🚀 Checking NuxtJS project..."

# =====================================================
# CREATE PROJECT FIRST TIME
# =====================================================
if [ ! -f app/package.json ]; then
  echo "📦 Creating Nuxt project..."

  printf "y\nui\n0\n0\ny\nn\n" | npm create nuxt@latest app

  cd app

  echo "📄 Creating env..."

#   cat > .env << EOF
# NESTJS_WEBAPI_IO_DATA=${NESTJS_WEBAPI_IO_DATA}
# EOF

  echo "📄 Fixing nuxt.config..."

#   cat > nuxt.config.ts << 'EOF'
# export default defineNuxtConfig({
#   ssr: true,

#   runtimeConfig: {
#     public: {
#       apiBase: process.env.NESTJS_WEBAPI_IO_DATA
#     }
#   }
# })
# EOF

  echo "✅ Project created"
fi


# =========================
# ALWAYS ENSURE ENV
# =========================

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
