s-not() {
    if s-is $@; then
        return $CODE_ERROR
    else
        return $CODE_OK
    fi
}
