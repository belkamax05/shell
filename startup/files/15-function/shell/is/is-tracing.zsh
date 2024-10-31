
s-is-tracing() {
    if [[ $SHELL_IS_TRACING == true ]]; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}