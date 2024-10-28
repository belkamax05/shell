shell-env-load() {
    local runtimeConfigsFile="$SHELL_INTEGRATION_DIR/runtime-configs.zsh"
    if [[ -f $runtimeConfigsFile ]]; then
        source $runtimeConfigsFile
    else
        compiling-warning "No runtime configs found at $runtimeConfigsFile"
    fi
}