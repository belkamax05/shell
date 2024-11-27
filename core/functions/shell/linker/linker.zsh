s-linker() {
    _linkerBin() {
        s-debug warning "TODO remove linker bin"
        # echo-info "Creating bin linking..."
    }
    _linkerConfigs() {
        local target_link="$SHELL_CONFIGS_DIR/shell-config"
        if [ -L "$target_link" ] || [ -e "$target_link" ]; then
            echo-info "Recreating link at ${COLOR_YELLOW}$target_link${STYLE_RESET}..."
            rm -rf "$target_link"
        else
            echo-info "Creating configs linking at ${COLOR_YELLOW}$target_link${STYLE_RESET}..."
        fi
        ln -s "$SHELL_SHARED_DIR" "$target_link"
    }
    case $1 in
        configs)
            _linkerConfigs
            ;;
        bin)
            _linkerBin
            ;;
        all)
            _linkerDotfiles
            _linkerConfigs
            _linkerBin
            ;;
        *)
            echo-error "Unknown linker type: $1"
            ;;
    esac
}