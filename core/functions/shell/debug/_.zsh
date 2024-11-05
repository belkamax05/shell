s-debug() {
    _debuggerSet() {
        s-user set SHELL_IS_DEBUG $1
        SHELL_IS_DEBUG=$1
    }
    _debuggerEnv() {
        s-not compiled && debug info "Shell compiling..."
        s-is compiled && debug success "Shell compiled!"
        s-not started && debug info "Shell starting..."
        s-is started && debug success "Shell started!"
        return $CODE_OK
    }
    case $1 in
        env)
            _debuggerEnv
            ;;
        enable)
            _debuggerSet true
            ;;
        disable)
            _debuggerSet false
            ;;
        *)
            echo-error "!!! Unknown debugger command: $1"
            ;;
    esac
}