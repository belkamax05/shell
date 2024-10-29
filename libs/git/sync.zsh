shell-git-sync() {
    git fetch --all
    git pull
    if [[ "$@" == *"--push"* ]]; then
        s-run git fast-push
    fi
    return $CODE_OK
}