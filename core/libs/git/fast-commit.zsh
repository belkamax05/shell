s-git-fast-commit() {
    git commit --no-verify -m "$1" ${@:2}
    if [[ "$@" == *"--sync"* ]]; then
        s-git-sync
    fi
}