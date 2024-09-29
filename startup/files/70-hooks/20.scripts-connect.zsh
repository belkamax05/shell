# Define the lazy_load_script function
# function lazy_load_script() {
#     local script_name="$1"
#     local script_path="$SHELL_SCRIPTS_DIR/${script_name}.zsh"

#     if [ -f "$script_path" ]; then
#         source "$script_path"
#     else
#         echo "Script not found: $script_path"
#     fi
# }

# Dynamically create functions for each script in SHELL_SCRIPTS_DIR
for script in "$SHELL_SCRIPTS_DIR"/*.zsh; do
    script_name=$(basename "$script" .zsh)
    echo "script_name: $script_name"
    function $script_name() {
        source "$script" "$@"
    }
    # eval "
    # function $script_name() {
    #     lazy_load_script $script_name
    #     $script_name \"\$@\"
    # }
    # "
done