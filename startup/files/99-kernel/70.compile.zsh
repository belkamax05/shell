if [ "$STARTUP_RUNS_FROM_SOURCE" = 1 ]; then
    debug-info "Compiling shell startup files"
    shell build
    exec zsh
fi