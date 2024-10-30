s-git() {
    local _cmd=$1

    if [[ -z $_cmd ]]; then
        echo-error "Empty command for s-git"
        return $CODE_ERROR
    fi
    s-git-$_cmd ${@:2}
}