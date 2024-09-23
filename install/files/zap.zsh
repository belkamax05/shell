if [ ! -d "$ZAP_DIR" ]; then
    INSTALL_ZAP_BAK="$HOME/.zshrc.install-zap.bak"
    cat "$HOME/.zshrc" > "$INSTALL_ZAP_BAK"
    echo "" > "$HOME/.zshrc"
    source <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
    cat "$INSTALL_ZAP_BAK" > "$HOME/.zshrc"
fi
