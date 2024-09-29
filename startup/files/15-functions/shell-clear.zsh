function shell-clear-cache() {
    rm -rf "$SHELL_CACHE_DIR"
}

function shell-clear-startup() {
    rm -rf "$SHELL_STARTUP_FILE"
}

function shell-clear-setup() {
    rm -rf "$SHELL_SETUP_COMPLETE_FILE"
}
