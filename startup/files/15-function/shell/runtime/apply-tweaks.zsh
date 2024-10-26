shell-runtime-apply-tweaks() {
    SHELL_USER_TWEAKS_COMPLETE=$(s-run user get SHELL_USER_TWEAKS_COMPLETE)
    if [[ $SHELL_USER_TWEAKS_COMPLETE != true ]]; then
        #? common tweaks
        s-run tweak apply sample-tweak
        #? linux only tweaks
        if s-run is linux; then
            for tweak in sudo-nopwd default-zsh gnome-no-logout-prompt dark-theme; do
                s-run tweak apply $tweak
            done
        fi
        s-run user set SHELL_USER_TWEAKS_COMPLETE true
    fi
}