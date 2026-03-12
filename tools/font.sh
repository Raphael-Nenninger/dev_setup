#!/usr/bin/env bash

set -eou pipefail

mkdir -p ~/.local/share/fonts/IosevkaTermNerdFont
cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IosevkaTerm.zip
unzip -o IosevkaTerm.zip -d ~/.local/share/fonts/IosevkaTermNerdFont
fc-cache -fv
