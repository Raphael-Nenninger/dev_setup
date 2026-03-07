#!/usr/bin/env bash
set -eou pipefail

# Latex Setup (Tex Lilve + Extras + Texmaker) für Ubuntu

echo "===> apt update"
sudo apt update

echo "===> LaTeX Pakete installieren"
sudo apt-get install -y \
  texlive \
  texlive-bibtex-extra \
  texlive-extra-utils \
  texlive-humanities \
  texlive-lang-german \
  texlive-publishers \
  texmaker
sudo apt install zathura
echo "==> Verify"
pdflatex --version | head -n 1
bibtex --version | head -n 1
texmaker --version || true

echo "==> Done."
