

function shell-nav() {
    _list() {
        for key in "${(k)paths_alias_list[@]}"; do
            echo "$key: ${paths_alias_list[$key]}"
        done
    }
    _add() {
        shell pather add-alias $@
    }
    _back() {
        local prevPath=${shell_navigation_list[$(( ${#shell_navigation_list[@]} - 1 ))]}
        if [ -z "$prevPath" ]; then
            echo-error "No previous path to navigate"
            return $CODE_ERROR
        fi
        SHELL_IS_BACK_PROCESSING=1
        cd $prevPath
        local _cdStatus=$?
        SHELL_IS_BACK_PROCESSING=0
        if [ $_cdStatus -eq 0 ]; then
            shell_navigation_list=(${shell_navigation_list[1,$(( ${#shell_navigation_list[@]} - 1 ))]})
        else
            echo-error "Can't navigate to previous path"
        fi

    }
    _run() {
        local navPath=$1
        debug-function shell-nav "Args: $@, path: $navPath"
        if [ $navPath = "back" ]; then
            shell pather back $@
            return $?
        fi
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
        back)
            _back ${@:2}
            ;;
        *)
            _run $@
            ;;
    esac
}