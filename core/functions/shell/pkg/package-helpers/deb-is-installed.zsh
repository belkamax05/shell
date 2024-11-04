shell-deb-is-installed() {
    local -r package_name="$1"
    dpkg-query -W -f='${Status}' $package_name 2>/dev/null | grep -q "install ok installed" && return $CODE_OK
    # dpkg -l | grep -q $pkg_name && echo "Deb2" && return $CODE_OK
    return $CODE_ERROR
}
