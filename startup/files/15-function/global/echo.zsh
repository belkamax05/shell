echo-error() {
    echo "$SHELL_PREFFIX_ERROR $@"
}
echo-success() {
    echo "$SHELL_PREFFIX_SUCCESS $@"
}
echo-debug() {
    echo "$SHELL_PREFFIX_DEBUG $@"
}
echo-info() {
    echo "$SHELL_PREFFIX_INFO  $@"
    #? extra space added due tu issue with emoji width
}
echo-warning() {
    echo "$SHELL_PREFFIX_WARNING $@"
}

verbose-echo() {
    s-run is verbose && echo "$@"
}
verbose-error() {
    s-run is verbose && echo-error "$@"
}
verbose-success() {
    s-run is verbose && echo-success "$@"
}
verbose-debug() {
    s-run is verbose && echo-debug "$@"
}
verbose-info() {
    s-run is verbose && echo-info "$@"
}
verbose-warning() {
    s-run is verbose && echo-warning "$@"
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
compiling-debug() {
    s-run not compiled && echo-debug "$@"
}
compiling-info() {
    s-run not compiled && echo-info "$@"
}
compiling-warning() {
    s-run not compiled && echo-warning "$@"
}



debug() {
    s-run is debug && echo-debug "$@"
}
debug-command() {
    debug "${COLOR_COMMAND}[$1]${STYLE_RESET}: ${@:2}"
}
debug-error() {
    s-run is debug && echo-error "DEBUG: $@"
}
debug-info() {
    s-run is debug && echo-info "DEBUG: $@"
}
debug-success() {
    s-run is debug && echo-success "DEBUG: $@"
}