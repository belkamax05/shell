shell-runtime() {
    #!header
    tracing "runtime start 1"
    s-run runtime-timer-start
    tracing "runtime start 2"
    s-run env init
    tracing "runtime start 3"
    s-run user load
    #!header
    tracing "runtime header done"
    #? system
    if s-run not compiled; then
        tracing "installing started"
        echo-info "Runtime started"
        s-run runtime-create-folders
        tracing "plugins init"
        s-run plugin-init
        tracing "plugins init done"
        [[ $SHELL_SKIP_INSTALL != true && $SHELL_INSTALL_REQUIRED == true ]] && source "$SHELL_CONFIGS_DIR/install-required.zsh"
        tracing "plugin 1"
        [[ $SHELL_SKIP_INSTALL != true && $SHELL_INSTALL_OPTIONAL == true ]] && source "$SHELL_CONFIGS_DIR/install-optional.zsh"
        tracing "plugin 2"
        [[ $SHELL_SKIP_INSTALL != true ]] && s-run linker dotfiles
        tracing "plugin 3"
        [[ $SHELL_SKIP_INSTALL != true ]] && s-run linker bin
        tracing "plugin 4"
        [[ $SHELL_SKIP_INSTALL != true ]] && s-run linker configs
        tracing "plugin 5"
        [[ $SHELL_SKIP_INSTALL != true ]] && s-run runtime-apply-tweaks
        tracing "installing done"
    else
        tracing "plugins init"
        s-run plugin-init
        tracing "plugins init done"
    fi
    tracing "install done"

    #? plugins
    s-run runtime-zap-plugins
    s-run runtime-fzf-configure

    tracing "plugins done"

    #? completions
    s-run runtime-completions

    tracing "completions done"

    #? prompt
    s-run runtime-prompt-plugin
    s-run runtime-prompt-configure

    tracing "prompts done"

    #? kali configure
    s-run runtime-kali

    tracing "kali done"

    #? keybindings
    s-run runtime-keybindings

    tracing "keybinds done"

    #? on-shell-runtime event
    if [ -n "$(declare -f on-shell-runtime)" ]; then
        on-shell-runtime
    fi
    tracing "on-shell-runtime done"

    s-run not compiled && s-pather init

    tracing "paths done"

    #!compile
    if s-run not compiled; then
        tracing "compiling..."
        echo-info "Runtime finished"
        s-run build
        s-run debugger env
        s-run runtime-timer-stop
        s-run reload
    else
        tracing "skipping compilation..."
        s-run debugger env
        s-run runtime-timer-stop
    fi
    #!compile
    tracing "compile done"
    
    #!footer
    tracing "runtime end"
    SHELL_IS_STARTED=true
    #!footer
}
