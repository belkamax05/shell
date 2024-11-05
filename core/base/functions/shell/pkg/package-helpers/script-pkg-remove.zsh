shell-script-pkg-remove() {
    if [ -f "$SHELL_INSTALL_DIR/$1/remove.zsh" ]; then
        echo-info "Removing Script package '${COLOR_YELLOW}$1${STYLE_RESET}'..."
        source "$SHELL_INSTALL_DIR/$1/remove.zsh"
        return $CODE_OK
    fi
    return $CODE_NOT_FOUND
}