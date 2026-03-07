#!/usr/bin/env bash
set -euo pipefail

# Alacritty installieren (APT) auf Ubuntu 24.04

echo "==> apt update"
sudo apt update

echo "==> Universe aktivieren (falls noch nicht aktiv)"
sudo apt install -y software-properties-common
sudo add-apt-repository -y universe

echo "==> alacritty installieren"
sudo apt update
sudo apt install -y alacritty

echo "==> Verify"
alacritty --version

echo "==> Done."
