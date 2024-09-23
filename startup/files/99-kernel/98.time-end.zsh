local STARTUP_END_TIME=$(date +%s)

if [ "$DEBUG_LOAD_TIME" = 1 ]; then
    echo-success "Loaded in ${COLOR_ARGUMENT}$((STARTUP_END_TIME - STARTUP_START_TIME))${STYLE_RESET} seconds"
fi
