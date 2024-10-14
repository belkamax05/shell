function shell-cmd() {
    local command=$1
    if [ -z "$command" ]; then
        echo-error "shell: command is required. See 'shell help'."
        return $CODE_ERROR
    fi

    #? run via 'shell-$command'
    if [ -n "$(declare -f shell-$command)" ]; then
        shell-$command ${@:2}
        local _status=$?
        if [ $_status -ne $CODE_OK ] && [ $_status -ne $CODE_NOT_FOUND ]; then
            echo-error "'${COLOR_ARGUMENT}shell $command${STYLE_RESET}' failed. Status: $_status"
            
        fi
        return $_status
        
    fi

    #? run via '$command'
    if [ -n "$(declare -f $command)" ]; then
        $command  ${@:2}
        local _status=$?
        if [ $_status -ne $CODE_OK ] && [ $_status -ne $CODE_NOT_FOUND ]; then
            echo-error "'${COLOR_ARGUMENT}shell $command${STYLE_RESET}' failed. Status: $_status"
        fi
        return $_status
    fi

    #? run from libs
    if [ -d "$SHELL_LIBS_SRC_DIR/$command" ]; then
        shell-lib run $command ${@:2}
        local _status=$?
        if [ $_status -ne $CODE_OK ] && [ $_status -ne $CODE_NOT_FOUND ]; then
            echo-error "'${COLOR_ARGUMENT}shell lib $command${STYLE_RESET}' failed. Status: $_status"
        fi
        return $_status
    fi
    return $CODE_NOT_FOUND
}