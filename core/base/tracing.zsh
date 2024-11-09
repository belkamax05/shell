s-tracing() {
    local command=$1
    case $command in
    enable)
        s-user set SHELL_IS_TRACING true
        return $CODE_OK
        ;;
    disable)
        s-user set SHELL_IS_TRACING false
        return $CODE_OK
        ;;
    status)
        s-user get SHELL_IS_TRACING
        return $CODE_OK
        ;;
    esac
    s-is started && return $CODE_OK
    s-not tracing && return $CODE_OK
    local diffTime=$(s-timer diff tracing)
    echo "${COLOR_WHITE}$diffTime ${STYLE_RESET} $@"
}