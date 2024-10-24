# check if code (vscode) is installed, and if not - run wget debian installation
CODE_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' code | grep "install ok installed")
if [[ $CODE_INSTALLED != "" ]]; then
    echo "code is already installed"
else
    echo "code is not installed"
    wget -O ~/Downloads/code.deb https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
    sudo dpkg -i ~/Downloads/code.deb
    rm ~/Downloads/code.deb
fi