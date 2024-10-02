if [ "$SHELL_OS" = "Darwin" ]; then
    local STARTUP_START_TIME=$(date +%s)
elif [ "$SHELL_OS" = "Linux" ]; then
    local STARTUP_START_TIME=$(date +%s.%N)
fi
