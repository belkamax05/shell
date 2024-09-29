function event-fast-event() {
    echo-success "This is fast ${COLOR_COMMAND}EVENT${STYLE_RESET} with args: $@"
}

event-fast-event "$@"