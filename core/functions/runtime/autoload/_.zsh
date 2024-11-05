s-runtime-autoload() {
    fpath=($SHELL_DIR/functions $fpath)
    local allFunctions=($SHELL_DIR/functions/*)
    autoload -Uz $allFunctions
    autoload -U add-zsh-hook
}
    