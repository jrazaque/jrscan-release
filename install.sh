#!/data/data/com.termux/files/usr/bin/bash

set -e

ZIP_URL="https://github.com/jrazaque/jrscan-release/releases/download/v2.1.0/JR_Script_V2.1.0_hwid.dist.zip"
ZIP_FILE="$HOME/jrscan.zip"
INSTALL_DIR="$HOME/.jrscript"
DIST_DIR="JR_Script_V2.1.0_hwid.dist"
BIN_NAME="JR_Script_V2.1.0_hwid"
COMMAND_NAME="jrscanv2"

echo ""
echo "=================================="
echo "   JR Script V2.1.0 Installer"
echo "=================================="
echo ""

echo "[+] Installing requirements..."
pkg install wget unzip -y

echo "[+] Downloading JR Script V2.1.0..."
rm -f "$ZIP_FILE"
wget -O "$ZIP_FILE" "$ZIP_URL"

echo "[+] Extracting files..."
cd "$HOME"
rm -rf "$DIST_DIR" "$INSTALL_DIR"
unzip -o "$ZIP_FILE"

echo "[+] Installing files..."
mkdir -p "$INSTALL_DIR"
cp -a "$DIST_DIR"/. "$INSTALL_DIR"/

echo "[+] Setting permissions..."
chmod 755 "$INSTALL_DIR/$BIN_NAME"

echo "[+] Creating jrscanv2 command..."

cat > "$PREFIX/bin/$COMMAND_NAME" << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
export LD_LIBRARY_PATH="$HOME/.jrscript:$PREFIX/lib:$LD_LIBRARY_PATH"
cd "$HOME/.jrscript"
exec ./JR_Script_V2.1.0_hwid "$@"
EOF

chmod 755 "$PREFIX/bin/$COMMAND_NAME"

echo "[+] Cleaning temporary files..."
rm -f "$ZIP_FILE"
rm -rf "$HOME/$DIST_DIR"

echo ""
echo "=================================="
echo "  JR Script V2.1.0 Installed!"
echo "=================================="
echo ""
echo "Run the tool with:"
echo ""
echo "  jrscanv2"
echo ""
