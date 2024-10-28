SHELL_ENTRY_FILE="${(%):-%x}"
SHELL_DIR=$(dirname $SHELL_ENTRY_FILE)

source $SHELL_DIR/startup/run.zsh 
