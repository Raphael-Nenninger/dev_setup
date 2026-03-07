#!/usr/bin/env bash
set -euo pipefail

# Tmux installieren (Ubuntu 24.04)

echo "==> apt update"
sudo apt update

echo "==> tmux installieren"
sudo apt install -y tmux

echo "==> optional: nützliche Tools"
sudo apt install -y xclip fzf git || true

echo "==> Verify"
tmux -V

echo "==> Cloning Tmux Plugin Manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "==> Done."
