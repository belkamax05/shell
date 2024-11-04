tracing "finalise kernel"

#? Example 1 - Lazyload a plugin

lazyload_plugin() {
    # Load the plugin once, then unset this function
    source ~/.zsh/plugins/some_plugin.plugin.zsh
    unset -f lazyload_plugin
}

alias mycommand="lazyload_plugin && mycommand"

#? Example 4 -  Caching Frequently Used Commands

_cached_branch=""
get_git_branch() {
    if [[ -z $_cached_branch ]]; then
        echo "Get it"
        _cached_branch=$(git branch --show-current)
    fi
    echo $_cached_branch
}

#? Example 5 -  Aliases

# Enable abbreviation expansion
# bindkey -v
# # Define abbreviations
# bindkey '^X^E' expand-abbrev  # Ctrl-X, Ctrl-E to expand


#? Example 6 - Background jobs

# update_data() {
#     # Run a long command in the background
#     (some_long_command > ~/.cache/data_output) &
# }
