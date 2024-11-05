shell-script-pkg-just-install() {
    if [ -f "$SHELL_INSTALL_DIR/$1/install.zsh" ]; then
        echo-info "Installing Script package '${COLOR_YELLOW}$1${STYLE_RESET}'..."
        source "$SHELL_INSTALL_DIR/$1/install.zsh"
        return $CODE_OK
    fi
    return $CODE_NOT_FOUND
}
