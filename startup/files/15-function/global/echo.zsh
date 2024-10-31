echo-fn() {
    local preffix="$SHELL_PREFFIX"
    local command=$1
    local args=(${@:2})
    if [[ $command == "error" ]]; then
        preffix="$SHELL_PREFFIX_ERROR"
    elif [[ $command == "success" ]]; then
        preffix="$SHELL_PREFFIX_SUCCESS"
    elif [[ $command == "info" ]]; then
        preffix="$SHELL_PREFFIX_INFO"
    elif [[ $command == "warning" ]]; then
        preffix="$SHELL_PREFFIX_WARNING"
    else
        args=($@)
    fi
    echo "$preffix ${args[@]}"
}
echo-error() {
    echo-fn error "$@"
}
echo-success() {
    echo-fn success "$@"
}
echo-info() {
    echo-fn info " $@"
    #? extra space added due tu issue with emoji width
}
echo-warning() {
    echo-fn warning "$@"
}

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

    s-is linux && TRACE_END_TIME=$(date +%s.%N)
    s-is darwin && TRACE_END_TIME=$(date +%s)

    TRACE_DIFF=$((TRACE_END_TIME - STARTUP_START_TIME))
    TRACE_DIFF_ROUNDED="$(echo $TRACE_DIFF | cut -c1-5)"

    echo-fn "${COLOR_MAGENTA}[[TRACING]]${STYLE_RESET} $@ ${COLOR_ARGUMENT}$TRACE_DIFF_ROUNDED${STYLE_RESET} seconds"
}
