if [ ! -f "$SHELL_SETUP_COMPLETE_FILE" ]; then
    echo-error "Shell setup is not complete (installation failed). Restarting startup"
    exec zsh
fi
