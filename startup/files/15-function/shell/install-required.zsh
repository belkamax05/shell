function shell-install-required() {
    debug-install "Installing required packages..."
    mkdir -p "$SHELL_PLUGINS_DIR"
    shell install zap
    shell install nvm
}