source "$SHELL_DIR/startup/files/01-define/path.zsh"

if [ -f "$SHELL_STARTUP_FILE" ]; then
  source "$SHELL_STARTUP_FILE"
else
  for file in $(find "$SHELL_STARTUP_FILES_DIR" -type f | sort); do
      source "$file"
  done
fi