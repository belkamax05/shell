s-pkg() {
    case $1 in
        is-installed)
            s-pkg-is-installed ${@:2};
            ;;
        just-install)
            s-pkg-just-install ${@:2};
            ;;
        install)
            s-pkg-install ${@:2};
            ;;
        remove)
            s-pkg-remove ${@:2};
            ;;
        *)
            # _pkgInstall ${@:2};
            echo-error "Invalid shell-pkg command: $1";
            ;;
    esac
}
s-install() {
    s-pkg install $@
}
s-remove() {
    s-pkg remove $@
}
s-just-install() {
    s-pkg just-install $@
}
s-is-installed() {
    s-pkg is-installed $@
}