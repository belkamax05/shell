SHELL_DIR="$HOME/shell"

source "$SHELL_DIR/core/base.zsh"
source "$SHELL_DIR/core/exports.zsh"
source "$SHELL_DIR/core/functions.zsh"

s-is linux && STARTUP_START_TIME=$(date +%s.%N)
s-is darwin && STARTUP_START_TIME=$(date +%s)
