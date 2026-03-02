#!/usr/bin/env bash
set -euo pipefail

echo "==> Voraussetzungen"
sudo apt update
sudo apt install -y curl ca-certificates gpg

echo "==> (Optional) Firefox-Snap entfernen (falls installiert)"
if command -v snap >/dev/null 2>&1 && snap list 2>/dev/null | awk '{print $1}' | grep -qx firefox; then
  sudo snap remove --purge firefox || true
fi

echo "==> (Optional) Ubuntu-Transition-Paket entfernen (falls vorhanden)"
# Falls firefox als "1:1snap1-..." installiert war, entfernen wir es.
sudo apt remove -y firefox || true

echo "==> Mozilla APT Repo Key installieren"
sudo install -d -m 0755 /etc/apt/keyrings
curl -fsSL https://packages.mozilla.org/apt/repo-signing-key.gpg \
  | sudo gpg --dearmor -o /etc/apt/keyrings/packages.mozilla.org.gpg

# (Optional) Fingerprint check (Mozilla nennt den erwarteten Fingerprint)
gpg --show-keys --with-fingerprint /etc/apt/keyrings/packages.mozilla.org.gpg | sed -n '1,12p'

echo "==> Mozilla Repo hinzufügen (deb822 .sources)"
sudo tee /etc/apt/sources.list.d/mozilla.sources >/dev/null <<'EOF'
Types: deb
URIs: https://packages.mozilla.org/apt
Suites: mozilla
Components: main
Signed-By: /etc/apt/keyrings/packages.mozilla.org.gpg
EOF

echo "==> Pinning setzen (Mozilla-Repo bevorzugen)"
sudo mkdir -p /etc/apt/preferences.d
sudo tee /etc/apt/preferences.d/mozilla-firefox.pref >/dev/null <<'EOF'
Package: firefox*
Pin: origin packages.mozilla.org
Pin-Priority: 1001
EOF

echo "==> Update + Firefox installieren (DEB)"
sudo apt update
sudo apt install -y firefox

echo "==> (Optional) deutsches Language Pack"
# Liste: apt-cache search firefox-l10n
sudo apt install -y firefox-l10n-de || true

echo "==> Verify"
apt-cache policy firefox | sed -n '1,30p'
firefox --version || true

echo "==> Done."
