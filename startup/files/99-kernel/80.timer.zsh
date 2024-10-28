s-run is linux && STARTUP_END_TIME=$(date +%s.%N)
s-run is darwin && STARTUP_END_TIME=$(date +%s)
STARTUP_DIFF_TIME=$((STARTUP_END_TIME - STARTUP_START_TIME))
STARTUP_DIFF_TIME_ROUNDED="$(echo $STARTUP_DIFF_TIME | cut -c1-5)"

echo-info "Shell startup time is ${COLOR_ARGUMENT}$STARTUP_DIFF_TIME_ROUNDED${STYLE_RESET} seconds"
