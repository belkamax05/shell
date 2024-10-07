function shell-nav() {
    _list() {
        for key in "${(k)paths_alias_list[@]}"; do
            echo "$key: ${paths_alias_list[$key]}"
        done
    }
    _add() {
        shell pather add-alias $@
    }
    _run() {
        local navPath=$1
        debug-function shell-nav "Args: $@, path: $navPath"
        if [ ! -d "$navPath" ]; then
            local navPathAlias=$paths_alias_list[$navPath]
            if [ -z "$navPathAlias" ]; then
                echo-error "Can't navigate to ${COLOR_ARGUMENT}$navPath${STYLE_RESET}"
                return $CODE_ERROR
            fi
            if [ ! -d "$navPathAlias" ]; then
                echo-error "Alias for ${COLOR_ARGUMENT}$navPath${STYLE_RESET} is not a directory: ${COLOR_ARGUMENT}$navPathAlias${STYLE_RESET}"
                return $CODE_ERROR
            fi
            navPath=$navPathAlias
        fi
        cd $navPath
        if [ $? -ne 0 ]; then
            echo-error "Can't navigate to ${COLOR_ARGUMENT}$navPath${STYLE_RESET}"
        fi
    }

    local command=$1
    case $command in
        list)
            _list ${@:2}
            ;;
        add)
            _add ${@:2}
            ;;
        run)
            _run ${@:2}
            ;;
        *)
            _run $@
            ;;
    esac
}