tracing "Jq loads"
if [[ $(command -v jq) == "" ]]; then
    s-debug info "Lazy loading ${COLOR_SUCCESS}jq${STYLE_RESET}"
    jq() {
        unset -f jq
        s-debug info "Installing ${COLOR_SUCCESS}jq${STYLE_RESET}"
        brew install jq > /dev/null
        jq $@
    }
fi
tracing "Jq loaded"