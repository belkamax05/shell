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
s-is-compiled() {
    if [[ $SHELL_IS_COMPILED == true ]]; then
        return $CODE_OK
    else
        return $CODE_ERROR
    fi
}