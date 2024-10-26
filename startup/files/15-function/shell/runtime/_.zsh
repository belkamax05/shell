shell-runtime() {
    echo-info "New runtime running..."
    s-run runtime-create-folders
    s-run runtime-install-plugins
    s-run runtime-link-dotfiles
    s-run runtime-apply-tweaks

    s-run runtime-nvm-configure
    s-run runtime-zap-plugins
    s-run runtime-fzf-configure
    
    echo-success "Runtime ready."
}