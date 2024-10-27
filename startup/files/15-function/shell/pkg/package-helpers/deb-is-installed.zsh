shell-deb-is-installed() {
    local -r package_name="$1"
    if dpkg-query -W -f='${Status}' $package_name 2>/dev/null | grep -q "install ok installed"; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}