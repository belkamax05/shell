s-git-current-commit() {
    git log -1 --pretty=format:"%h %s"
}