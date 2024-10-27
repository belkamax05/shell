shell-script-pkg-get-installed() {
    echo $(s-run config-file get $SHELL_SHARED_DIR/.script-install-config $@)
}