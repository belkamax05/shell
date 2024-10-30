shell-runtime-apply-tweaks() {
    #? common tweaks
    for tweak in  sample-tweak sudo-nopwd; do
        s-run tweak apply $tweak
    done
    #? linux only tweaks
    if s-run is linux; then
        for tweak in default-zsh gnome-no-logout-prompt dark-theme; do
            s-run tweak apply $tweak
        done
    fi
}