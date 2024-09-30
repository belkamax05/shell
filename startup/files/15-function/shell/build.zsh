function shell-build() {
    debug-function shell-build $@
    build-zsh-files $SHELL_STARTUP_FILES_DIR $SHELL_STARTUP_FILE
}
