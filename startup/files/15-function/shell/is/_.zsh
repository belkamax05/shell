shell-is() {
    case $1 in
        verbose)
            s-run is-verbose
            ;;
        linux)
            s-run is-linux
            ;;
        darwin)
            s-run is-darwin
            ;;
        macos)
            s-run is-darwin
            ;;
        compiled)
            s-run is-compiled
            ;;
        started)
            s-run is-started
            ;;
        *)
            return 1
            ;;
    esac
}
