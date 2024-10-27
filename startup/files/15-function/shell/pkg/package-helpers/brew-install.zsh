shell-brew-install() {
    if s-run brew-is-installed $1; then
        echo-info "Brew package '${COLOR_YELLOW}$1${STYLE_RESET}' is already installed."
        return $CODE_OK
    fi
    shell-brew-just-install $@
}