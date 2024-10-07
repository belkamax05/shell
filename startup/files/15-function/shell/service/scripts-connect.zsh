shell-service-scripts-connect() {
    for script in "$SHELL_SCRIPTS_DIR"/*.zsh; do
        local script_name=$(basename "$script" .zsh)
        eval "
        function $script_name() {
            source '$script' \"\$@\"
        }
        "
    done
}