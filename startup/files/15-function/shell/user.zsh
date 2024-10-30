s-user() {
    local userConfigFile="$SHELL_SHARED_DIR/.user-config"
    _userGet() {
        s-run config-file get $userConfigFile $@
    }
    _userSet() {
        s-run config-file set $userConfigFile $@
    }
    _userLoad() {
        if [ -f $userConfigFile ]; then
            source $userConfigFile
        fi
    }

    case $1 in
        get)
            _userGet ${@:2}
            ;;
        set)
            _userSet ${@:2}
            ;;
        load)
            _userLoad
            ;;
        *)
            echo "Invalid '${COLOR_YELLOW}s-user${STYLE_RESET}' command '${COLOR_YELLOW}$1${STYLE_RESET}'."
            ;;
    esac
}
