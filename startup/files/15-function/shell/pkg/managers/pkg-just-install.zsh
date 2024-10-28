shell-pkg-just-install() {
    local installerName=""
    [[ "$@" == *"--brew"* ]] && installerName="brew"
    [[ "$@" == *"--deb"* ]] && installerName="deb"
    [[ "$@" == *"--snap"* ]] && installerName="snap"
    [[ "$@" == *"--script-pkg"* ]] && installerName="script-pkg"
    [[ "$@" == *"--script"* ]] && installerName="script-pkg"

    if s-run script-pkg-can-install $@; then
        installerName="script-pkg"
    fi
    if s-run snap-can-install $@; then
        installerName="snap"
    fi
    if s-run brew-can-install $@; then
        installerName="brew"
    fi
    if s-run deb-can-install $@; then
        installerName="deb"
    fi
    # s-run script-pkg-can-install "$@" && installerName="snap"
    # s-run snap-can-install "$@" && installerName="snap"
    # s-run brew-can-install "$@" && installerName="brew"
    # s-run deb-can-install "$@" && installerName="deb"

    if [[ -z $installerName ]]; then
        echo-error "No installer found for $@. ($installerName)"
        return $CODE_ERROR
    fi
    if [[ $SHELL_PREVENT_INSTALL == true ]]; then
        echo-warning "Installation via ${COLOR_CYAN}$installerName${STYLE_RESET} of ${COLOR_YELLOW}$1${STYLE_RESET} is prevented"
        return $CODE_ERROR
    fi
    s-run $installerName-just-install $@
}