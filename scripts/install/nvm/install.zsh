INSTALL_NVM_BAK="$HOME/.zshrc.install-nvm.bak"

mkdir -p "$NVM_DIR"
cat "$HOME/.zshrc" > "$INSTALL_NVM_BAK"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
cat "$INSTALL_NVM_BAK" > "$HOME/.zshrc"
rm "$INSTALL_NVM_BAK"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts