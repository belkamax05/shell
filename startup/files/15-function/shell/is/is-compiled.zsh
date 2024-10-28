shell-is-compiled() {
    if [[ $SHELL_IS_COMPILED == true ]]; then
        return $CODE_OK
    else
        return $CODE_ERROR
    fi
}