shell-runtime-install-plugins() {
    SHELL_INSTALL_COMPLETE=$(s-run user get SHELL_INSTALL_COMPLETE)
    if [[ $SHELL_INSTALL_COMPLETE != true ]]; then
        for package in curl file git zap mvn fzf lsd neofetch fd-find; do
            s-run install2 $package
        done
        if s-run is linux; then
            #? old: chrome-gnome-shell
            for package in chrome gnome-browser-connector build-essential procps twingate java gnome-tweaks snapd ulauncher docker-cli docker-desktop  gnome-shell-extension-installer gnome-shell-extension-prefs; do
                s-run install2 $package
            done
            s-run install2 outlook-for-linux --edge
            for package in teams-for-linux whatsapp-linux-app raindrop slack spotify; do
                s-run install2 $package
            done
        fi
        s-run user set SHELL_INSTALL_COMPLETE true
    fi
}