source "$SHELL_DIR/startup/files/01-define/paths.zsh"

SHELL_IS_SOURCE=false
if [ -f "$SHELL_STARTUP_FILE" ]; then
  source "$SHELL_STARTUP_FILE"
else
  SHELL_IS_SOURCE=true
  for file in $(find "$SHELL_STARTUP_FILES_DIR" -type f | sort); do
      source "$file"
  done
fi
