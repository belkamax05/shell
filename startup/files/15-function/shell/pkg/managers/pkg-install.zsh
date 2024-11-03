s-pkg-install() {
    local package=$1
    if [[ -z $package ]]; then
        s-run pkg-install-required
        return $CODE_OK
    fi
    [[ $package == "required" ]] && s-run pkg-install-required && return $CODE_OK
    [[ $package == "optional" ]] && s-run pkg-install-optional && return $CODE_OK

    if s-run pkg-is-installed $@; then
        local howInstalled=$(s-run pkg-how $@ --first)
        echo-info "Package ${COLOR_YELLOW}$1${STYLE_RESET} is already installed via ${COLOR_CYAN}$howInstalled${STYLE_RESET}."
    else
        s-run pkg-just-install $@
    fi
}
