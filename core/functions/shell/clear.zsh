s-clear-cache() {
    debug info "Clear cache at ${COLOR_ARGUMENT}$SHELL_CACHE_DIR${STYLE_RESET}"
    rm -rf "$SHELL_CACHE_DIR"
}
s-clear-dist() {
    debug info "Clear dist at ${COLOR_ARGUMENT}$SHELL_DIST${STYLE_RESET}"
    rm -rf "$SHELL_DIST"
}
s-clear() {
    case $1 in
        cache)
            s-run clear-cache
            ;;
        dist)
            s-run clear-dist
            ;;
        *)
            s-run clear-cache
            s-run clear-dist
            ;;
    esac
}