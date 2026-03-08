#!/usr/bin env bash
set -euo pipefail

APP_DIR="$HOME/.local/share/applications"
DESKTOP_FILE="$APP_DIR/ubuntu-settings-i3.desktop"

mkdir -p "$APP_DIR"

cat > "$DESKTOP_FILE" <<'EOF'
[Desktop Entry]
Type=Application
Version=1.0
Name=Ubuntu Settings
Name[de]=Ubuntu Einstellungen
Comment=Open Ubuntu Settings from i3/rofi
Comment[de]=Ubuntu-Einstellungen aus i3/rofi öffnen
Exec=env XDG_CURRENT_DESKTOP=GNOME gnome-control-center
Icon=preferences-system
Terminal=false
Categories=Settings;DesktopSettings;GNOME;
StartupNotify=true
EOF

chmod 644 "$DESKTOP_FILE"

echo "Desktop-Eintrag erstellt:"
echo "  $DESKTOP_FILE"
