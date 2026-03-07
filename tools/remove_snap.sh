#!/usr/bin/env bash
set -euo pipefail

echo "==> 0) Zeige installierte Snaps (falls vorhanden)"
if command -v snap >/dev/null 2>&1; then
  snap list || true
else
  echo "snap ist nicht installiert."
fi

echo "==> 1) Snaps entfernen (wenn snap vorhanden ist)"
if command -v snap >/dev/null 2>&1; then
  # Häufige Default-Snaps zuerst entfernen (ignoriert Fehler, falls nicht vorhanden)
  sudo snap remove --purge firefox 2>/dev/null || true
  sudo snap remove --purge snap-store 2>/dev/null || true
  sudo snap remove --purge gnome-3-38-2004 2>/dev/null || true
  sudo snap remove --purge gtk-common-themes 2>/dev/null || true
  sudo snap remove --purge bare 2>/dev/null || true
  sudo snap remove --purge core20 2>/dev/null || true
  sudo snap remove --purge core22 2>/dev/null || true
  sudo snap remove --purge snapd 2>/dev/null || true

  # Restliche Snaps (falls noch welche übrig sind)
  while read -r name _; do
    [[ "$name" == "Name" ]] && continue
    sudo snap remove --purge "$name" || true
  done < <(snap list || true)
fi

echo "==> 2) snapd purgen + Reste entfernen"
sudo apt update
sudo apt autoremove -y --purge snapd || true
sudo apt purge -y snapd || true

sudo rm -rf /snap /var/snap /var/lib/snapd /var/cache/snapd ~/snap || true

echo "==> 3) snapd per APT pinnen (damit es nicht wieder reinkommt)"
sudo mkdir -p /etc/apt/preferences.d
sudo tee /etc/apt/preferences.d/nosnap.pref >/dev/null <<'EOF'
# Prevent snapd from being installed by APT.
# (Pattern used by Linux Mint and commonly recommended.)
Package: snapd
Pin: release a=*
Pin-Priority: -10
EOF

