source "$SHELL_DIR/startup/files/01-define/paths.zsh"

if [ -f "$SHELL_STARTUP_FILE" ]; then
  STARTUP_RUNS_FROM_SOURCE=false
  source "$SHELL_STARTUP_FILE"
else
  STARTUP_RUNS_FROM_SOURCE=true
  for file in $(find "$SHELL_STARTUP_FILES_DIR" -type f | sort); do
      source "$file"
  done
fi
