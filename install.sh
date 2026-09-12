#!/bin/bash
clear
echo "================================"
echo "   JR SCRIPT INSTALLER v2.1.0"
echo "================================"
echo

if [ ! -d "/data/data/com.termux" ]; then
    echo "Error: Termux not detected"
    exit 1
fi

echo "[1/6] Storage setup..."
termux-setup-storage
sleep 2

echo "[2/6] Installing packages..."
pkg install wget unzip python -y

echo "[3/6] Library path..."
grep -q "LD_LIBRARY_PATH" ~/.bashrc || echo 'export LD_LIBRARY_PATH=/data/data/com.termux/files/usr/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
export LD_LIBRARY_PATH=/data/data/com.termux/files/usr/lib:$LD_LIBRARY_PATH

echo "[4/6] Downloading..."
cd ~
rm -f jrscanv2.zip jrscanv2
wget -O jrscanv2.zip https://github.com/jrazaque/jrscan-release/releases/download/v2.1.0/jrscanv2.zip

if [ ! -f "jrscanv2.zip" ]; then
    echo "Error: Download failed"
    exit 1
fi

echo "[5/6] Extracting..."
unzip -o jrscanv2.zip
chmod +x jrscanv2

echo "[6/6] Alias setup..."
grep -q "alias jrscanv2" ~/.bashrc || echo 'alias jrscanv2="~/jrscanv2"' >> ~/.bashrc
source ~/.bashrc

echo
echo "================================"
echo "   INSTALLATION COMPLETE ✅"
echo "================================"
echo
echo "Run: jrscanv2"
echo
echo "First time:"
echo "  1. Tool will show Device ID / HWID"
echo "  2. Copy it"
echo "  3. Send to @jrazaque on Telegram"
echo "  4. Get your key"
echo "  5. Paste key → Activate"
echo
read -p "Press Enter to run..."
jrscanv2
