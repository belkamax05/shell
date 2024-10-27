shell-script-pkg-can-install() {
    local installDir="$SHELL_SCRIPTS_DIR/install"
    if [ -f "$installDir/$1/install.zsh" ]; then
        return $CODE_OK
    fi
    if [ -f "$installDir/$1.zsh" ]; then
        return $CODE_OK
    fi
    return $CODE_NOT_FOUND
}