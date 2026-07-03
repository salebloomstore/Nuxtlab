#!/bin/bash

# =====================================================
# NUXTJS BOOTSTRAP SCRIPT
# =====================================================
# tail -f /dev/null

# =========================
# BUILD
# =========================

echo "📦 Installing dependencies..."
pnpm ci

echo "📦 Building project..."
pnpm run build

# =========================
# RUN
# =========================

echo "🚀 Starting NestJS..."
PORT=${PORT_OF_NUXTJS} node .output/server/index.mjs
