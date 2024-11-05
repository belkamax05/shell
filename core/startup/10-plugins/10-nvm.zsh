if [[ $(command -v nvm) != "nvm" ]]; then
    debug info "Loading ${COLOR_SUCCESS}nvm${STYLE_RESET}"
    export NVM_AUTO_USE=true
    source $(brew --prefix nvm)/nvm.sh
fi