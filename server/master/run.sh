#!/bin/bash

# =====================================================
# NUXTJS BOOTSTRAP SCRIPT
# =====================================================
# tail -f /dev/null

# =========================
# BUILD
# =========================

echo "📦 Installing dependencies..."
npm ci

echo "📦 Building project..."
npm run build

# =========================
# RUN
# =========================

echo "🚀 Starting NestJS..."
npm run start:prod
