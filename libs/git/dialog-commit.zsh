shell-git-dialog-commit() {
    # local branch=$(shell-git-current-branch)
    # local commit=$(shell-git-current-commit)
    # local message=$(dialog --stdout --inputbox "Commit message" 0 0 "$commit")
    # if [ -n "$message" ]; then
    #     shell-git-fast-commit "$message"
    # fi
    _commitMessage="$1"
    if [[ "$@" == *"--flow"* ]]; then
        _commitFlowMode=$(gum choose "feat" "fix" "hotfix" --header "GitFlow Commit mode")
        _commitMessage=$(gum input --header "Commit message" --value="DFS2-00000: $_commitFlowMode: $_commitMessage")
    fi
    s-run git me
    echo-warning "Commit message is ${COLOR_ARGUMENT}$_commitMessage${STYLE_RESET}"
    if gum confirm "Do you want to commit?"; then
        s-run git fast-commit $_commitMessage
        s-run git me
    fi
    return $CODE_OK
}