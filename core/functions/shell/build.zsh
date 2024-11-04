s-build() {
    _buildShell() {
        echo-error "TODO _buildShell is legacy"
        # rm -rf $SHELL_LIBS_DIST_DIR
        # mkdir -p $SHELL_LIBS_DIST_DIR
        # s-run files build $SHELL_STARTUP_FILES_DIR $SHELL_STARTUP_FILE
    }
    local command=$1
    case $command in
        shell)
            _buildShell ${@:2}
            ;;
        files)
            s-run files build ${@:2}
            ;;
        *)
            _buildShell $@
            ;;
    esac
}
