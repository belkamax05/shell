typeset -gA projects_scripts_list

s-project() {
    s-project-list() {
        if [ ${#projects_scripts_list[@]} -eq 0 ]; then
            echo-info "No projects scripts found"
            return $CODE_OK
        fi
        for key in "${(k)projects_scripts_list[@]}"; do
            echo "$key: ${projects_scripts_list[$key]}"
        done
    }
    s-project-add() {
        local pathOrAlias=$1
        local pathResolved=$(s-pather get $pathOrAlias)
        local scriptName=$2
        s-debug info "Adding project ${COLOR_ARGUMENT}$pathOrAlias${STYLE_RESET} with script ${COLOR_ARGUMENT}$scriptName${STYLE_RESET}"
        projects_scripts_list[$pathResolved]=$scriptName
    }
    s-project-pwd-check() {
        SHELL_IS_PROJECT=false
        local scriptName=${projects_scripts_list[$PWD]}
        if [ -n "$scriptName" ]; then
            s-debug success "Script ${COLOR_ARGUMENT}$scriptName${STYLE_RESET} found for ${COLOR_ARGUMENT}$PWD${STYLE_RESET}"
            SHELL_IS_PROJECT=true
            return $CODE_OK
        fi
        s-debug info "No script found for $PWD"
    }
    s-project-run() {
        local scriptName=${projects_scripts_list[$PWD]}
        if [ -z "$scriptName" ]; then
            echo-error "No script found for $PWD"
            return $CODE_ERROR
        fi
        $scriptName $@
        local _status=$?
        if [ $_status -eq $CODE_OK ]; then
            return $CODE_OK
        elif [ $_status -ne $CODE_NOT_FOUND ]; then
            echo-error "Unknown project error $_status. $@"
        fi
        return $_status
    }

    case $1 in
        add)
            s-project-add ${@:2}
            ;;
        pwd-check)
            s-project-pwd-check ${@:2}
            ;;
        list)
            s-project-list ${@:2}
            ;;
        run)
            s-project-run ${@:2}
            return $?
            ;;
        *)
            s-project-run $@
            return $?
            ;;
    esac
}