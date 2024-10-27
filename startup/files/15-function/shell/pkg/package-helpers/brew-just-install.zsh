shell-brew-just-install() {
    local -r package_name="$1"
    echo-info "Installing Brew package '${COLOR_YELLOW}$package_name${STYLE_RESET}'..."
    brew install $package_name
    if [ $? -eq 0 ]; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}