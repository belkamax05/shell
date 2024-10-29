shell-git-modified-files() {
    git diff --name-only
    return $CODE_OK
}

shell-git-modified-files-count() {
    s-run git modified-files | wc -l
    return $CODE_OK
}