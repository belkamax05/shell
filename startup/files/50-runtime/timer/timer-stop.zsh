shell-runtime-timer-stop() {
    s-is linux && STARTUP_END_TIME=$(date +%s.%N)
    s-is darwin && STARTUP_END_TIME=$(date +%s)
    STARTUP_DIFF_TIME=$((STARTUP_END_TIME - STARTUP_START_TIME))
    STARTUP_DIFF_TIME_ROUNDED="$(echo $STARTUP_DIFF_TIME | cut -c1-5)"
    local modeText=""
    if s-is compiled; then
        modeText="compiled"
    else
        modeText="interpreted"
    fi
    debug-success "Shell ${COLOR_CYAN}$modeText${STYLE_RESET} time is ${COLOR_ARGUMENT}$STARTUP_DIFF_TIME_ROUNDED${STYLE_RESET} seconds"
}