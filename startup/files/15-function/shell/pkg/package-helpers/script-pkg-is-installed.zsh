shell-script-pkg-is-installed() {
    local -r package_name="$1"
    if [[ $(s-run script-pkg-get-installed $package_name) == true ]]; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}