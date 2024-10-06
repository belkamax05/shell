export NVM_DIR=$SHELL_PLUGINS_DIR/nvm

if [ -d "$NVM_DIR" ]; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    shell install cancel
fi