shell-brew-can-install() {
    if brew list --formula | grep -q $1; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}