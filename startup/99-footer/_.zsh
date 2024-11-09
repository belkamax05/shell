tracing "Startup completed"
SHELL_IS_STARTED=true
if [[ $PRINT_TIME_NEXT_RUN == true ]]; then
    s-run user set PRINT_TIME_NEXT_RUN false
    s-timer stop zshenv "Zshenv runtime: " " seconds"
    s-timer stop startup "Startup runtime: " " seconds"
fi
