function shell-project() {
    _list() {
        if [ ${#projects_scripts_list[@]} -eq 0 ]; then
            echo-info "No projects scripts found"
            return $CODE_OK
        fi
        for key in "${(k)projects_scripts_list[@]}"; do
            echo "$key: ${projects_scripts_list[$key]}"
        done
    }
    _add() {
        local pathOrAlias=$1
        local pathResolved=$(shell pather get $pathOrAlias)
        local scriptName=$2
        projects_scripts_list[$pathResolved]=$scriptName
    }
    _pwd-check() {
        SHELL_IS_PROJECT=0
        local scriptName=${projects_scripts_list[$PWD]}
        if [ -n "$scriptName" ]; then
            debug-success "Script for project: $scriptName"
            SHELL_IS_PROJECT=1
            return $CODE_OK
        fi
        debug-info "No script found for $scriptName at $PWD"
    }
    _run() {
        local scriptName=${projects_scripts_list[$PWD]}
        if [ -z "$scriptName" ]; then
            echo-error "No script found for $PWD"
            return $CODE_ERROR
        fi
        $scriptName $@
        return $?
    }

    case $1 in
        add)
            _add ${@:2}
            ;;
        pwd-check)
            _pwd-check ${@:2}
            ;;
        list)
            _list ${@:2}
            ;;
        run)
            _run ${@:2}
            return $?
            ;;
        *)
            _run $@
            return $?
            ;;
    esac
}