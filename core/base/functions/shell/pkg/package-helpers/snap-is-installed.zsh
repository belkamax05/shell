shell-snap-is-installed() {
    local -r package_name="$1"
    if snap list | grep -q "^$package_name "; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}