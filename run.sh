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

  npx nuxi@latest init app --template minimal --package-manager npm --no-git

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

npm run start:prod
