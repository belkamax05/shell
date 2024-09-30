mkdir $SHELL_LINKS_DIR

ln -s $SHELL_STARTUP_FILES_DIR/00-kernel/01.configure.zsh $SHELL_LINKS_DIR/kernel-configure.zsh
ln -s $SHELL_STARTUP_FILES_DIR/00-kernel/50.debug.zsh $SHELL_LINKS_DIR/kernel-debug.zsh

ln -s $SHELL_STARTUP_FILES_DIR/01-define/01.colors.zsh $SHELL_LINKS_DIR/define-colors.zsh
ln -s $SHELL_STARTUP_FILES_DIR/01-define/02.alias.zsh $SHELL_LINKS_DIR/define-alias.zsh
ln -s $SHELL_STARTUP_FILES_DIR/01-define/02.paths.zsh $SHELL_LINKS_DIR/define-paths.zsh

ln -s $HOME/.zshrc $SHELL_LINKS_DIR/user-zshrc.zsh

ln -s $SHELL_STARTUP_FILE $SHELL_LINKS_DIR/output-startup.zsh