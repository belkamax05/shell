shell-env-load() {
    local runtimeConfigsFile="$SHELL_CONFIGS_DIR/config-overrides.zsh"
    if [[ -f $runtimeConfigsFile ]]; then
        source $runtimeConfigsFile
    else
        compiling warning "No runtime configs found at $runtimeConfigsFile"
    fi

    SHELL_IS_COMPILED=false
    if [[ $CURRENT_FILE_PATH == $SHELL_STARTUP_FILE && -f $SHELL_STARTUP_FILE ]]; then
        SHELL_IS_COMPILED=true
    fi
}