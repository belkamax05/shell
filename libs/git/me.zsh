shell-git-me() {
    #? display info about git user
    echo-info "Current user: ${COLOR_ARGUMENT}$(s-run git current-user)${STYLE_RESET}"
    echo-info "Current branch: ${COLOR_ARGUMENT}$(s-run git current-branch)${STYLE_RESET}"
    echo-info "Current commit: ${COLOR_ARGUMENT}$(s-run git current-commit)${STYLE_RESET}"
    return $CODE_OK
}