function shell-install-cancel() {
    INSTALL_RUN_CANCEL=1
}

function shell-install-install() {
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

function shell-install-run() {
    local -r function_name="$1"
    INSTALL_RUN_CANCEL=0
    if [ -f "$SHELL_INSTALL_FILES_DIR/$function_name/prepare.zsh" ]; then
        source "$SHELL_INSTALL_FILES_DIR/$function_name/prepare.zsh"
    fi
    if [ $INSTALL_RUN_CANCEL -eq 1 ]; then
        debug-install "Installation of ${COLOR_ARGUMENT}$function_name${STYLE_RESET} was cancelled"
        return $CODE_OK
    fi
    shell-install-install $function_name
    if [ $? -eq 0 ]; then
        return $CODE_OK
    fi
    echo-error "Function $function_name not found"
    return $CODE_ERROR
}

function shell-install() {
    local function_name="$1"
    case $function_name in
        cancel)
            shell-install-cancel ${@:2}
            ;;
        run)
            shell-install-run ${@:2}
            ;;
        *)
            shell-install-run $@
            ;;
    esac
}