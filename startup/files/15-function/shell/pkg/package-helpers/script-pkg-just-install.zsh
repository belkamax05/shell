shell-script-pkg-just-install() {
    local installDir="$SHELL_SCRIPTS_DIR/install"
    if [ -f "$installDir/$1/install.zsh" ]; then
        echo-info "Installing Script package '${COLOR_YELLOW}$1${STYLE_RESET}'..."
        source "$installDir/$1/install.zsh"
        s-run script-pkg-set-installed $1 true
        return $CODE_OK
    fi
    return $CODE_NOT_FOUND
}
