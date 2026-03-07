#!/usr/bin/env bash
set -euo pipefail

echo "==> apt update"
sudo apt update

echo "==> i3 + Basics installieren"
sudo apt install -y \
  i3-wm i3status i3lock xss-lock \
  dmenu \
  xterm \
  feh \
  picom \
  pulseaudio-utils pavucontrol \
  network-manager-gnome \
  fonts-dejavu \
  flameshot \
  dunst

echo "==> Optional (empfohlen): Terminal + Launcher"
sudo apt install -y \
  alacritty \
  rofi

echo "==> Done."
echo "Login: Beim Anmeldebildschirm Session 'i3' auswählen."
echo "Beim ersten Start kannst du die i3-Konfig erzeugen lassen."sudo apt install -y sway swaybg swayidle swaylock waybar wofi
