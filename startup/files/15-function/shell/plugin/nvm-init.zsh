shell-plugin-nvm-init() {
    # shellcheck source=/dev/null
    # source "$HOME/.nvm/nvm.sh"
    tracing "nvm 0"
    local start_time=$(date +%s)
    # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    local end_time=$(date +%s)
    echo "nvm.sh load time: $((end_time - start_time)) seconds"

    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
    # if s-is macos; then
    #     [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    #     [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" 
    # fi

    tracing "nvm 1"
    autoload -U add-zsh-hook
    tracing "nvm 2"
    load-nvmrc() {
        tracing "nvm x1"
        if [[ ":$PATH:" != *":$NVM_DIR/bin:"* ]]; then
            export PATH="$NVM_DIR/bin:$PATH"
        fi
        tracing "nvm x2"
        local node_version="$(nvm version)"
        local nvmrc_path="$(nvm_find_nvmrc)"
        tracing "nvm x3"
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
        tracing "nvm x4"
    }
    tracing "nvm 3"
    add-zsh-hook chpwd load-nvmrc
    tracing "nvm 4"
    load-nvmrc
    tracing "nvm 5"
}