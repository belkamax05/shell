s-git-modified-files() {
    git diff --name-only
    return $CODE_OK
}

s-git-modified-files-count() {
    s-git modified-files | wc -l
    return $CODE_OK
}