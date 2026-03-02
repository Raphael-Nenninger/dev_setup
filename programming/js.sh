#!/usr/bin/env bash
set -euo pipefail

# Skript zum Installieren von JavaScript/Node.js Tooling auf Ubuntu 24.04

echo "==> apt update"
sudo apt update

echo "==> Node.js + npm + Build-Tools"
sudo apt install -y \
  nodejs npm \
  build-essential

echo "==> Corepack aktivieren (für yarn/pnpm über Node)"
# Auf manchen Ubuntu-Setups ist corepack dabei, auf manchen nicht – daher tolerant:
if command -v corepack >/dev/null 2>&1; then
  corepack enable
fi

echo "==> Globale Dev-Tools (TypeScript, ESLint, Prettier)"
sudo npm install -g \
  typescript ts-node \
  eslint prettier \
  npm-check-updates

echo "==> Verify"
node --version
npm --version
tsc --version
eslint --version
prettier --version
ncu --version

echo "==> Done."
