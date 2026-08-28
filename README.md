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
wget -O jrscan.zip "https://github.com/jrazaque/jrscan-release/releases/download/v2.0.0/JR_Script_V2.1.0_hwid.dist.zip"
unzip -o jrscan.zip
rm -rf $HOME/.jrscript
mkdir -p $HOME/.jrscript
cp -a JR_Script_V2.1.0_hwid.dist/. $HOME/.jrscript/
chmod 755 $HOME/.jrscript/JR_Script_V2.1.0_hwid.bin

cat > $PREFIX/bin/jrscanv2 << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
export LD_LIBRARY_PATH=$HOME/.jrscript:$PREFIX/lib:$LD_LIBRARY_PATH
cd $HOME/.jrscript
exec ./JR_Script_V2.1.0_hwid.bin "$@"
EOF
chmod 755 $PREFIX/bin/jrscanv2
echo "Done. Run: jrscanv2"
