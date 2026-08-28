ZIP_URL="https://github.com/jrazaque/jrscan-release/releases/download/v2.1.0/JR_Script_V2.1.0_hwid.dist.zip"
# ...
wget -O jrscan.zip "$ZIP_URL"
unzip -o jrscan.zip
rm -rf "$HOME/.jrscript"
mkdir -p "$HOME/.jrscript"
cp -a JR_Script_V2.1.0_hwid.dist/. "$HOME/.jrscript/"
chmod 755 "$HOME/.jrscript/JR_Script_V2.1.0_hwid.bin"
cat > "$PREFIX/bin/jrscanv2" << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
export LD_LIBRARY_PATH=$HOME/.jrscript:$PREFIX/lib:$LD_LIBRARY_PATH
cd $HOME/.jrscript
exec ./JR_Script_V2.1.0_hwid.bin "$@"
EOF
chmod 755 "$PREFIX/bin/jrscanv2"
