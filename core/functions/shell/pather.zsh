s-pather() {
    s-pather-add-alias() { #? adds new alias of path
        paths_alias_list[$1]="$2"
    }
    s-pather-get() { #? returns alias or path, based on alias name
        local path=$1
        local pathAlias=$paths_alias_list[$path]
        if [ -z "$pathAlias" ]; then
            echo $path
        else
            echo $pathAlias
        fi
    }
    s-pather-dir-change() {
        s-project pwd-check
        s-on-pwd-change
    }
    s-pather-init() { #? every time shell is preparing to run at folder
        s-debug info "You are currently at $(pwd)"
        s-pather-dir-change
    }
    s-pather-update() { #? shell foldder changes
        verbose info "You switched to $(pwd)"
        s-pather-dir-change
        if [ $SHELL_IS_BACK_PROCESSING -eq 0 ]; then
            shell_navigation_list[$#shell_navigation_list+1]=$PWD
            return
        fi
    }
    case $1 in
        add-alias)
            s-pather-add-alias ${@:2}
            ;;
        init) 
            s-pather-init ${@:2}
            ;;
        get) 
            s-pather-get ${@:2}
            ;;
        update)
            s-pather-update ${@:2}
            ;;
        *)
            echo-error "TODO shell-on-path-change"
            ;;
    esac
}