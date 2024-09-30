export SHELL_STARTUP_DIR="$SHELL_DIR/startup"

if [ -f "$SHELL_DIR/cache/startup.zsh" ]; then
  STARTUP_RUNS_FROM_SOURCE=0
  source "$SHELL_DIR/cache/startup.zsh"
else
  STARTUP_RUNS_FROM_SOURCE=1
  for file in $(find "$SHELL_STARTUP_DIR/files" -type f | sort); do
      source "$file"
  done
fi
