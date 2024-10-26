CODE_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' code | grep "install ok installed")
if [[ $CODE_INSTALLED != "" ]]; then
    echo-info "code is already installed"
else
    echo-info "code is not installed"
    # wget -O ~/Downloads/code.deb https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
    wget -O $SHELL_DOWNLOADS_DIR/code.deb https://go.microsoft.com/fwlink/?LinkID=760868
    sudo dpkg -i $SHELL_DOWNLOADS_DIR/code.deb
    _status=$?
    rm $SHELL_DOWNLOADS_DIR/code.deb
    if [[ $_status -eq 0 ]]; then
        echo-success "code is installed"
    else
        echo-error "code installation failed"
    fi
fi
