SHELL_INITIALISE_COMPLETE=$(shell-user get SHELL_INITIALISE_COMPLETE)
if [[ $SHELL_INITIALISE_COMPLETE != true ]]; then
    echo-info "Initialising shell integration..."
    shell-is linux && source "$SHELL_INTEGRATION_DIR/ubuntu/initialise.zsh"
    shell-is darwin && source "$SHELL_INTEGRATION_DIR/macos/initialise.zsh"
    shell-user set SHELL_INITIALISE_COMPLETE true
fi
