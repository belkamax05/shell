shell-runtime-link-dotfiles() {
    SHELL_LINKING_COMPLETE=$(s-run user get SHELL_LINKING_COMPLETE)
    if [[ $SHELL_LINKING_COMPLETE != true ]]; then
        echo-info "Creating dotfiles linking..."
        ln -sf "$SHELL_DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
        shell-user set SHELL_LINKING_COMPLETE true
    fi
}