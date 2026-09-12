#!/bin/bash
# JR Script V2.1.0 Installer
# Owner: @jrazaque | Channel: @armods7

clear
echo "================================"
echo "   JR SCRIPT INSTALLER v2.1.0"
echo "================================"
echo

# Termux check
if [ ! -d "/data/data/com.termux" ]; then
    echo "Error: Termux not detected"
    exit 1
fi

# Storage setup
echo "[1/4] Storage setup..."
termux-setup-storage
sleep 2

# Packages
echo "[2/4] Installing packages..."
pkg install wget unzip -y

# Download
echo "[3/4] Downloading JR Script..."
cd ~
rm -f jrscanv2.zip
wget -O jrscanv2.zip https://github.com/jrazaque/jrscan-release/releases/download/v2.1.0/jrscanv2.zip

# Check download
if [ ! -f "jrscanv2.zip" ]; then
    echo "Error: Download failed"
    exit 1
fi

# Extract
echo "[4/4] Extracting..."
rm -rf JR_Script.dist
unzip -o jrscanv2.zip
chmod +x JR_Script.dist/jrscanv2

# Success
echo
echo "================================"
echo "   INSTALLATION COMPLETE ✅"
echo "================================"
echo
echo "Run: ~/JR_Script.dist/jrscanv2"
echo
echo "First time:"
echo "  1. Tool will show Device ID / HWID"
echo "  2. Copy it"
echo "  3. Send to @jrazaque on Telegram"
echo "  4. Get your key"
echo "  5. Paste key → Activate"
echo
read -p "Press Enter to run JR Script..."
cd ~/JR_Script.dist
./jrscanv2
