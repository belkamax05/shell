(
    wget https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb -O $SHELL_DOWNLOADS_DIR/docker-desktop-amd64.deb
    sudo apt install $SHELL_DOWNLOADS_DIR/docker-desktop-amd64.deb

    systemctl --user start docker-desktop
    systemctl --user enable docker-desktop

    #?  Set Up Docker for zsh

    mkdir -p ~/.oh-my-zsh/completions
    curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker > ~/.oh-my-zsh/completions/_docker

    # export PATH="$PATH:/usr/local/bin/docker"

    #? Manage Docker as a Non-Root User (Optional)
    sudo usermod -aG docker $USER
    exec $SHELL

)