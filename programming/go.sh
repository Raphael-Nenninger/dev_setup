#!/usr/bin/env bash
set -euo pipefail

GO_VERSION="1.26.0"
ARCHIVE="go${GO_VERSION}.linux-amd64.tar.gz"
URL="https://go.dev/dl/${ARCHIVE}"
INSTALL_DIR="/usr/local"
GO_DIR="${INSTALL_DIR}/go"
PROFILE="$HOME/.profile"

echo "==> Download: $URL"
curl -fL -o "$ARCHIVE" "$URL"

echo "==> Install to $GO_DIR (needs sudo)"
sudo rm -rf "$GO_DIR"
sudo tar -C "$INSTALL_DIR" -xzf "$ARCHIVE"

echo "==> Ensure PATH in $PROFILE"
# Zeile dauerhaft in ~/.profile eintragen (nur einmal)
LINE='export PATH="$PATH:/usr/local/go/bin"'
touch "$PROFILE"
grep -qxF "$LINE" "$PROFILE" || {
  printf '\n# Go\n%s\n' "$LINE" >> "$PROFILE"
  echo "    Added to $PROFILE"
}

# Für dieses Script sofort aktivieren
export PATH="$PATH:/usr/local/go/bin"

echo "==> Verify"
go version

echo "==> Done."
echo "Hinweis: In einem neuen Terminal ist PATH automatisch gesetzt. Im aktuellen Terminal: source ~/.profile"
