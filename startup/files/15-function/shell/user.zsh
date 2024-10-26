shell-user() {
    _userGet() {
        s-run config-file get $SHELL_SHARED_DIR/.user-config $@
    }
    _userSet() {
        s-run config-file set $SHELL_SHARED_DIR/.user-config $@
    }

    case $1 in
    get)
        _userGet ${@:2}
        ;;
    set)
        _userSet ${@:2}
        ;;
    *)
        echo "Invalid '${COLOR_YELLOW}shell-user${STYLE_RESET}' command '${COLOR_YELLOW}$1${STYLE_RESET}'."
        ;;
    esac
}
