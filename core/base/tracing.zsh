s-tracing() {
    s-not tracing && return $CODE_OK
    local diffTime=$(s-timer diff tracing)
    echo "${COLOR_WHITE}$diffTime ${STYLE_RESET} $@"
}
tracing() {
    s-tracing $@
}