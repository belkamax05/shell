shell-env-load() {
    local runtimeConfigsFile="$SHELL_CONFIGS_DIR/config-overrides.zsh"
    if [[ -f $runtimeConfigsFile ]]; then
        source $runtimeConfigsFile
    else
        compiling-warning "No runtime configs found at $runtimeConfigsFile"
    fi
}