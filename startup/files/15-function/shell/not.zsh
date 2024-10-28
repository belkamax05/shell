shell-not() {
    if s-run is $@; then
        return $CODE_ERROR
    else
        return $CODE_OK
    fi
}
