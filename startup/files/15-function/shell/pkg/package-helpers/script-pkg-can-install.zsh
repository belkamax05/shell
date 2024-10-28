shell-script-pkg-can-install() {
    if [ -f "$SHELL_INSTALL_DIR/$1/install.zsh" ]; then
        return $CODE_OK
    fi
    return $CODE_NOT_FOUND
}