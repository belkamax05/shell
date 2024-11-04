s-pkg-install-optional() {
    echo-info "Installing ${COLOR_CYAN}OPTIONAL${STYLE_RESET} packages"
    _installPackages=""
    if s-is linux; then
        _installPackages="$_installPackages build-essential procps twingate chrome java erdtree"
        _installPackages="$_installPackages gnome-browser-connector gnome-tweaks gnome-shell-extension-installer gnome-shell-extension-prefs"
        _installPackages="$_installPackages ulauncher teams-for-linux whatsapp-linux-app raindrop slack spotify"
        _installPackages="$_installPackages docker docker-desktop meslo-fonts warp-terminal yazi chatgpt-desktop"
        _installPackages="$_installPackages gnome-shell-extension-installer gnome-shell-extension-prefs notion-app libfuse2t64"
    fi

    packages_array=(${=_installPackages})
    for package in "${packages_array[@]}"; do
        s-install $package
    done

    if s-is linux; then
        s-install outlook-for-linux --edge
    fi
}