function command_not_found_handler {
    local command="$1"
    if s-is compiled; then
        s-not-found $@
        local _status=$?
        return $_status
    fi
    echo-error "${COLOR_COMMAND}command_not_found_handler${STYLE_RESET}" "Not found '${COLOR_ARGUMENT}$command${STYLE_RESET}'"
    return $CODE_NOT_FOUND
}