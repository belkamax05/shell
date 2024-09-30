function clear-cache() {
    debug-function clear-cache $@
    rm -rf "$SHELL_CACHE_DIR"
}

function clear-startup() {
    debug-function clear-startup $@
    rm -rf "$SHELL_STARTUP_FILE"
}

function clear-setup() {
    debug-function clear-setup $@
    rm -rf "$SHELL_SETUP_COMPLETE_FILE"
}
