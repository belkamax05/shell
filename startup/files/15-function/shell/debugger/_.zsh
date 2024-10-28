shell-debugger() {
    _debuggerEnv() {
        s-run not compiled && echo-info "!!! Compiling"
        s-run is compiled && echo-info "!!! Compiled"
        s-run not started && echo-info "!!! Starting"
        s-run is started && echo-info "!!! Started"
        return $CODE_OK
    }
    case $1 in
        env)
            _debuggerEnv
            ;;
        *)
            echo-error "!!! Unknown debugger command: $1"
            ;;
    esac
}