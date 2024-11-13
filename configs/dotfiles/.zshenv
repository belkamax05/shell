SHELL_DIR="$HOME/shell"
source "$SHELL_DIR/core.zsh"

if [[ $(command -v brew) == "" ]]; then
    local brewEnvPath=""
    s-is-linux && brewEnvPath="/home/linuxbrew/.linuxbrew/bin/brew"
    s-is-darwin && brewEnvPath="/opt/homebrew/bin/brew"
    [[ ! -f $brewEnvPath ]] && s-install-brew
    eval "$($brewEnvPath shellenv)"
fi

s-timer start tracing