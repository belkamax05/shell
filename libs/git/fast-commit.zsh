shell-git-fast-commit() {
    git commit --no-verify -m "$1" ${@:2}
}