shell-linker() {
    _linkerDotfiles() {
        echo-info "Creating dotfiles linking..."
        ln -sf "$SHELL_DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
        ln -sf "$SHELL_DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
        ln -sf "$SHELL_DOTFILES_DIR/.zshenv" "$HOME/.zshenv"
        ln -sf "$SHELL_DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
        
        # shell-user set SHELL_LINKING_COMPLETE true
    }

    _linkerConfigs() {
        echo-info "Creating configs linking..."
        ln -s "$SHELL_SHARED_DIR" "$SHELL_INTEGRATION_DIR/shell-config"
        # shell-user set SHELL_LINKING_COMPLETE true
    }

    case $1 in
        dotfiles)
            _linkerDotfiles
            ;;
        configs)
            _linkerConfigs
            ;;
        *)
            echo-error "Unknown linker type: $1"
            ;;
    esac
}