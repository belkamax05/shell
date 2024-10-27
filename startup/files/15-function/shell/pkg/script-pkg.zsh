shell-script-pkg() {
    case $1 in
        is-installed)
            s-run script-pkg-is-installed ${@:2}
            ;;
        install)
            s-run script-pkg-install ${@:2}
            ;;
        *)
            s-run script-pkg-install $@
            ;;
    esac
}