function shell-event() {
    local event=$1
    if [ -f "$SHELL_EVENTS_DIR/$event.zsh" ]; then
        shift
        source "$SHELL_EVENTS_DIR/$event.zsh" $@
    else
        echo-error "shell-event: '$event' is not a valid event."
    fi
}

function shell-ev() {
    shell-event $@
}