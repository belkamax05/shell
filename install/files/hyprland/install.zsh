git clone git@github.com:hyprwm/aquamarine.git $SHELL_PLUGINS_DIR/aquamarine
nav $SHELL_PLUGINS_DIR/aquamarine
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B $SHELL_PLUGINS_DIR/aquamarine/build
cmake --build $SHELL_PLUGINS_DIR/aquamarine/build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
nav back

# git clone --recursive https://github.com/hyprwm/Hyprland $SHELL_PLUGINS_DIR/Hyprland
# nav $SHELL_PLUGINS_DIR/Hyprland
# make all && sudo make install
# nav back