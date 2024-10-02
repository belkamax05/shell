if [ "$SHELL_OS" = "Darwin" ]; then
    local STARTUP_END_TIME=$(date +%s)
elif [ "$SHELL_OS" = "Linux" ]; then
    local STARTUP_END_TIME=$(date +%s.%N)
fi
local STARTUP_DIFF_TIME=$((STARTUP_END_TIME - STARTUP_START_TIME))
local STARTUP_DIFF_TIME_ROUNDED="$(echo $STARTUP_DIFF_TIME | cut -c1-5)"

debug-timer "Shell startup time is ${COLOR_ARGUMENT}$STARTUP_DIFF_TIME_ROUNDED${STYLE_RESET} seconds"
