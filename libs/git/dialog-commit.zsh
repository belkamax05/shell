shell-git-dialog-commit() {
    # local branch=$(shell-git-current-branch)
    # local commit=$(shell-git-current-commit)
    # local message=$(dialog --stdout --inputbox "Commit message" 0 0 "$commit")
    # if [ -n "$message" ]; then
    #     shell-git-fast-commit "$message"
    # fi
    s-run git me
    return $CODE_OK
}