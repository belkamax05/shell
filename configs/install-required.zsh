echo-info "Installing ${COLOR_CYAN}REQUIRED${STYLE_RESET} packages"
_installPackages=""
s-is linux &&  _installPackages="$_installPackages brew fd-find snapd"
_installPackages="openssl curl file git zap nvm mvn fzf lsd neofetch gum $_installPackages"
s-is linux && _installPackages="$_installPackages fd-find snapd"

packages_array=(${=_installPackages})
for package in "${packages_array[@]}"; do
    s-install $package
    # if [[ $package == "nvm" ]]; then
    #     s-run plugin-nvm-init
    # fi
    if [[ $package == "zap" ]]; then
        s-run plugin-zap-init
    fi
    if [[ $package == "brew" ]]; then
        s-run plugin-brew-init
    fi
done