s-is-started() {
    if [[ $SHELL_IS_STARTED == true ]]; then
        return $CODE_OK
    else
        return $CODE_ERROR
    fi
}