#!/usr/bin/env bash
set -euo pipefail

# Skript zum Installieren von Rust (rustup) auf Ubuntu 24.04

echo "==> Voraussetzungen"
sudo apt update
sudo apt install -y curl ca-certificates build-essential pkg-config

echo "==> Rustup installieren (non-interaktiv)"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Rust für dieses Script sofort aktivieren
source "$HOME/.cargo/env"

echo "==> Standard-Toolchain + Komponenten"
rustup default stable
rustup component add rustfmt clippy

echo "==> Verify"
rustc --version
cargo --version
rustup --version
cargo fmt --version
cargo clippy --version || true

echo "==> Done."
echo "Hinweis: In neuen Terminals ist Rust automatisch im PATH."
echo "Im aktuellen Terminal ggf.: source ~/.cargo/env"
