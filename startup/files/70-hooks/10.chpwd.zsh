function chpwd() {
  debug-function chpwd "You switched to $(pwd)"
  shell-on-path-change change
}

if [ "$STARTUP_RUNS_FROM_SOURCE" = 0 ]; then
    shell-on-path-change init
fi