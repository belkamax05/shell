s-is() {
    if [ $# -eq 0 ]; then
        return $CODE_NOT_FOUND
    fi
    s-is-$1 ${@:2}
}

s-is-darwin() {
    [[ "$SHELL_UNAME" == "Darwin" ]]
}
s-is-linux() {
    [[ "$SHELL_UNAME" == "Linux" ]]
}
s-is-tracing() {
    if [[ $SHELL_IS_TRACING == true ]]; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}