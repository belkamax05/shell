SHELL_INITIALISE_COMPLETE=$(shell-user get SHELL_INITIALISE_COMPLETE)
if [[ $SHELL_INITIALISE_COMPLETE != true ]]; then
    echo-info "Initialising shell integration..."
    shell-is linux && source "$SHELL_INTEGRATION_DIR/ubuntu/initialise.zsh"
    shell-is darwin && source "$SHELL_INTEGRATION_DIR/macos/initialise.zsh"
    shell-user set SHELL_INITIALISE_COMPLETE true
fi

SHELL_LINKING_COMPLETE=$(shell-user get SHELL_LINKING_COMPLETE)
if [[ $SHELL_LINKING_COMPLETE != true ]]; then
    echo-info "Creating dotfiles linking..."

    ln -sf "$SHELL_DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
    
    shell-user set SHELL_LINKING_COMPLETE true
fi
