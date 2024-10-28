shell-debugger() {
    _debuggerEnv() {
        s-run is compiling && echo-info "!!! Compiling"
        s-run is compiled && echo-info "!!! Compiled"
        s-run is starting && echo-info "!!! Starting"
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