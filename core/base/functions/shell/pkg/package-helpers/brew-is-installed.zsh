shell-brew-is-installed() {
    local -r package_name="$1"
    brew list -1 | grep -q "^$package_name\$" && return $CODE_OK
    return $CODE_ERROR
}