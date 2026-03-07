#!/usr/bin/env bash
set -eou pipefail

# Installiere KVM/QEMU + libvirt + virt-manager auf Ubuntu
#
echo "===> apt update"
sudo apt update

echo "===> cpu-checker + Virtualisierungspakete installieren"
sudo apt install -y \
  cpu-checker \
  qemu-kvm virt-manager virtinst \
  libvirt-clients libvirt-daemon-system \
  bridge-utils

echo "===> libvirtd aktivieren und starten"
sudo systemctl enable --now libvirtd

echo "==> User zu Gruppen hinzufügen (kvm, libvirt)"
sudo usermod -aG kvm "$USER"
sudo usermod -aG libvirt "$USER"

echo "==> Check"
kvm-ok || true
id -nG "$USER" | tr ' ' '\n' | grep -E '^(kvm|libvirt)$' || true

echo "==> Done."
echo "Wichtig: Damit die Gruppenrechte greifen, einmal ab- und wieder anmelden (oder neu starten)."
