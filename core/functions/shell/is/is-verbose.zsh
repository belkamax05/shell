s-is-verbose() {
    if [[ $SHELL_IS_VERBOSE == true ]] || [[ $SHELL_FORCE_VERBOSE == true ]]; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}