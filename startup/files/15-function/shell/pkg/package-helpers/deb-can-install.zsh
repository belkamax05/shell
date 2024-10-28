shell-deb-can-install() {
    if apt-cache show $1 >/dev/null 2>&1; then
        return $CODE_OK
    fi
    if [[ -f $1 ]]; then
        return $CODE_OK
    fi
    return $CODE_NOT_FOUND
}