shell-runtime-rt-footer() {
    echo-info "--- Runtime footer goes here"

    if [[ $STARTUP_COMPLETE == true ]]; then
        echo-info "Startup complete"
    else
        echo-info "Startup incomplete"
    fi

    echo-info "--- Runtime footer END."
}