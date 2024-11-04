shell-deb-just-install() {
    if apt-cache show $1 >/dev/null 2>&1; then
        echo-info "Installing Debian package '${COLOR_YELLOW}$1${STYLE_RESET}' from APT..."
        sudo apt install -y $1
        if [ $? -eq 0 ]; then
            return $CODE_OK
        fi
        return $CODE_ERROR
    fi
    if [[ -f $1 ]]; then
        echo-info "Installing Debian package '${COLOR_YELLOW}$1${STYLE_RESET}' locally..."
        sudo apt install -y $1
        if [ $? -eq 0 ]; then
            return $CODE_OK
        fi
        return $CODE_ERROR
    fi
    return $CODE_NOT_FOUND
}
