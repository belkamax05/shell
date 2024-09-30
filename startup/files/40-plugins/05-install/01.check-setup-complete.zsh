SHELL_SETUP_COMPLETE=0

if [ -f "$SHELL_SETUP_COMPLETE_FILE" ]; then
    SHELL_SETUP_COMPLETE=1
else
    debug "Shell setup is not complete. Runing installation of important modules."
fi
