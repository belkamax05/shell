function shell() {
    local command=$1
    if [ -n "$(declare -f shell-$command)" ]; then
        shift
        shell-$command $@
        return 0
    fi

    if [ -n "$(declare -f $command)" ]; then
        shift
        $command $@
        return 0
    fi

    echo-error "shell: '$command' is not a valid command. See 'shell help'."
    return 1
}