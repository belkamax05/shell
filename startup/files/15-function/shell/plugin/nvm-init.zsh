# shell-plugin-nvm-init-legacy() {
#     # shellcheck source=/dev/null
#     # source "$HOME/.nvm/nvm.sh"
#     if [ -z "$NVM_LOADED" ]; then
#         [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#         export NVM_LOADED=true
#     fi

#     [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
#     # if s-is macos; then
#     #     [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#     #     [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" 
#     # fi

# }

s-plugin-nvm-init() {
    if [[ $(command -v nvm) ]]; then
        echo-fn error "NVM already loaded"
        return
    fi
    nvm() {
        debug info "Loading nvm from nvm.sh"
        local nvmDir="$(brew --prefix nvm)"
        [[ -s "$nvmDir/nvm.sh" ]] && \. "$nvmDir/nvm.sh"  # This loads nvm
        # [[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

        nvm "$@"
    }
}