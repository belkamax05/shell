shell-snap-pkg() {
    case $1 in
        is-installed)
            s-run snap-is-installed ${@:2}
            ;;
        install)
            s-run snap-install ${@:2}
            ;;
        *)
            s-run snap-install $@
            ;;
    esac
}