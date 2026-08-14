#!/data/data/com.termux/files/usr/bin/bash

set -e

REPO="jrazaque/jrscan-release"
VERSION="v1.0.0"
ASSET="jrscan-aarch64"
URL="https://github.com/$REPO/releases/download/$VERSION/$ASSET"
INSTALL_DIR="${PREFIX:-/data/data/com.termux/files/usr}/bin"
TMP_FILE="$(mktemp)"

echo "[*] Downloading JRSCAN $VERSION..."

curl -fL --progress-bar "$URL" -o "$TMP_FILE"

chmod 755 "$TMP_FILE"
mv "$TMP_FILE" "$INSTALL_DIR/jrscan"

echo
echo "[+] JRSCAN installed successfully!"
echo "[+] Location: $INSTALL_DIR/jrscan"
echo
echo "Run:"
echo "  jrscan --help"
