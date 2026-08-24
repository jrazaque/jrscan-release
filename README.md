# JR Script V2.0.0

All-in-One Toolkit for Termux  
Host Scanner • CIDR Scanner • Domain Extractor • Port Scanner • IP Range • Subdomains • Daily Domains

**Owner:** [@jrazaque](https://t.me/jrazaque) | **Channel:** [@armods7](https://t.me/armods7)

---

## Requirements
- Termux
- Internet (first install)

---

## Install

```bash
pkg install wget unzip -y
cd /sdcard/Download
wget -O jrscan.zip "https://github.com/jrazaque/jrscan-release/releases/download/v2.0.0/JR_Script_V2.0.0.dist.zip"
unzip -o jrscan.zip
cp -r JR_Script_V2.0.0.dist $HOME/
chmod +x $HOME/JR_Script_V2.0.0.dist/JR_Script_V2.0.0.bin

cat > $PREFIX/bin/jrscanv2 << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
export LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH
cd $HOME/JR_Script_V2.0.0.dist
chmod +x JR_Script_V2.0.0.bin 2>/dev/null
./JR_Script_V2.0.0.bin
EOF
chmod +x $PREFIX/bin/jrscanv2
echo "Install done. Run: jrscanv2"
