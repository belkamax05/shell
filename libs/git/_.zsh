s-git() {
    if [[ -z $1 ]]; then
        echo-error "Empty command for s-git"
        return $CODE_ERROR
    fi
    s-git-$1 ${@:2}
}