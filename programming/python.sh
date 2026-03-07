#!/usr/bin/env bash
set -euo pipefail

# Skript zum Installieren von Python + nützlichen Python-Paketen (APT) auf Ubuntu 24.04

echo "==> apt update"
sudo apt update

echo "==> Basis: python3 + venv + pip + build tools"
sudo apt install -y \
  python3 python3-venv python3-pip \
  build-essential pkg-config \
  python3-dev

echo "==> Python-Pakete (APT) installieren"
sudo apt install -y \
  python3-numpy python3-scipy python3-pandas python3-matplotlib \
  python3-requests python3-urllib3 python3-lxml python3-bs4 \
  python3-cryptography python3-openssl python3-paramiko \
  python3-psycopg2 python3-sqlalchemy \
  python3-aiohttp python3-celery \
  python3-openpyxl python3-yaml python3-tqdm python3-tabulate \
  python3-pil python3-dateutil

echo "==> Verify"
python3 --version
python3 -m pip --version

echo "==> Done."
