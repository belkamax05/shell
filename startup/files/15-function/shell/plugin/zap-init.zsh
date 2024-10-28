shell-plugin-zap-init() {
    if [[ -f $ZAP_DIR/zap.zsh ]]; then
        source $ZAP_DIR/zap.zsh
    fi
}