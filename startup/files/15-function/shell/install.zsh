function shell-install() {
    _cancel() {
        INSTALL_RUN_CANCEL=1
    }
    _install() {
        if [ -f "$SHELL_INSTALL_FILES_DIR/$function_name.zsh" ]; then
            source "$SHELL_INSTALL_FILES_DIR/$function_name.zsh"
            return $CODE_OK
        fi
        if [ -f "$SHELL_INSTALL_FILES_DIR/$function_name/install.zsh" ]; then
            source "$SHELL_INSTALL_FILES_DIR/$function_name/install.zsh"
            return $CODE_OK
        fi
        return $CODE_ERROR
    }
    _run() {
        local -r function_name="$1"
        INSTALL_RUN_CANCEL=0
        if [ -f "$SHELL_INSTALL_FILES_DIR/$function_name/prepare.zsh" ]; then
            source "$SHELL_INSTALL_FILES_DIR/$function_name/prepare.zsh"
        fi
        if [ $INSTALL_RUN_CANCEL -eq 1 ]; then
            debug-install "Installation of ${COLOR_ARGUMENT}$function_name${STYLE_RESET} was cancelled"
            return $CODE_OK
        fi
        _install $function_name
        if [ $? -eq 0 ]; then
            return $CODE_OK
        fi
        echo-error "Function $function_name not found"
        return $CODE_ERROR
    }
    _install_required() {
        debug-install "Installing required packages..."
        mkdir -p "$SHELL_PLUGINS_DIR"
        shell install zap
        shell install nvm
    }
    case $1 in
        cancel)
            _cancel ${@:2}
            ;;
        run)
            _run ${@:2}
            ;;
        required)
            _install_required ${@:2}
            ;;
        *)
            _run $@
            ;;
    esac
}