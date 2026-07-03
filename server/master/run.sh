#!/bin/bash

# =====================================================
# NUXTJS BOOTSTRAP SCRIPT
# =====================================================
# tail -f /dev/null

# =========================
# BUILD
# =========================

echo "📦 Installing dependencies..."
pnpm install --frozen-lockfile

echo "📦 Building project..."
pnpm run build

echo "📂 Checking build output..."
ls -la
ls -la .output || true
ls -la .output/server || true

# =========================
# RUN
# =========================

echo "🚀 Starting NestJS..."
PORT=${PORT_OF_NUXTJS} node .output/server/index.mjs
