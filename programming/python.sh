#!/usr/bin/sh
#
# Skript zum installieren von Python
sudo apt update
sudo apt install \
  python3-numpy python3-scipy python3-pandas python3-matplotlib \
  python3-requests python3-urllib3 python3-lxml python3-bs4 \
  python3-cryptography python3-openssl python3-paramiko \
  python3-psycopg2 python3-sqlalchemy \
  python3-aiohttp python3-celery \
  python3-openpyxl python3-yaml python3-tqdm python3-tabulate \
  python3-pil python3-dateutil
