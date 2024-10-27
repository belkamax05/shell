shell-deb-can-install() {
    if apt-cache show $package_name >/dev/null 2>&1; then
        return $CODE_OK
    fi
    if [[ -f $package_name ]]; then
        return $CODE_OK
    fi
    return $CODE_NOT_FOUND
}