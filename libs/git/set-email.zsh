shell-git-set-email() {
    git config --global user.email "$1"
    s-run git current-user
    return $CODE_OK
}