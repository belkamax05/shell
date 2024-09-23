export SHELL_STARTUP_DIR="$SHELL_DIR/startup"

if [ "$1" = "dev" ]; then
  source "$SHELL_STARTUP_DIR/run-in-dev-mode.zsh"
elif [ "$1" = "bin" ]; then
  source "$SHELL_STARTUP_DIR/run-via-compilation.zsh"
else
    echo "Invalid argument: '$1'. Available options: dev, bin"
fi