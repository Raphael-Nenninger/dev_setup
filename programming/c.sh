#!/usr/bin/env bash
set -euo pipefail

# Skript zum Installieren von C/C++ Toolchain auf Ubuntu 24.04

echo "==> apt update"
sudo apt update

echo "==> Basis: Compiler, Build-Tools, Debugger"
sudo apt install -y \
  build-essential \
  gcc g++ \
  gdb gdbserver \
  make \
  pkg-config \
  git \
  manpages-dev

echo "==> Moderne Build-Systeme"
sudo apt install -y \
  cmake \
  meson \
  ninja-build

echo "==> Analyse/Debugging Tools"
sudo apt install -y \
  valgrind \
  strace ltrace \
  linux-tools-common linux-tools-generic \
  lld \
  llvm

echo "==> Formatter/Linter/Static Analysis"
sudo apt install -y \
  clang \
  clang-format \
  clang-tidy \
  cppcheck

echo "==> Verify"
gcc --version | head -n 1
g++ --version | head -n 1
cmake --version | head -n 1
gdb --version | head -n 1
clang --version | head -n 1

echo "==> Done."
