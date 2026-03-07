#!/usr/bin/env bash
set -euo pipefail

echo "==> Voraussetzungen"
sudo apt update
sudo apt install -y software-properties-common ca-certificates

echo "==> (Optional) Thunderbird-Snap entfernen (falls installiert)"
if command -v snap >/dev/null 2>&1 && snap list 2>/dev/null | awk '{print $1}' | grep -qx thunderbird; then
  sudo snap remove --purge thunderbird || true
fi

echo "==> snapd blockieren (damit es nicht wieder reinkommt)"
sudo mkdir -p /etc/apt/preferences.d
sudo tee /etc/apt/preferences.d/nosnap.pref >/dev/null <<'EOF'
Package: snapd
Pin: release a=*
Pin-Priority: -10
EOF

echo "==> Mozilla Team PPA hinzufügen"
sudo add-apt-repository -y ppa:mozillateam/ppa

echo "==> PPA bevorzugen (Pinning), damit Ubuntu nicht wieder auf Snap-Transition zurückfällt"
sudo tee /etc/apt/preferences.d/thunderbird-mozillateam.pref >/dev/null <<'EOF'
Package: thunderbird*
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
EOF

echo "==> Installiere Thunderbird (DEB) aus dem PPA"
sudo apt update
sudo apt install -y thunderbird

echo "==> Verify"
apt-cache policy thunderbird | sed -n '1,30p'
thunderbird --version || true

echo "==> Done."
echo "Hinweis: Auf Ubuntu 24.04 ist das normale 'thunderbird' aus Ubuntu ein Snap-Transition-Paket; das Pinning stellt sicher, dass das PPA-DEB genommen wird."
