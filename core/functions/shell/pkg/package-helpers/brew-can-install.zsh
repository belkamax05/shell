shell-brew-can-install() {
    if brew info "$1" >/dev/null 2>&1; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}