function shell() {
    local command=$1

    local existsRegularFunction=$(declare -f shell-$command)
    if [ -n "$existsRegularFunction" ]; then
        shift
        shell-$command $@
        return
    fi

    echo-error "shell: '$command' is not a valid command. See 'shell help'."
}