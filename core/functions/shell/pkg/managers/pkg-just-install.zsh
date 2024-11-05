s-pkg-just-install() {
    local installerName=""
    [[ "$@" == *"--brew"* ]] && installerName="brew"
    [[ "$@" == *"--deb"* ]] && installerName="deb"
    [[ "$@" == *"--snap"* ]] && installerName="snap"
    [[ "$@" == *"--script-pkg"* ]] && installerName="script-pkg"
    [[ "$@" == *"--script"* ]] && installerName="script-pkg"

    if s-run script-pkg-can-install "$@"; then
        installerName="script-pkg"
    elif s-run snap-can-install "$@"; then
        installerName="snap"
    elif s-run brew-can-install "$@"; then
        installerName="brew"
    elif s-run deb-can-install "$@"; then
        installerName="deb"
    fi

    if [[ -z $installerName ]]; then
        echo-error "No installer found for $@. ($installerName)"
        return $CODE_ERROR
    fi
    if [[ $SHELL_SKIP_INSTALL == true ]]; then
        echo-warning "Installation via ${COLOR_CYAN}$installerName${STYLE_RESET} of ${COLOR_YELLOW}$1${STYLE_RESET} is skipped."
        return $CODE_ERROR
    fi
    s-run $installerName-just-install $@
}
