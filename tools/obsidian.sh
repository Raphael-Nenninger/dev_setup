#!/usr/bin/env bash
set -euo pipefail

API_URL="https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Lese aktuelle Obsidian-Version..."
DEB_URL="$(curl -fsSL "$API_URL" | grep -oE 'https://[^"]+obsidian_[^"]+_amd64\.deb' | head -n1)"

if [[ -z "$DEB_URL" ]]; then
  echo "Fehler: Konnte keine amd64 .deb-Datei finden."
  exit 1
fi

DEB_FILE="$TMP_DIR/$(basename "$DEB_URL")"

echo "Lade herunter: $(basename "$DEB_FILE")"
curl -fL "$DEB_URL" -o "$DEB_FILE"

echo "Installiere Obsidian..."
sudo apt install -y "$DEB_FILE"

echo
echo "Fertig. Starten mit:"
echo "  obsidian"
