shell-is() {
    case $1 in
        verbose)
            _shellIsVerbose
            ;;
        linux)
            _shellIsLinux
            ;;
        darwin)
            _shellIsDarwin
            ;;
        macos)
            _shellIsDarwin
            ;;
        *)
            return 1
            ;;
    esac
}
