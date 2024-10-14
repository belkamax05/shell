function command_not_found_handler {
    local command="$1"
    if [ "$STARTUP_COMPLETE" = 1 ]; then
        shell-not-found $@
        local _status=$?
        return $_status
    fi
    echo-error "${COLOR_COMMAND}command_not_found_handler${STYLE_RESET}" "Not found '${COLOR_ARGUMENT}$command${STYLE_RESET}'"
    return $CODE_NOT_FOUND
}
