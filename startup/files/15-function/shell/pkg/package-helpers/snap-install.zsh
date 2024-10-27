shell-snap-install() {
    if s-run snap-is-installed $1; then
        echo-info "Snap package '${COLOR_YELLOW}$1${STYLE_RESET}' is already installed."
        return $CODE_OK
    fi
    s-run snap-just-install $@
}