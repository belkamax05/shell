function shell-build() {
    _shell() {
        shell files build $SHELL_STARTUP_FILES_DIR $SHELL_STARTUP_FILE
    }

    debug-function shell-build $@
    local command=$1
    case $command in
        shell)
            _shell ${@:2}
            ;;
        files)
            shell files build ${@:2}
            ;;
        *)
            shell build shell $@
            ;;
    esac
}
