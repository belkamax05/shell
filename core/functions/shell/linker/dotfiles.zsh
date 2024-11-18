s-linker-dotfiles() {
    echo-info "Creating dotfiles linking..."
    ln -sf "$SHELL_DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
    ln -sf "$SHELL_DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
    ln -sf "$SHELL_DOTFILES_DIR/.zshenv" "$HOME/.zshenv"
    ln -sf "$SHELL_DOTFILES_DIR/vscode-settings.json" "$HOME/.config/Code - Insiders/User/settings.json"
    ln -sf "$SHELL_DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
}