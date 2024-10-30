s-git-deleted-files() {
    git diff --diff-filter=D --name-only
}

s-git-deleted-files-count() {
    s-git deleted-files | wc -l
    return $CODE_OK
}