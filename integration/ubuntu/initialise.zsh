for file in $(find "$SHELL_INTEGRATION_DIR/ubuntu/initialise" -type f | sort); do
    source "$file"
done