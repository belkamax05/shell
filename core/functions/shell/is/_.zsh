s-is() {
    if [ $# -eq 0 ]; then
        return $CODE_NOT_FOUND
    fi
    s-is-$1 ${@:2}
}
