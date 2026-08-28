---

### 2) install.sh

```bash
#!/data/data/com.termux/files/usr/bin/bash
set -e

ZIP_URL="https://github.com/jrazaque/jrscan-release/releases/download/v2.0.0/JR_Script_V2.1.0_hwid.dist.zip"
DIST_DIR="JR_Script_V2.1.0_hwid.dist"
BIN_NAME="JR_Script_V2.1.0_hwid.bin"

echo "JR Script V2.1.0 — Installing..."

pkg install wget unzip -y >/dev/null 2>&1 || true

cd /sdcard/Download
wget -O jrscan.zip "$ZIP_URL"
unzip -o jrscan.zip
rm -rf "$HOME/.jrscript"
mkdir -p "$HOME/.jrscript"
cp -a "$DIST_DIR"/. "$HOME/.jrscript/"
chmod 755 "$HOME/.jrscript/$BIN_NAME"

cat > "$PREFIX/bin/jrscanv2" << EOF
#!/data/data/com.termux/files/usr/bin/bash
export LD_LIBRARY_PATH=\$HOME/.jrscript:\$PREFIX/lib:\$LD_LIBRARY_PATH
cd \$HOME/.jrscript
exec ./$BIN_NAME "\$@"
EOF
chmod 755 "$PREFIX/bin/jrscanv2"

echo "Done. Run: jrscanv2"
