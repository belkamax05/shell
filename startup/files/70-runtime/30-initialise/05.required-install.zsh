SHELL_REQUIRED_INSTALL_COMPLETE=$(shell-user get SHELL_REQUIRED_INSTALL_COMPLETE)
if [[ $SHELL_REQUIRED_INSTALL_COMPLETE != true ]]; then
    echo-info "Installing required packages..."
    s-run install zap
    s-run install nvm
    shell-user set SHELL_REQUIRED_INSTALL_COMPLETE true
fi