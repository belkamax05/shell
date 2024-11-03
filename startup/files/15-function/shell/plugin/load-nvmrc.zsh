load-nvmrc() {
    tracing "Load nvmrc"
    if [[ ":$PATH:" != *":$NVM_DIR/bin:"* ]]; then
        export PATH="$NVM_DIR/bin:$PATH"
    fi
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"
    if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
        if [ "$nvmrc_node_version" = "N/A" ]; then
            nvm install
        elif [ "$nvmrc_node_version" != "$node_version" ]; then
            nvm use --silent
        fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
        nvm use default
    fi
}