export SHELL=$(which zsh)

path-prepend() {
    local value="$1"
    if [[ -d "$value" && ":$PATH:" != *":$value:"* ]]; then
        export PATH="$PATH:$value"
    fi
}

path-prepend "$MVN_DIR/bin"
path-prepend "/home/.linuxbrew/bin"
path-prepend "$HOME/bin"
path-prepend "/opt/homebrew/bin"
path-prepend "$SHELL_CONFIGS_DIR/bin"
path-prepend "$NVM_DIR/bin"
path-prepend "/usr/local/bin/docker"
