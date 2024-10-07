shell-not-found() {
    _errorNF() {
        echo-error "'${COLOR_ARGUMENT}not-found${STYLE_RESET}'" $@
    }
    if [ $SHELL_IS_PROJECT -eq 1 ]; then
        shell project $@
        if [ $? -eq $CODE_OK ]; then
            return $CODE_OK
        elif [ $? -ne $CODE_NOT_FOUND ]; then
            _errorNF "Unknown project error $?. $@"
            return $?
        fi
    fi
    shell $@
    if [ $? -eq $CODE_OK ]; then
        return $CODE_OK
    elif [ $? -ne $CODE_NOT_FOUND ]; then
        _errorNF "Unknown error. $@"
        return $?
    fi
    _errorNF "Not found '${COLOR_ARGUMENT}$1${STYLE_RESET}'"
    return $CODE_NOT_FOUND
}