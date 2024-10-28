echo-info "Installing ${COLOR_CYAN}REQUIRED${STYLE_RESET} packages"
_installPackages="brew openssl curl file git zap mvn fzf lsd neofetch"
if s-run is linux; then
    _installPackages="$_installPackages fd-find snapd"
fi

packages_array=(${=_installPackages})
for package in "${packages_array[@]}"; do
    s-run install $package
    if [[ $package == "zap" ]]; then
        s-run plugin-zap-init
    fi
    if [[ $package == "brew" ]]; then
        s-run plugin-brew-init
    fi
done