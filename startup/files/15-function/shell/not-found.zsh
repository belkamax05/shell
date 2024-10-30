s-not-found() {
    _errorNF() {
        echo-error "${COLOR_COMMAND}not-found${STYLE_RESET}" $@
    }
    if [[ $SHELL_IS_PROJECT -eq 1 ]]; then
        s-project $@
        local _status=$?
        if [[ $_status -eq $CODE_OK ]]; then
            return $CODE_OK
        elif [[ $_status -ne $CODE_NOT_FOUND ]]; then
            _errorNF "Project run error '${COLOR_ARGUMENT}$_status${STYLE_RESET}'. Arguments $@"
            return $_status
        fi
    fi
    s-run $@
    local _status=$?
    if [[ $_status -eq $CODE_OK ]]; then
        return $CODE_OK
    elif [[ $_status -ne $CODE_NOT_FOUND ]]; then
        _errorNF "Unknown error ($_status). Arguments $@"
        return $_status
    fi
    _errorNF "Not found '${COLOR_ARGUMENT}$1${STYLE_RESET}'"
    return $CODE_NOT_FOUND
}