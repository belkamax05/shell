if [ "$SHELL_UNAME" = "Linux" ] && [ "$SHELL_INITIALISE_COMPLETE" != 1 ]; then
    source "$SHELL_INTEGRATION_DIR/ubuntu/initialise.zsh"
fi
if [ "$SHELL_UNAME" = "Darwin" ] && [ "$SHELL_INITIALISE_COMPLETE" != 1 ]; then
    source "$SHELL_INTEGRATION_DIR/macos/initialise.zsh"
fi
