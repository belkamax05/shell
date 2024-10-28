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