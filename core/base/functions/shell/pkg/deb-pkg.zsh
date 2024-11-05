shell-deb-pkg() {
    case $1 in
        is-installed)
            s-run deb-is-installed ${@:2}
            ;;
        install)
            s-run deb-install ${@:2}
            ;;
        *)
            s-run deb-install $@
            ;;
    esac
}