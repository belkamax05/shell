shell-script-pkg-install() {
    if s-run script-pkg-is-installed $1; then
        echo-info "Script package '${COLOR_YELLOW}$1${STYLE_RESET}' is already installed."
        return $CODE_OK
    fi
    s-run script-pkg-just-install $@
}