s-git-set-email() {
    if [[ "$@" == *"--global"* ]]; then
        git config --global user.email "$1"
    else
        git config user.email "$1"
    fi
    s-git-current-user
    return $CODE_OK
}