shell-snap-just-install() {
    echo-info "Installing Snap package '${COLOR_YELLOW}$1${STYLE_RESET}'..."
    sudo snap install $1
    if [ $? -eq 0 ]; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}
