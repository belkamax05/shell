shell-pkg-install() {
    if s-run pkg-is-installed $@; then
        local howInstalled=$(shell pkg-installed-how $@ --first)
        echo-info "Package ${COLOR_YELLOW}$1${STYLE_RESET} is already installed via ${COLOR_CYAN}$howInstalled${STYLE_RESET}."
    else
        s-run pkg-just-install $@
    fi
}
