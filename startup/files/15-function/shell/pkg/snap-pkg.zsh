shell-snap-pkg() {
    _snapPkgIsInstalled() {
        local -r package_name="$1"
        if snap list | grep -q "^$package_name "; then
            return $CODE_OK
        fi
        return $CODE_ERROR
    }

    _snapPkgInstall() {
        local -r package_name="$1"
        if _snapPkgIsInstalled $package_name; then
            echo-info "Snap package '${COLOR_YELLOW}$package_name${STYLE_RESET}' is already installed."
            return $CODE_OK
        fi
        echo-info "Installing Snap package '${COLOR_YELLOW}$package_name${STYLE_RESET}'..."
        sudo snap install $package_name
        if [ $? -eq 0 ]; then
            return $CODE_OK
        fi
        return $CODE_ERROR
    }

    case $1 in
        is-installed)
            _snapPkgIsInstalled ${@:2}
            ;;
        install)
            _snapPkgInstall ${@:2}
            ;;
        *)
            _snapPkgInstall $@
            ;;
    esac
}