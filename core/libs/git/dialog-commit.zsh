s-git-dialog-commit() {
    _commitMessage="$1"
    if [[ $_commitMessage == "" ]]; then
        _commitMessage=$(gum input --header "Commit message")
    fi
    if [[ "$@" == *"--flow"* ]]; then
        _commitFlowMode=$(gum choose "feat" "fix" "hotfix" --header "GitFlow Commit mode")
        _commitMessage=$(gum input --header "Commit message" --value="DFS2-00000: $_commitFlowMode: $_commitMessage")
    fi
    _stagedCount=$(s-git staged-files-count)
    s-git me
    echo-warning "Commit ${COLOR_ARGUMENT}$_stagedCount${STYLE_RESET} files with message ${COLOR_ARGUMENT}$_commitMessage${STYLE_RESET}"
    if gum confirm "Do you want to commit?"; then
        s-git fast-commit $@
        s-git me
    fi
    return $CODE_OK
}