on-shell-runtime() {
    #? workspace
    WS_DIR="$HOME/ws"
    if [ ! -d "$WS_DIR" ]; then
        git clone git@github.com:belkamax05/ws.git "$WS_DIR"
    fi
    s-run files build-include $WS_DIR/zsh $SHELL_CACHE_DIR/ws.zsh

    #? alt-zap
    AZ_DIR="$HOME/dev/alt-zap"
    if [ ! -d "$AZ_DIR" ]; then
        git clone git@github.com:belkamax05/alt-zap.git "$AZ_DIR"
    fi

    export NVM_AUTO_USE=true
    ZSH_NVM_DIR="$HOME/dev/.zsh-nvm"
    if [ ! -d "$ZSH_NVM_DIR" ]; then
        git clone https://github.com/lukechilds/zsh-nvm.git "$ZSH_NVM_DIR"
    fi
    source "$ZSH_NVM_DIR/zsh-nvm.plugin.zsh"
}

SHELL_DIR="$HOME/shell"
if [ ! -d "$SHELL_DIR" ]; then
    git clone git@github.com:belkamax05/shell.git "$SHELL_DIR"
fi
source "$SHELL_DIR/.zshrc"