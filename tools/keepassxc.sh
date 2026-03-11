#!/usr/bin/env bash

set -eou pipefail 

echo "==> Update"
sudo apt update

echo "==> Installing KeepassXC"
sudo add-apt-repository ppa:phoerious/keepassxc
sudo apt update
sudo apt install keepassxc
