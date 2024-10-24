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
    shell-is verbose && echo "$@"
}
verbose-error() {
    shell-is verbose && echo-error "$@"
}
verbose-success() {
    shell-is verbose && echo-success "$@"
}
verbose-debug() {
    shell-is verbose && echo-debug "$@"
}
verbose-info() {
    shell-is verbose && echo-info "$@"
}