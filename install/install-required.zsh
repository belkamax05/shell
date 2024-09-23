echo-info "Installing required packages..."

mkdir -p "$SHELL_PLUGINS_DIR"

echo-info "Installing zap-n ..."
source "$SHELL_INSTALL_FILES_DIR/zap.zsh"
echo-info "Installing nvm..."
source "$SHELL_INSTALL_FILES_DIR/nvm.zsh"
echo-info "Installing yarn..."
source "$SHELL_INSTALL_FILES_DIR/yarn.zsh"
echo-info "Installing Maven..."
source "$SHELL_INSTALL_FILES_DIR/mvn.zsh"

touch $SHELL_SETUP_COMPLETE_FILE