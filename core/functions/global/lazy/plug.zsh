plug() {
    unset -f plug
    debug info "Lazy load ${COMMAND_ARGUMENT}zap${STYLE_RESET}"
    if [[ -f $ZAP_DIR/zap.zsh ]]; then
        source $ZAP_DIR/zap.zsh
    fi
    plug "$@"
}