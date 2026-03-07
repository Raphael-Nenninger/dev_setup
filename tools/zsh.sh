#!/usr/bin/env bash
set -euo pipefail

# Zsh + Oh My Zsh Install-Skript (Ubuntu)
echo "===> apt update + zsh installieren"
sudo apt update
sudo apt install -y zsh curl git

echo "===> Standard-Shell für aktuellen User auf zsh setzen"
ZSH_PATH="$(command -v zsh)"
if [[ -z "${ZSH_PATH}" ]]; then
	echo "zsh nicht gefunden - Abbruch."
	exit 1
fi

chsh -s "$ZSH_PATH" "$USER" || true

echo "===> Oh My Zsh installieren"
# Unattended, damit das Script nicht in einer Zsh-Shell wechselt
export RUNZSH=no
export CHSH=no
export KEEP_ZSHRC=yes

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "==> Done."
echo "Wichtig: Damit die neue Shell greift, einmal ab- und wieder anmelden oder Terminal neu öffnen."
