shell-pkg-install() {
    if s-run pkg-is-installed $@; then
        echo "Package $1 is already installed."
    else
        s-run pkg-just-install $@
    fi
}