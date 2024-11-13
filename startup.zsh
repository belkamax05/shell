#!/bin/zsh
SHELL_DIR="$HOME/shell"
source "$SHELL_DIR/core.zsh"
s-timer start tracing
s-source-dir-compiled "$SHELL_DIR/startup" "$SHELL_DIST/startup.zsh"