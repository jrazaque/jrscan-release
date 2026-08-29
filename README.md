JR Script V2.1.0

All-in-One Toolkit for Termux
Host Scanner • CIDR Scanner • Domain Extractor • Port Scanner • IP Range • Subdomains • Daily Domains • Scan History • Export Scan Report

Owner: "@jrazaque" (https://t.me/jrazaque) | Channel: "@armods7" (https://t.me/armods7)

---

🔐 License

- 1 Key = 1 Device (HWID Bound)
- Copy your Device ID / HWID and send it to @jrazaque to get your key
- Absolute expiry — expired keys never work again
- Minutes / Hours / Days / Unlimited keys supported

---

Requirements

- Termux
- Internet (first install)

---

Install

pkg install wget unzip -y
cd /sdcard/Download
wget -O jrscan.zip "https://github.com/jrazaque/jrscan-release/releases/download/v2.1.0/JR_Script_V2.1.0_hwid.dist.zip"
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

---

Run

jrscanv2

On first run, copy your Device ID / HWID and send it to "@jrazaque" (https://t.me/jrazaque) to get your license key.
