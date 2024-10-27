shell-brew-is-installed() {
    local -r package_name="$1"
    if brew list -1 | grep -q "^$package_name\$"; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}