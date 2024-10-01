if [ $SHELL_SETUP_COMPLETE -eq 0 ]; then
    source "$SHELL_INSTALL_DIR/install-required.zsh"
    exec zsh
fi
