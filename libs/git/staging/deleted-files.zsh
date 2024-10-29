shell-git-deleted-files() {
    git diff --diff-filter=D --name-only
}

shell-git-deleted-files-count() {
    s-run git deleted-files | wc -l
    return $CODE_OK
}