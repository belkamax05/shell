shell-is-debugger() {
    if [[ $SHELL_IS_DEBUGGER == true ]]; then
        return $CODE_OK
    else
        return $CODE_ERROR
    fi
}