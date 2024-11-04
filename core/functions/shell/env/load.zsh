shell-env-load() {
    local runtimeConfigsFile="$SHELL_CONFIGS_DIR/config-overrides.zsh"
    if [[ -f $runtimeConfigsFile ]]; then
        source $runtimeConfigsFile
    else
        compiling warning "No runtime configs found at $runtimeConfigsFile"
    fi

    SHELL_IS_COMPILED=false
    local currentFile="$(dirname ${(%):-%x})"
    #? if currentFile include 'dist' in path, then it's compiled
    if [[ $currentFile == *dist* ]]; then
        SHELL_IS_COMPILED=true
    fi
}