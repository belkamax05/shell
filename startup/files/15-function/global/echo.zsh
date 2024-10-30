echo-error() {
    echo "$SHELL_PREFFIX_ERROR $@"
}
echo-success() {
    echo "$SHELL_PREFFIX_SUCCESS $@"
}
echo-info() {
    echo "$SHELL_PREFFIX_INFO  $@"
    #? extra space added due tu issue with emoji width
}
echo-warning() {
    echo "$SHELL_PREFFIX_WARNING $@"
}

verbose-echo() {
    s-is verbose && echo "$@"
}
verbose-error() {
    s-is verbose && echo-error "$@"
}
verbose-success() {
    s-is verbose && echo-success "$@"
}
verbose-debug() {
    s-is verbose && echo-debug "$@"
}
verbose-info() {
    s-is verbose && echo-info "$@"
}
verbose-warning() {
    s-is verbose && echo-warning "$@"
}

compiling-echo() {
    s-run not compiled && echo "$@"
}
compiling-error() {
    s-run not compiled && echo-error "$@"
}
compiling-success() {
    s-run not compiled && echo-success "$@"
}
compiling-info() {
    s-run not compiled && echo-info "$@"
}
compiling-warning() {
    s-run not compiled && echo-warning "$@"
}


debug() {
    s-is debug && echo "DEBUG: $@"
}
debug-error() {
    s-is debug && echo-error "DEBUG: $@"
}
debug-info() {
    s-is debug && echo-info "DEBUG: $@"
}
debug-success() {
    s-is debug && echo-success "DEBUG: $@"
}
debug-warning() {
    s-is debug && echo-warning "DEBUG: $@"
}
tracing() {
    s-is linux && TRACE_END_TIME=$(date +%s.%N)
    s-is darwin && TRACE_END_TIME=$(date +%s)

    TRACE_DIFF=$((TRACE_END_TIME - STARTUP_START_TIME))
    TRACE_DIFF_ROUNDED="$(echo $TRACE_DIFF | cut -c1-5)"

    [[ $SHELL_IS_TRACING == true ]] && echo "TRACE: $@ ${COLOR_ARGUMENT}$TRACE_DIFF_ROUNDED${STYLE_RESET} seconds"
}
