function shell() {
    shell-cmd $@
    local _status=$?
    if [ $_status -eq $CODE_OK ]; then
        return $CODE_OK
    fi
    if [ $_status -eq $CODE_NOT_FOUND ]; then
        shell-not-found $@
        return $?
    fi
    if [ $_status -ne $CODE_OK ] && [ $_status -ne $CODE_NOT_FOUND ]; then
        echo-error "${COLOR_COMMAND}shell $command${STYLE_RESET} error ($_status). Arguments: $@"
    fi
    return $_status
}