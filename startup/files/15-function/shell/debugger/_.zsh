s-debugger() {
    _debuggerEnable() {
        s-user set SHELL_IS_DEBUGGER true
        SHELL_IS_DEBUGGER=true
    }
    _debuggerDisable() {
        s-user set SHELL_IS_DEBUGGER false
        SHELL_IS_DEBUGGER=false
    }
    _debuggerEnv() {
        s-not compiled && debug-info "Shell compiling..."
        s-is compiled && debug-success "Shell compiled!"
        s-not started && debug-info "Shell starting..."
        s-is started && debug-success "Shell started!"
        return $CODE_OK
    }
    case $1 in
        env)
            _debuggerEnv
            ;;
        enable)
            _debuggerEnable
            ;;
        disable)
            _debuggerDisable
            ;;
        *)
            echo-error "!!! Unknown debugger command: $1"
            ;;
    esac
}