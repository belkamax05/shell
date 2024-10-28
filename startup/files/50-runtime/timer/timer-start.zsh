shell-runtime-timer-start() {
    s-run is linux && STARTUP_START_TIME=$(date +%s.%N)
    s-run is darwin && STARTUP_START_TIME=$(date +%s)
}