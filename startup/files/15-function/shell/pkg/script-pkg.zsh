shell-script-pkg() {
    local installDir="$SHELL_SCRIPTS_DIR/install"

    _scriptPkgGetInstalled() {
        echo $(s-run config-file get $SHELL_SHARED_DIR/.script-install-config $@)
    }
    _scriptPkgSetInstalled() {
        s-run config-file set $SHELL_SHARED_DIR/.script-install-config $@
    }

    _scriptPkgIsInstalled() {
        local -r package_name="$1"
        if [[ $(_scriptPkgGetInstalled $package_name) == true ]]; then
            return $CODE_OK
        fi
        return $CODE_ERROR
    }

    _scriptPkgInstall() {
        local -r package_name="$1"
        if _scriptPkgIsInstalled $package_name; then
            echo-info "Script package '${COLOR_YELLOW}$package_name${STYLE_RESET}' is already installed."
            return $CODE_OK
        fi
        if [ -f "$installDir/$package_name/install.zsh" ]; then
            echo-info "Installing Script package '${COLOR_YELLOW}$package_name${STYLE_RESET}'..."
            source "$installDir/$package_name/install.zsh"
            _scriptPkgSetInstalled $package_name true
            return $CODE_OK
        fi
        if [ -f "$installDir/$package_name.zsh" ]; then
            echo-info "Installing Script package '${COLOR_YELLOW}$package_name${STYLE_RESET}'..."
            source "$installDir/$package_name.zsh"
            _scriptPkgSetInstalled $package_name true
            return $CODE_OK
        fi
        return $CODE_NOT_FOUND
    }

    case $1 in
        is-installed)
            _scriptPkgIsInstalled ${@:2}
            ;;
        install)
            _scriptPkgInstall ${@:2}
            ;;
        *)
            _scriptPkgInstall $@
            ;;
    esac
}