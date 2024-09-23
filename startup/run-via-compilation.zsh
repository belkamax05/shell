file_list=()

function shell-source() {
    local file="$1"
    if [ -f "$file" ]; then
        file_list+=("$file")
    else
        echo "File not found: $file"
    fi
}

function shell-compile-src() {
    source "$SHELL_STARTUP_DIR/import-source-files.zsh"
    mkdir -p "$SHELL_DIR/cache"

    #? outputs just file contents
    awk 'FNR==1 && NR!=1 {print ""} {print}' "${file_list[@]}" > "$SHELL_DIR/cache/startup.zsh"
    #? outputs including filename
    # awk 'FNR==1 {print "#! " FILENAME} {print}' "${file_list[@]}" > "$SHELL_DIR/cache/startup.zsh"
}

if [ ! -f "$SHELL_DIR/cache/startup.zsh" ]; then
    shell-compile-src
fi

source "$SHELL_DIR/cache/startup.zsh"