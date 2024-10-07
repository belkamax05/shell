function command_not_found_handler {
    local command="$1"
    if [ "$STARTUP_COMPLETE" = 1 ]; then
        shell not-found $@
        if [ $? -eq $CODE_OK ]; then
            return $CODE_OK
        elif [ $? -eq $CODE_NOT_FOUND ]; then
            echo-error command_not_found_handler "Not found '${COLOR_ARGUMENT}$command${STYLE_RESET}'."
            return $CODE_NOT_FOUND
        else
            echo-error command_not_found_handler "Unknown error. Args: $@"
            return $?
        fi
    fi
    echo-error command_not_found_handler "Not found '${COLOR_ARGUMENT}$command${STYLE_RESET}'"
    return $CODE_NOT_FOUND
}
