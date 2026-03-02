#!/usr/bin/env bash
set -euo pipefail

# Skript zum Installieren von Bash/Shell-Tools auf Ubuntu 24.04

echo "==> apt update"
sudo apt update

echo "==> Shell-Tooling installieren (Lint, Format, Completions, Docs)"
sudo apt install -y \
  bash \
  shellcheck \
  shfmt \
  bash-completion \
  command-not-found \
  man-db \
  tldr

echo "==> Optional (nützlich): Git + Fuzzy Finder + Autocomplete"
sudo apt install -y \
  git \
  fzf

echo "==> Enable command-not-found Datenbank (falls nötig)"
sudo apt update -y || true

echo "==> Verify"
bash --version | head -n 1
shellcheck --version | head -n 2
shfmt -version
fzf --version || true

echo "==> Done."
