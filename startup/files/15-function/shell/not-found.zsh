shell-not-found() {
    if [ $SHELL_IS_PROJECT -eq 1 ]; then
        shell project $@
        if [ $? -eq $CODE_OK ]; then
            return $CODE_OK
        elif [ $? -ne $CODE_NOT_FOUND ]; then
            debug-function not-found "Unknown error. $@"
            return $?
        fi
    fi
    shell $@
    if [ $? -eq $CODE_OK ]; then
        return $CODE_OK
    elif [ $? -ne $CODE_NOT_FOUND ]; then
        debug-function not-found "Unknown error. $@"
        return $?
    fi
    debug-function not-found "Not found '${COLOR_ARGUMENT}$1${STYLE_RESET}'"
    return $CODE_NOT_FOUND
}