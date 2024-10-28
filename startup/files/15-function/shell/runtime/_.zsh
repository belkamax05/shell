shell-runtime() {
    #!header
    s-run runtime-rt-header

    #? user-load
    s-run user load
    
    #? system
    if s-run is compiling; then
        s-run runtime-create-folders
        s-run runtime-install-plugins
        s-run linker dotfiles
        s-run linker configs
        s-run runtime-apply-tweaks
    fi

    #? plugins
    s-run runtime-nvm-configure
    s-run runtime-zap-plugins
    s-run runtime-fzf-configure

    #? completions
    s-run runtime-completions

    #? prompt
    s-run runtime-prompt-plugin
    s-run runtime-prompt-configure

    #? kali configure
    s-run runtime-kali

    #? keybindings
    s-run runtime-keybindings

    #? on-shell-runtime event
    if [ -n "$(declare -f on-shell-runtime)" ]; then
        on-shell-runtime
    fi

    s-run is compiling && s-run pather init
    
    #!footer
    s-run runtime-rt-footer
}