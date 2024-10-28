shell-runtime() {
    #!header
    s-run runtime-timer-start
    s-run env init
    s-run user load
    #!header
    
    #? system
    if s-run not compiled; then
        echo-info "Runtime started"
        s-run runtime-create-folders
        s-run plugin-init
        source "$SHELL_CONFIGS_DIR/install-required.zsh"
        [[ $SHELL_INSTALL_OPTIONAL == true ]] && source "$SHELL_CONFIGS_DIR/install-optional.zsh"
        s-run linker dotfiles
        s-run linker configs
        s-run runtime-apply-tweaks
    else
        s-run plugin-init
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

    s-run not compiled && s-run pather init

    s-run debugger env
    #!compile
    if s-run not compiled; then
        echo-info "Runtime finished"
        s-run build
        s-run reload
    fi
    s-run runtime-timer-stop
    #!compile
    
    #!footer
    SHELL_IS_STARTED=true
    #!footer
}

shell-runtime
