function event-fast-event() {
    echo-success "This is fast event with args: $@"
}

event-fast-event "$@"