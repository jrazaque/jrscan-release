#!/data/data/com.termux/files/usr/bin/bash
set -e
echo "[*] JR Script V2.0.0 Installer"
pkg install wget unzip -y 2>/dev/null || true
cd /sdcard/Download
ZIP_URL="https://github.com/jrazaque/jrscan-release/releases/download/v2.0.0/JR_Script_V2.0.0_locked.dist.zip"
echo "[*] Downloading..."
wget -O jrscan.zip "$ZIP_URL"
unzip -o jrscan.zip
rm -rf "$HOME/.jrscript"
mkdir -p "$HOME/.jrscript"
cp -a JR_Script_V2.0.0_locked.dist/. "$HOME/.jrscript/"
chmod 755 "$HOME/.jrscript/JR_Script_V2.0.0_locked.bin"
cat > "$PREFIX/bin/jrscanv2" << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
export LD_LIBRARY_PATH=$HOME/.jrscript:$PREFIX/lib:$LD_LIBRARY_PATH
cd $HOME/.jrscript
exec ./JR_Script_V2.0.0_locked.bin "$@"
EOF
chmod 755 "$PREFIX/bin/jrscanv2"
echo "[+] Done! Run: jrscanv2"
echo "[+] Key from @jrazaque"
