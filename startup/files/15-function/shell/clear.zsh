function shell-clear-cache() {
    # debug-function clear-cache $@
    rm -rf "$SHELL_CACHE_DIR"
    rm -f $SHELL_SHARED_DIR/.user-config
}

function shell-clear-startup() {
    # debug-function clear-startup $@
    rm -rf "$SHELL_STARTUP_FILE"
}

function shell-clear() {
    local command=$1
    # debug-function clear $@

    case $command in
        cache)
            shell-clear-cache
            ;;
        startup)
            shell-clear-startup
            ;;
        *)
            shell-clear-cache
            ;;
    esac
}