(
    #? see https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu
    local synapticsAptUrl="https://www.synaptics.com/sites/default/files/Ubuntu/pool/stable/main/all/synaptics-repository-keyring.deb"
    wget -O $SHELL_DOWNLOADS_DIR/synaptics-repository-keyring.deb $synapticsAptUrl
    sudo apt install $SHELL_DOWNLOADS_DIR/synaptics-repository-keyring.deb
    sudo apt update
    sudo apt install -y displaylink-driver
)