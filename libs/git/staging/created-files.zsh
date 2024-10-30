s-git-created-files() {
    git ls-files --others --exclude-standard
}

s-git-created-files-count() {
    s-git created-files | wc -l
    return $CODE_OK
}