git-command-me() {
    #? display info about git user
    local _user=$(git config user.name)
    local _status=$?
    if [ $_status -ne 0 ]; then
        echo-error "git-command-me error ($_status). Arguments: $@"
        return $_status
    fi
    #? display info about current git branch
    local _branch=$(git branch --show-current)
    local _status=$?
    if [ $_status -ne 0 ]; then
        echo-error "git-command-me error ($_status). Arguments: $@"
        return $_status
    fi
    echo-info "Current branch: ${COLOR_ARGUMENT}$_branch${STYLE_RESET}"
    #? display info about current git commit
    local _commit=$(git log -1 --pretty=format:"%h %s")
    _status=$?
    if [ $_status -ne 0 ]; then
        echo-error "git-command-me error ($_status). Arguments: $@"
        return $_status
    fi
    echo-info "Current commit: ${COLOR_ARGUMENT}$_commit${STYLE_RESET}"
    return $CODE_OK
}