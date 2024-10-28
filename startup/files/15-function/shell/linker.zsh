shell-linker() {
    _linkerDotfiles() {
        echo-info "Creating dotfiles linking..."
        ln -sf "$SHELL_DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
        ln -sf "$SHELL_DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
        ln -sf "$SHELL_DOTFILES_DIR/.zshenv" "$HOME/.zshenv"
        ln -sf "$SHELL_DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
    }

    _linkerBin() {
        echo-info "Creating bin linking..."
        sudo ln -sf "$SHELL_BIN_DIR/shell" "/usr/local/bin/shell_x"
    }

    _linkerConfigs() {
        local target_link="$SHELL_CONFIGS_DIR/shell-config"
        if [ -L "$target_link" ] || [ -e "$target_link" ]; then
            echo-info "Recreating link at ${COLOR_YELLOW}$target_link${STYLE_RESET}..."
            rm -rf "$target_link"
        else
            echo-info "Creating configs linking at ${COLOR_YELLOW}$target_link${STYLE_RESET}..."
        fi
        ln -s "$SHELL_SHARED_DIR" "$target_link"
    }

    case $1 in
        dotfiles)
            _linkerDotfiles
            ;;
        configs)
            _linkerConfigs
            ;;
        bin)
            _linkerBin
            ;;
        *)
            echo-error "Unknown linker type: $1"
            ;;
    esac
}