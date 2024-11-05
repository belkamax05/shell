s-tracing() {
    local command=$1
    if [[ $command == "enable" ]]; then
        s-user set SHELL_IS_TRACING true
        return $CODE_OK
    elif [[ $command == "disable" ]]; then
        s-user set SHELL_IS_TRACING false
        return $CODE_OK
    elif [[ $command == "status" ]]; then
        s-user get SHELL_IS_TRACING
        return $CODE_OK
    fi
    s-not tracing && return $CODE_OK
    local diffTime=$(s-timer diff tracing)
    echo "${COLOR_WHITE}$diffTime ${STYLE_RESET} $@"
}
tracing() {
    s-tracing $@
}
