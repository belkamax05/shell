tracing "Plugins configure"
if s-not compiled; then
    mkdir -p "$SHELL_DOWNLOADS_DIR"
    mkdir -p "$SHELL_PLUGINS_DIR"
    s-linker all
fi