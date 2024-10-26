SHELL_DATA_DIR="$SHELL_DIR/data"

SHELL_INTEGRATION_DIR="$SHELL_DIR/integration"
SHELL_DOTFILES_DIR="$SHELL_INTEGRATION_DIR/dotfiles"

SHARED_DIR="$HOME/.local/share"
SHELL_SHARED_DIR="$SHARED_DIR/shell"
SHELL_DOWNLOADS_DIR="$SHELL_SHARED_DIR/downloads"

SHELL_CACHE_DIR="$SHELL_SHARED_DIR/cache"
SHELL_STARTUP_FILE="$SHELL_CACHE_DIR/startup.zsh"

SHELL_PLUGINS_DIR="$SHELL_SHARED_DIR/plugins"

SHELL_STARTUP_DIR="$SHELL_DIR/startup"
SHELL_STARTUP_FILES_DIR="$SHELL_STARTUP_DIR/files"

SHELL_INSTALL_DIR="$SHELL_DIR/install"
SHELL_INSTALL_FILES_DIR="$SHELL_INSTALL_DIR/files"

SHELL_EVENTS_DIR="$SHELL_DIR/events"

SHELL_SCRIPTS_DIR="$SHELL_DIR/scripts"

SHELL_TWEAKS_DIR="$SHELL_SCRIPTS_DIR/tweaks"

SHELL_LINKS_DIR="$SHELL_DIR/links"

SHELL_LIBS_SRC_DIR="$SHELL_DIR/libs"
SHELL_LIBS_DIST_DIR="$SHELL_CACHE_DIR/libs"

# export PATH="$PATH:/usr/local/bin/docker"

#? nvm
export NVM_DIR=$SHELL_PLUGINS_DIR/nvm

#? zap
ZAP_DIR="$SHARED_DIR/zap"
export XDG_DATA_HOME="$SHARED_DIR"

#? mvn
export MVN_DIR="$SHELL_PLUGINS_DIR/apache-maven-3.9.7"
export PATH="$MVN_DIR/bin:$PATH"