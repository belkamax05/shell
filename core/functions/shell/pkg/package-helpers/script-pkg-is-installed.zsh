shell-script-pkg-is-installed() {
    local -r package_name="$1"
    if [[ -f "$SHELL_INSTALL_DIR/$pkg_name/is_installed.zsh" ]]; then
        source "$SHELL_INSTALL_DIR/$pkg_name/is_installed.zsh"
        local _status=$?
        if [[ $_status -eq 0 ]]; then
            return $CODE_OK
        fi
    fi
    return $CODE_ERROR
}