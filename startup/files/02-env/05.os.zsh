SHELL_OS="$(uname -s)"
SHELL_UNAME="$(uname -s)"

_shellIsLinux() {
    [ "$SHELL_UNAME" = "Linux" ]
}
_shellIsDarwin() {
    [ "$SHELL_UNAME" = "Darwin" ]
}
