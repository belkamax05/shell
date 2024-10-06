function shell() {
    local command=$1
    if [ -n "$(declare -f shell-$command)" ]; then
        shift
        shell-$command $@
        if [ $? -ne 0 ]; then
            echo-error "shell: '$command' failed."
            # exit $CODE_ERROR
        fi
        return $?
    fi

    if [ -n "$(declare -f $command)" ]; then
        shift
        $command $@
        if [ $? -ne 0 ]; then
            echo-error "shell: $command' failed."
            # exit $CODE_ERROR
        fi
        return $?
    fi

    echo-error "shell: '$command' is not a valid command. See 'shell help'."
    return $CODE_ERROR
}