#!compile
if s-not compiled; then
    tracing "compiling..."
    echo-info "Runtime finished"
    s-run build
    s-debugger env
    s-run runtime-timer-stop
    s-run reload
else
    tracing "skipping compilation..."
    s-debugger env
    s-run runtime-timer-stop
fi
tracing "compile done"
#!compile