shell-debugger() {
    _debuggerEnable() {
        s-run user set SHELL_IS_DEBUGGER true
        SHELL_IS_DEBUGGER=true
    }
    _debuggerDisable() {
        s-run user set SHELL_IS_DEBUGGER false
        SHELL_IS_DEBUGGER=false
    }
    _debuggerEnv() {
        s-run not compiled && debug-info "Shell compiling..."
        s-run is compiled && debug-success "Shell compiled!"
        s-run not started && debug-info "Shell starting..."
        s-run is started && debug-success "Shell started!"
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