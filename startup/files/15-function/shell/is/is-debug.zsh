s-is-debug() {
    if [[ $SHELL_IS_DEBUG == true ]]; then
        return $CODE_OK
    else
        return $CODE_ERROR
    fi
}