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
        [[ $SHELL_SKIP_INSTALL != true && $SHELL_INSTALL_REQUIRED == true ]] && source "$SHELL_CONFIGS_DIR/install-required.zsh"
        [[ $SHELL_SKIP_INSTALL != true && $SHELL_INSTALL_OPTIONAL == true ]] && source "$SHELL_CONFIGS_DIR/install-optional.zsh"
        [[ $SHELL_SKIP_INSTALL != true ]] && s-run linker dotfiles
        [[ $SHELL_SKIP_INSTALL != true ]] && s-run linker bin
        [[ $SHELL_SKIP_INSTALL != true ]] && s-run linker configs
        [[ $SHELL_SKIP_INSTALL != true ]] && s-run runtime-apply-tweaks
    else
        s-run plugin-init
    fi

    #? plugins
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

    #!compile
    if s-run not compiled; then
        echo-info "Runtime finished"
        s-run build
        s-run debugger env
        s-run runtime-timer-stop
        s-run reload
    else
        s-run debugger env
        s-run runtime-timer-stop
    fi
    #!compile
    
    #!footer
    SHELL_IS_STARTED=true
    #!footer
}
