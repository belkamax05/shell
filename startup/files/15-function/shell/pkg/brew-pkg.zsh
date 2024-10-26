shell-brew-pkg() {
    _brewPkgIsInstalled() {
        local -r package_name="$1"
        if brew list -1 | grep -q "^$package_name\$"; then
            return $CODE_OK
        fi
        return $CODE_ERROR
    }

    _brewPkgInstall() {
        local -r package_name="$1"
        if _brewPkgIsInstalled $package_name; then
            echo-info "Brew package '${COLOR_YELLOW}$package_name${STYLE_RESET}' is already installed."
            return $CODE_OK
        fi
        echo-info "Installing Brew package '${COLOR_YELLOW}$package_name${STYLE_RESET}'..."
        brew install $package_name
        if [ $? -eq 0 ]; then
            return $CODE_OK
        fi
        return $CODE_ERROR
    }

    case $1 in
        is-installed)
            _brewPkgIsInstalled ${@:2}
            ;;
        install)
            _brewPkgInstall ${@:2}
            ;;
        *)
            _brewPkgInstall $@
            ;;
    esac
}