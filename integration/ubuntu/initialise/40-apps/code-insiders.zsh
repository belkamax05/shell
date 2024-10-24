CODE_INSIDERS_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' code-insiders | grep "install ok installed")
if [[ $CODE_INSIDERS_INSTALLED != "" ]]; then
    echo-info "code-insiders is already installed"
else
    echo-info "code-insiders is not installed"
    wget -O ~/Downloads/code-insiders.deb https://code.visualstudio.com/sha/download?build=insider&os=linux-deb-x64
    sudo dpkg -i ~/Downloads/code-insiders.deb
    _status=$?
    rm ~/Downloads/code-insiders.deb
    if [[ $_status -eq 0 ]]; then
        echo-success "code-insiders is installed"
    else
        echo-error "code-insiders installation failed"
    fi
fi