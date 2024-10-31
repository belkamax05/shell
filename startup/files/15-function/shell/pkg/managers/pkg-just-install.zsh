s-pkg-just-install() {
    local installerName=""
    [[ "$@" == *"--brew"* ]] && installerName="brew"
    [[ "$@" == *"--deb"* ]] && installerName="deb"
    [[ "$@" == *"--snap"* ]] && installerName="snap"
    [[ "$@" == *"--script-pkg"* ]] && installerName="script-pkg"
    [[ "$@" == *"--script"* ]] && installerName="script-pkg"

    s-run script-pkg-can-install "$@" && installerName="snap"
    s-run snap-can-install "$@" && installerName="snap"
    s-run brew-can-install "$@" && installerName="brew"
    s-run deb-can-install "$@" && installerName="deb"

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
