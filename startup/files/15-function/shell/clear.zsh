shell-clear-cache() {
    debug info "Clear cache at ${COLOR_ARGUMENT}$SHELL_CACHE_DIR${STYLE_RESET}"
    rm -rf "$SHELL_CACHE_DIR"
}

shell-clear-startup() {
    debug info "Clear startup file at ${COLOR_ARGUMENT}$SHELL_STARTUP_FILE${STYLE_RESET}"
    rm -rf "$SHELL_STARTUP_FILE"
}

shell-clear() {
    case $1 in
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