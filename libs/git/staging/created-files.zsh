shell-git-created-files() {
    git ls-files --others --exclude-standard
}

shell-git-created-files-count() {
    s-run git created-files | wc -l
    return $CODE_OK
}