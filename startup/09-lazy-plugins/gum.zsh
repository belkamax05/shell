tracing "Gum loads"
if [[ $(command -v gum) == "" ]]; then
    s-debug info "Lazy loading ${COLOR_SUCCESS}gum${STYLE_RESET}"
    gum() {
        unset -f gum
        s-debug info "Installing ${COLOR_SUCCESS}gum${STYLE_RESET}"
        brew install gum > /dev/null
        gum $@
    }
fi
tracing "Gum loaded"