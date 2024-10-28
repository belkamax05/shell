shell-runtime-apply-tweaks() {
    #? common tweaks
    s-run tweak apply sample-tweak
    #? linux only tweaks
    if s-run is linux; then
        for tweak in sudo-nopwd default-zsh gnome-no-logout-prompt dark-theme; do
            s-run tweak apply $tweak
        done
    fi
}