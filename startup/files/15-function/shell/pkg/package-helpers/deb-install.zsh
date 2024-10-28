shell-deb-install() {
    if s-run deb-is-installed $1; then
        echo-info "Debian package '${COLOR_YELLOW}$1${STYLE_RESET}' is already installed."
        return $CODE_OK
    fi
    s-run deb-just-install $@
}