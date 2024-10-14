_installGHGui() {
    _ubuntuDependencies() {
        sudo apt-get install libusb-1.0-0-dev libx11-dev libgl-dev
    }
    _cloneRepository() {
        if [ ! -d $SHELL_PLUGINS_DIR/ghub-gui ]; then
            git clone git@github.com:ysph/gHub-GUI.git $SHELL_PLUGINS_DIR/ghub-gui
            return
        fi
        
    }
    _makeAll() {
        shell nav $SHELL_PLUGINS_DIR/ghub-gui
        make all
        shell nav back
    }

    _ubuntuDependencies
    _cloneRepository
    _makeAll
}

_installGHGui $@
