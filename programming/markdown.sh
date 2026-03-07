#!/usr/bin/env bash
set -euo pipefail

# Skript zum Installieren von Markdown-Tools auf Ubuntu 24.04

echo "==> apt update"
sudo apt update

echo "==> Markdown CLI-Tools installieren (Preview + Konvertierung + Lint)"
sudo apt install -y \
  pandoc \
  cmark-gfm \
  markdownlint

echo "==> glow hinzufügen"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install glow

echo "==> Verify"
pandoc --version | head -n 1
glow --version
cmark-gfm --version
mdl --version
