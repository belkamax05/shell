shell-git-staged-files() {
    git diff --name-only --cached
    return $CODE_OK
}

shell-git-staged-files-count() {
    s-run git staged-files | wc -l
    return $CODE_OK
}