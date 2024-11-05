s-lazy-nvm-unset() {
    unset -f nvm
    unset -f s-lazy-nvm-unset
    unset -f s-lazy-nvm
    if [[ $(command -v nvm) != "nvm" ]]; then
        debug info "Lazy loading ${COLOR_SUCCESS}nvm${STYLE_RESET}"
        export NVM_AUTO_USE=true
        source $(brew --prefix nvm)/nvm.sh
        s-load-nvmrc
    fi
}