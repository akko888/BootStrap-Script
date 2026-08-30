#!/usr/bin/env bash

set -e

PROJECT_NAME="remzero"

sudo rm -rf "/usr/local/lib/$PROJECT_NAME"
sudo rm -f "/usr/local/bin/$PROJECT_NAME"

echo "[SUCCESS] Uninstalled $PROJECT_NAME"