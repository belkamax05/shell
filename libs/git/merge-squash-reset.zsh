shell-git-merge-squash-reset() {
    git merge --no-commit --squash $1
    git reset HEAD
    return $CODE_OK
}