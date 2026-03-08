#!/usr/bin/env bash

set -euo pipefail

echo "==> Install password quality checking library"
sudo apt -y install libpam-pwquality
