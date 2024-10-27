shell-runtime() {
    #!header
    s-run runtime-rt-header
    
    #? system
    s-run runtime-create-folders
    s-run runtime-install-plugins
    s-run linker dotfiles
    s-run linker configs
    s-run runtime-apply-tweaks

    #? plugins
    s-run runtime-nvm-configure
    s-run runtime-zap-plugins
    s-run runtime-fzf-configure
    
    #!footer
    s-run runtime-rt-footer
}