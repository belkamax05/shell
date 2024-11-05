s-git-sync() {
    git fetch --all
    git pull
    if [[ "$@" == *"--push"* ]]; then
        s-git-fast-push
    fi
    return $CODE_OK
}