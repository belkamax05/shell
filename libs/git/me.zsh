s-git-me() {
    #? display info about git user
    echo-info "Directory: ${COLOR_ARGUMENT}$(pwd)${STYLE_RESET}"
    echo-info "Current user: ${COLOR_ARGUMENT}$(s-git current-user)${STYLE_RESET}"
    echo-info "Current branch: ${COLOR_ARGUMENT}$(s-git current-branch)${STYLE_RESET}"
    echo-info "Current commit: ${COLOR_ARGUMENT}$(s-git current-commit)${STYLE_RESET}"
    echo-info "Staged files: ${COLOR_ARGUMENT}$(s-git staged-files-count)${STYLE_RESET}. (${COLOR_ARGUMENT}git staged-files${STYLE_RESET} for details)"
    echo-info "Unstaged files: ${COLOR_ARGUMENT}$(s-git unstaged-files-count)${STYLE_RESET}. (${COLOR_ARGUMENT}git unstaged-files${STYLE_RESET} for details)"
    echo-info "Modified files: ${COLOR_ARGUMENT}$(s-git modified-files-count)${STYLE_RESET}. (${COLOR_ARGUMENT}git modified-files${STYLE_RESET} for details)"
    echo-info "Created files: ${COLOR_ARGUMENT}$(s-git created-files-count)${STYLE_RESET}. (${COLOR_ARGUMENT}git created-files${STYLE_RESET} for details)"
    echo-info "Deleted files: ${COLOR_ARGUMENT}$(s-git deleted-files-count)${STYLE_RESET}. (${COLOR_ARGUMENT}git deleted-files${STYLE_RESET} for details)"

    return $CODE_OK
}