shell-deb-install() {
    local -r package_name="$1"
    if s-run deb-is-installed $package_name; then
        echo-info "Debian package '${COLOR_YELLOW}$package_name${STYLE_RESET}' is already installed."
        return $CODE_OK
    fi
    s-run deb-just-install $@
}