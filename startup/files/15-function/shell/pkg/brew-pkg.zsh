shell-brew-pkg() {
    case $1 in
        is-installed)
            s-run brew-is-installed ${@:2}
            ;;
        install)
            s-run brew-install ${@:2}
            ;;
        *)
            s-run brew-install $@
            ;;
    esac
}