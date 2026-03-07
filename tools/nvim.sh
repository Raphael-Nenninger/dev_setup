#!/usr/bin/env bash
#
set -euo pipefail

echo "===> 1: Installing build prerequisities"
sudo apt install ninja-build gettext cmake curl build-essential git
sudo apt install make gcc ripgrep fd-find tree-sitter-cli unzip git xclip
echo "===> 2: nvim git clonen"
git clone https://github.com/neovim/neovim
cd neovim
echo "===> 3: Changing to last stable release"
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo

echo "===> 4: Compiling"
sudo make install

nvim --version



