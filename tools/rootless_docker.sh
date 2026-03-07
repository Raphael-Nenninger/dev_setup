#!/usr/bin/env bash
set -euo pipefail

echo "==> 1) nf_tables jetzt laden + dauerhaft beim Booten aktivieren"
sudo modprobe nf_tables || true
echo nf_tables | sudo tee /etc/modules-load.d/nf_tables.conf >/dev/null

echo "==> 2) apt update + Requirements installieren"
sudo apt update
sudo apt install -y \
  uidmap \
  curl \
  ca-certificates \
  dbus-user-session \
  slirp4netns \
  fuse-overlayfs \
  iptables \
  nftables

echo "==> 3) Rootless Docker installieren"
curl -fsSL https://get.docker.com/rootless | sh

echo "==> 4) Hinweise / Next steps"
