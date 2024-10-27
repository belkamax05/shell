shell-snap-can-install() {
    if snap find $1 | grep -q "^$1 "; then
        return $CODE_OK
    fi
    return $CODE_NOT_FOUND
}