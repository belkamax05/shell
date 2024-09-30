debug-install "Installing required packages..."

mkdir -p "$SHELL_PLUGINS_DIR"

source "$SHELL_INSTALL_FILES_DIR/zap.zsh"
source "$SHELL_INSTALL_FILES_DIR/nvm.zsh"
source "$SHELL_INSTALL_FILES_DIR/yarn.zsh"
source "$SHELL_INSTALL_FILES_DIR/mvn.zsh"

touch $SHELL_SETUP_COMPLETE_FILE