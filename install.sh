#!/data/data/com.termux/files/usr/bin/bash
set -e
echo "[*] JR Script V2.0.0 Installer"
pkg install wget unzip -y 2>/dev/null || true

cd /sdcard/Download

ZIP_URL="https://github.com/jrazaque/jrscan-release/releases/download/v2.0.0/JR_Script_V2.0.0.dist.zip"

echo "[*] Downloading..."
wget -O jrscan.zip "$ZIP_URL"

echo "[*] Extracting..."
unzip -o jrscan.zip

if [ ! -d "JR_Script_V2.0.0.dist" ]; then
  echo "[!] JR_Script_V2.0.0.dist folder not found inside zip"
  exit 1
fi

echo "[*] Installing..."
rm -rf "$HOME/JR_Script_V2.0.0.dist"
cp -r JR_Script_V2.0.0.dist "$HOME/"
chmod +x "$HOME/JR_Script_V2.0.0.dist/JR_Script_V2.0.0.bin"

cat > "$PREFIX/bin/jrscanv2" << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
export LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH
cd $HOME/JR_Script_V2.0.0.dist
chmod +x JR_Script_V2.0.0.bin 2>/dev/null
./JR_Script_V2.0.0.bin
EOF

chmod +x "$PREFIX/bin/jrscanv2"

echo ""
echo "[+] Done!"
echo "[+] Run: jrscanv2"
echo "[+] Get the key from the owner."
