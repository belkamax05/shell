# SHELL_LIBS_SRC_DIR="$SHELL_DIR/libs"
# SHELL_LIBS_DIST_DIR="$SHELL_CACHE_DIR/libs"

shell-lib() {
    _compileLib() {
        s-run files build $SHELL_LIBS_SRC_DIR/$1 $SHELL_LIBS_DIST_DIR/$1.zsh
    }
    _includeLib() {
        if [ ! -f $SHELL_LIBS_DIST_DIR/$1.zsh ]; then
            _compileLib $1
        fi
        source $SHELL_LIBS_DIST_DIR/$1.zsh
    }
    _runLib() {
        _includeLib $1
        s-run $1 ${@:2}
        return $?
    }

    case $1 in
        compile)
            _compileLib ${@:2}
            return $?
            ;;
        include)
            _includeLib ${@:2}
            return $?
            ;;
        run)
            _runLib ${@:2}
            return $?
            ;;
        *)
            _runLib $@
            return $?
            ;;
    esac
}