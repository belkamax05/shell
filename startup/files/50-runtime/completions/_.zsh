shell-runtime-completions() {
    autoload -Uz compinit
    compinit

    # compdef _shell shell
    # compdef _nav shell nav

    # function _nav {
    #   local -a nav_suggestions=()
    #   for key in "${(k)paths_alias_list[@]}"; do
    #     echo _nav "Add suggestion: $key"
    #     nav_suggestions+=($key)
    #   done
    #   compadd -- ${nav_suggestions}
    # }

}