shell-is-source() {
    if [[ $SHELL_IS_SOURCE == true ]]; then
        return $CODE_OK
    else
        return $CODE_ERROR
    fi
}