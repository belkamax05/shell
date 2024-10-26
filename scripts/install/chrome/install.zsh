(
    local chromeAptUrl="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    wget -O $SHELL_DOWNLOADS_DIR/google-chrome-stable_current_amd64.deb $chromeAptUrl
    sudo apt install -y $SHELL_DOWNLOADS_DIR/google-chrome-stable_current_amd64.deb
)