path-prepend() {
    local value="$1"
    local alreadyExists=false
    if [[ ":$PATH:" == *":$value:"* ]]; then
        local alreadyExists=true
    fi
    if [[ $alreadyExists == false ]]; then
        export PATH="$value:$PATH"
    fi
}

path-prepend "$MVN_DIR/bin"
path-prepend "/home/.linuxbrew/bin"
path-prepend "$HOME/bin"
path-prepend "/opt/homebrew/bin"
path-prepend "$SHELL_CONFIGS_DIR/bin"
path-prepend "$NVM_DIR/bin"
path-prepend "/usr/local/bin/docker"