s-git-staged-files() {
    git diff --name-only --cached
    return $CODE_OK
}

s-git-staged-files-count() {
    s-git staged-files | wc -l
    return $CODE_OK
}