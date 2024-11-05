s-git-set-email() {
    git config --global user.email "$1"
    s-git current-user
    return $CODE_OK
}