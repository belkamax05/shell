SHELL_CONFIGS_DIR="$SHELL_DIR/configs"
SHELL_DOTFILES_DIR="$SHELL_CONFIGS_DIR/dotfiles"
SHELL_BIN_DIR="$SHELL_CONFIGS_DIR/bin"

SHARED_DIR="$HOME/.local/share"
SHELL_SHARED_DIR="$SHARED_DIR/shell"
SHELL_DOWNLOADS_DIR="$SHELL_SHARED_DIR/downloads"

SHELL_CACHE_DIR="$SHELL_SHARED_DIR/cache"
SHELL_STARTUP_FILE="$SHELL_CACHE_DIR/startup.zsh"

SHELL_PLUGINS_DIR="$SHELL_SHARED_DIR/plugins"

SHELL_STARTUP_DIR="$SHELL_DIR/startup"
SHELL_STARTUP_FILES_DIR="$SHELL_STARTUP_DIR/files"

SHELL_EVENTS_DIR="$SHELL_DIR/events"

SHELL_SCRIPTS_DIR="$SHELL_DIR/scripts"
SHELL_INSTALL_DIR="$SHELL_SCRIPTS_DIR/install"

SHELL_TWEAKS_DIR="$SHELL_SCRIPTS_DIR/tweaks"

SHELL_LINKS_DIR="$SHELL_DIR/links"

SHELL_LIBS_SRC_DIR="$SHELL_DIR/libs"
SHELL_LIBS_DIST_DIR="$SHELL_CACHE_DIR/libs"


#? nvm
# export NVM_DIR="$HOME/.nvm"

#? zap
ZAP_DIR="$SHARED_DIR/zap"
XDG_DATA_HOME="$SHARED_DIR"

#? mvn
MVN_DIR="$SHELL_PLUGINS_DIR/apache-maven-3.9.7"

CURRENT_FILE_PATH="${(%):-%x}"

# export PATH="$PATH:/usr/local/bin/docker"
export PATH="$MVN_DIR/bin:$PATH"
export PATH="/home/.linuxbrew/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$SHELL_BIN_DIR:$PATH"

# Warning: /opt/homebrew/bin is not in your PATH.