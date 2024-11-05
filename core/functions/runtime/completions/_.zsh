s-runtime-completions() {
    tracing "Load completions"
    autoload -Uz compinit
    if [[ -f ~/.zcompdump ]]; then
        compinit -C
    else
        compinit
    fi
    tracing "Completions loaded"
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