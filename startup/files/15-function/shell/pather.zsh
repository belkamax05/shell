function shell-pather() {
    _add-alias() { #? adds new alias of path
        paths_alias_list[$1]="$2"
    }
    _get() { #? returns alias or path, based on alias name
        local path=$1
        local pathAlias=$paths_alias_list[$path]
        if [ -z "$pathAlias" ]; then
            echo $path
        else
            echo $pathAlias
        fi
    }
    _dir_change() {
        shell project pwd-check
    }
    _init() { #? every time shell is preparing to run at folder
        debug-function pather "You are currently at $(pwd)"
        _dir_change
    }
    _update() { #? shell foldder changes
        debug-function pather "You switched to $(pwd)"
        _dir_change
    }

    debug-function "shell-on-path-change" "Args: $@, Current: $PWD"
    case $1 in
        add-alias)
            _add-alias ${@:2}
            ;;
        init) 
            _init ${@:2}
            ;;
        get) 
            _get ${@:2}
            ;;
        update)
            _update ${@:2}
            ;;
        *)
            echo-error "TODO shell-on-path-change"
            ;;
    esac
}