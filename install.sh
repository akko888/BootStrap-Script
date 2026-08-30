#!/usr/bin/env bash

set -e

PROJECT_NAME="remzero"
INSTALL_LIB_DIR="/usr/local/lib/$PROJECT_NAME"
INSTALL_BIN_LINK="/usr/local/bin/$PROJECT_NAME"

echo "[INFO] Installing $PROJECT_NAME ..."

if [ ! -d "bin" ] || [ ! -d "lib" ]; then
    echo "[ERROR] You must run this script from project's root" 
    exit 1
fi

if [ -d "$INSTALL_LIB_DIR" ]; then
    echo "[WARNING] Existing installation found. Overwriting..."
fi

echo "[INFO] CREATING DIRECTORY AT $INSTALL_LIB_DIR"
sudo mkdir -p "$INSTALL_LIB_DIR"

echo "[INFO] COPYING FILES..."
sudo cp -r bin "$INSTALL_LIB_DIR"
sudo cp -r lib "$INSTALL_LIB_DIR"

sudo chmod +x "$INSTALL_LIB_DIR/bin/main.sh"

echo "[INFO] CREATING COMMAND: $INSTALL_BIN_LINK"
sudo ln -sf "$INSTALL_LIB_DIR/bin/main.sh" "$INSTALL_BIN_LINK"

echo "[SUCCESS] INSTALLED SUCCESSFULLY!"
echo "You can run now"
echo "$PROJECT_NAME -n MyProject -r /path -l cpp" 