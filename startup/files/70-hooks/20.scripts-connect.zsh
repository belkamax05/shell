for script in "$SHELL_SCRIPTS_DIR"/*.zsh; do
    script_name=$(basename "$script" .zsh)
    echo "script_name: $script_name"
    function $script_name() {
        source "$script" "$@"
    }
done