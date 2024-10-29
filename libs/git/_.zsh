shell-git() {
    local _cmd=$1

    if [[ -z $_cmd ]]; then
        echo-error "Empty command for shell-git"
        return $CODE_ERROR
    fi
    s-run git-$_cmd ${@:2}
}