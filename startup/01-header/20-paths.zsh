tracing "Path exports"
s-is linux && s-path-prepend "/home/linuxbrew/.linuxbrew/bin"
s-is darwin && s-path-prepend "/opt/homebrew/bin"
s-path-prepend "$MVN_DIR/bin"
s-path-prepend "$HOME/bin"
s-path-prepend "$SHELL_CONFIGS_DIR/bin"
s-path-prepend "$NVM_DIR/bin"
s-path-prepend "/usr/local/bin/docker"
tracing "Path exports done"

s-path-remove-duplicates