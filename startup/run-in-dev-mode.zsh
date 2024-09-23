function shell-source() {
    local file="$1"
    if [ -f "$file" ]; then
        source "$file"
    else
        echo "File not found: $file"
    fi
}
source "$SHELL_STARTUP_DIR/import-source-files.zsh"