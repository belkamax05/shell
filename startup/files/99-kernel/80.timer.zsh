local STARTUP_END_TIME=$(date +%s.%N)
local STARTUP_DIFF_TIME=$((STARTUP_END_TIME - STARTUP_START_TIME))
local STARTUP_DIFF_TIME_ROUNDED="$(echo $STARTUP_DIFF_TIME | cut -c1-5)"

if [ "$DEBUG_LOAD_TIME" = 1 ]; then
    echo-success "Loaded in ${COLOR_ARGUMENT}$STARTUP_DIFF_TIME_ROUNDED${STYLE_RESET} seconds"
    echo "End: $(date +%s.%N)"
fi
