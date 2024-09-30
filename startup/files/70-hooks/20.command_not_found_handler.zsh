function command_not_found_handler {
    local command="$1"
    local args="${@:2}"
    debug-function command_not_found_handler "Not found '${COLOR_ARGUMENT}$command${STYLE_RESET}'. Args: $args"

    if [ "$NOT_FOUND_SHELL_REDIRECT" = 1 ]; then
        debug-function-verbose command_not_found_handler "Redirecting to shell ${COLOR_ARGUMENT}$command${STYLE_RESET} ${COLOR_PARAMS}$args${STYLE_RESET}"
        shell $command $args
        if [ $? -eq 0 ]; then
            return 0
        fi
    fi

    echo-error command_not_found_handler "Not found '${COLOR_ARGUMENT}$command${STYLE_RESET}'"
    return 1
}
