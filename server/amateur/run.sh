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

# =========================
# RUN
# =========================

echo "🚀 Starting NuxtJS..."
PORT=${PORT_OF_NUXTJS} pnpm run dev
