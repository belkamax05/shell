shell-pkg() {
   

    case $1 in
        is-installed)
            s-run pkg-is-installed ${@:2};
            ;;
        just-install)
            s-run pkg-just-install ${@:2};
            ;;
        install)
            s-run pkg-install ${@:2};
            ;;
        remove)
            s-run pkg-remove ${@:2};
            ;;
        *)
            # _pkgInstall ${@:2};
            echo-error "Invalid shell-pkg command: $1";
            ;;
    esac
}
shell-install() {
    s-run pkg install $@
}
shell-remove() {
    s-run pkg remove $@
}
