shell-deb-just-install() {
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
