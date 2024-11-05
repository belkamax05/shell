is-echo-command() {
    local command=$1
    if [[ $command == "error" || $command == "success" || $command == "info" || $command == "warning" ]]; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}

verbose() {
    s-not verbose && return $CODE_OK
    local command=$1
    if is-echo-command $command; then
        echo-fn $command "${COLOR_CYAN}[[VERBOSE]]${STYLE_RESET} ${@:2}"
    else
        echo-fn "${COLOR_CYAN}[[VERBOSE]]${STYLE_RESET} $@"
    fi
}

compiling() {
    s-not compiled && return $CODE_OK
    local command=$1
    if is-echo-command $command; then
        echo-fn $command "${COLOR_YELLOW}[[COMPILING]]${STYLE_RESET} ${@:2}"
    else
        echo-fn "${COLOR_YELLOW}[[COMPILING]]${STYLE_RESET} $@"
    fi
}

debug() {
    s-not debug && return $CODE_OK
    local command=$1
    if is-echo-command $command; then
        echo-fn $command "${COLOR_MAGENTA}[[DEBUG]]${STYLE_RESET} ${@:2}"
    else
        echo-fn "${COLOR_MAGENTA}[[DEBUG]]${STYLE_RESET} $@"
    fi
}

tracing() {
    s-not tracing && return $CODE_OK
    local diffTime=$(s-timer diff tracing)
    echo "${COLOR_WHITE}$diffTime ${STYLE_RESET} $@"
}
