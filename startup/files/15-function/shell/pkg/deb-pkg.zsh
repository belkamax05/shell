shell-deb-pkg() {
    _debPkgIsInstalled() {
        local -r package_name="$1"
        if dpkg-query -W -f='${Status}' $package_name 2>/dev/null | grep -q "install ok installed"; then
            return $CODE_OK
        fi
        return $CODE_ERROR
    }

    _debPkgInstall() {
        local -r package_name="$1"
        if _debPkgIsInstalled $package_name; then
            echo-info "Debian package '${COLOR_YELLOW}$package_name${STYLE_RESET}' is already installed."
            return $CODE_OK
        fi
        if apt-cache show $package_name >/dev/null 2>&1; then
            echo-info "Installing Debian package '${COLOR_YELLOW}$package_name${STYLE_RESET}' from APT..."
            sudo apt install -y $package_name
            if [ $? -eq 0 ]; then
                return $CODE_OK
            fi
            return $CODE_ERROR
        fi
        if [[ -f $package_name ]]; then
            echo-info "Installing Debian package '${COLOR_YELLOW}$package_name${STYLE_RESET}' locally..."
            sudo apt install -y $package_name
            if [ $? -eq 0 ]; then
                return $CODE_OK
            fi
            return $CODE_ERROR
        fi
        return $CODE_NOT_FOUND
    }

    case $1 in
        is-installed)
            _debPkgIsInstalled ${@:2}
            ;;
        install)
            _debPkgInstall ${@:2}
            ;;
        *)
            _debPkgInstall $@
            ;;
    esac
}