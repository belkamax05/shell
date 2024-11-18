s-plugin-nvm-lazy-load() {
    s-tracing "Load nvmrc"
    if [[ ! -f "$PWD/.nvmrc" ]]; then
        s-tracing "No .nvmrc file found"
        return $CODE_OK
    fi
    if [[ $(command -v nvm) != "nvm" ]]; then
        s-debug info "Lazy loading ${COLOR_SUCCESS}nvm${STYLE_RESET}"
        export NVM_AUTO_USE=true
        source $(brew --prefix nvm)/nvm.sh
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
    s-tracing "Load nvmrc done"
}
