
s-not-found() {
    _errorNF() {
        echo-error "${COLOR_COMMAND}not-found${STYLE_RESET}" $@
    }
    if [[ $SHELL_IS_PROJECT == true ]]; then
        s-project $@
        local _status=$?
        if [[ $_status -eq $CODE_OK ]]; then
            return $CODE_OK
        elif [[ $_status -ne $CODE_NOT_FOUND ]]; then
            _errorNF "Project run error '${COLOR_ARGUMENT}$_status${STYLE_RESET}'. Arguments $@"
            return $_status
        fi
    fi
    s-run $@
    local _status=$?
    if [[ $_status -eq $CODE_OK ]]; then
        return $CODE_OK
    elif [[ $_status -ne $CODE_NOT_FOUND ]]; then
        _errorNF "Unknown error ($_status). Arguments $@"
        return $_status
    fi
    _errorNF "Not found '${COLOR_ARGUMENT}$1${STYLE_RESET}'"
    return $CODE_NOT_FOUND
}

# testnf-sample() {
#     echo "This sample runs well"
# }

# typeset -gA command_cache
# s-not-found() {
#     echo "START Cache is: ${command_cache[@]}"
#     local cmd="$1"

#     if [[ -z $cmd ]]; then
#         echo-error "Command is required"
#         return 1
#     fi

#     if [[ -z ${command_cache[$cmd]} ]]; then
#         echo "Command '$cmd' not found. Caching alternative path: '$cmd-sample'"
#         command_cache[$cmd]="$cmd-sample"
#         echo "END Cache is: ${command_cache[@]}"
#         # return $CODE_NOT_FOUND
#     fi
    
#     if [[ -n ${command_cache[$cmd]} ]]; then
#         echo "Running cached command for '$cmd': ${command_cache[$cmd]}"
#         eval "${command_cache[$cmd]}" "${@:2}"
#         return $CODE_OK
#     fi

#     # local alternative_path="$cmd-sample"

#     # command_cache[$cmd]=$alternative_path
#     # # echo "Command '$cmd' not found. Caching alternative path: '${command_cache[$cmd]}'"
#     # echo "END Cache is: ${command_cache[@]}"
#     # return 127
# }