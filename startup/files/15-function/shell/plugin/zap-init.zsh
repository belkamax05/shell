shell-plugin-zap-init() {
    tracing "Load zap"
    if [[ -f $ZAP_DIR/zap.zsh ]]; then
        source $ZAP_DIR/zap.zsh
    fi
}