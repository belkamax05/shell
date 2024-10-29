on-shell-runtime() {
    WS_DIR="$HOME/ws"
    if [ ! -d "$WS_DIR" ]; then
        git clone git@github.com:belkamax05/ws.git "$WS_DIR"
    fi
    s-run files build-include $WS_DIR/zsh $SHELL_CACHE_DIR/ws.zsh
}

SHELL_DIR="$HOME/shell"
if [ ! -d "$SHELL_DIR" ]; then
    git clone git@github.com:belkamax05/shell.git "$SHELL_DIR"
fi
source "$SHELL_DIR/.zshrc"