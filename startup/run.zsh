__RUN_STARTUP_CACHED_FILE="$SHELL_DIR/data/cache/startup.zsh"
__RUN_STARTUP_FILES_DIR="$SHELL_DIR/startup/files"

if [ -f "$__RUN_STARTUP_CACHED_FILE" ]; then
  STARTUP_RUNS_FROM_SOURCE=0
  source "$__RUN_STARTUP_CACHED_FILE"
else
  STARTUP_RUNS_FROM_SOURCE=1
  for file in $(find "$__RUN_STARTUP_FILES_DIR" -type f | sort); do
      source "$file"
  done
fi
