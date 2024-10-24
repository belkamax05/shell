if [[ ! -d $ZAP_DIR ]]; then
    s-run install zap
fi
source $ZAP_DIR/zap.zsh