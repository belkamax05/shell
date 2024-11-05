s-clear-cache() {
    echo-info "Clear cache at ${COLOR_ARGUMENT}$SHELL_CACHE_DIR${STYLE_RESET}"
    rm -rf "$SHELL_CACHE_DIR"
}
s-clear-dist() {
    echo-info "Clear dist at ${COLOR_ARGUMENT}$SHELL_DIST${STYLE_RESET}"
    rm -rf "$SHELL_DIST"
}
s-clear() {
    case $1 in
        cache)
            s-clear-cache
            ;;
        dist)
            s-clear-dist
            ;;
        *)
            s-clear-cache
            s-clear-dist
            ;;
    esac
}