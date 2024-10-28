echo-info "Installing ${COLOR_CYAN}OPTIONAL${STYLE_RESET} packages"
_installPackages=""
if s-run is linux; then
    _installPackages="$_installPackages build-essential procps twingate chrome java"

    _installPackages="$_installPackages gnome-browser-connector gnome-tweaks gnome-shell-extension-installer gnome-shell-extension-prefs"

    _installPackages="$_installPackages ulauncher teams-for-linux whatsapp-linux-app raindrop slack spotify"

    _installPackages="$_installPackages docker-cli docker-desktop"


    _installPackages="$_installPackages gnome-shell-extension-installer
    gnome-shell-extension-prefs "
fi

packages_array=(${=_installPackages})
for package in "${packages_array[@]}"; do
    s-run install $package
done

if s-run is linux; then
    s-run install outlook-for-linux --edge
fi