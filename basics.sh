#!/usr/bin/env bash
set -eou pipefail

echo "==> Basic Programms for installing"
sudo apt update
sudo apt install git curl fzf 

echo "==> Führe Dateien in programming aus"
for file in programming/*; do
	if [[ -f "$file" && -x "$file" ]]; then 
		echo "Führe aus: $file"
		"$file"
	fi
done


echo "==> Führe Dateien in tools aus"
for file in tools/*; do
	if [[ -f "$file" && -x "$file" ]]; then 
		echo "Führe aus: $file"
		"$file"
	fi
done

echo "==> Dateien aus env nach ~/.config kopieren"
mkdir -p ~/.config
cp -r env/* ~/.config

echo "==> Fertig"
