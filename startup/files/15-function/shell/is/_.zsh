shell-is() {
    _shellIsCompiled() {
        if [[ $SHELL_IS_COMPILED == true ]]; then
            return $CODE_OK
        else
            return $CODE_ERROR
        fi
    }
    _shellIsCompiling() {
        if [[ $SHELL_IS_COMPILED != true ]]; then
            return $CODE_OK
        else
            return $CODE_ERROR
        fi
    }
    _shellIsStarted() {
        if [[ $SHELL_IS_STARTED == true ]]; then
            return $CODE_OK
        else
            return $CODE_ERROR
        fi
    }
    _shellIsStarting() {
        if [[ $SHELL_IS_STARTED != true ]]; then
            return $CODE_OK
        else
            return $CODE_ERROR
        fi
    }
    case $1 in
        verbose)
            _shellIsVerbose
            ;;
        linux)
            _shellIsLinux
            ;;
        darwin)
            _shellIsDarwin
            ;;
        macos)
            _shellIsDarwin
            ;;
        compiled)
            _shellIsCompiled
            ;;
        compiling)
            _shellIsCompiling
            ;;
        started)
            _shellIsStarted
            ;;
        starting)
            _shellIsStarting
            ;;
        *)
            return 1
            ;;
    esac
}
