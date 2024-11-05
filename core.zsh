s-core-load() {
    local coreDist="$SHELL_DIR/dist/core.zsh"
    if [[ ! -f "$coreDist" ]]; then
        local coreDir="$SHELL_DIR/core"
        source "$SHELL_DIR/core/base/source-dir.zsh"
        s-source-dir "$SHELL_DIR/core/base"
        s-build-dir "$coreDir" "$coreDist"
    fi
    source "$coreDist"
}
s-core-load