MVN_INSTALL_FILE_NAME="apache-maven-3.9.7-bin.tar.gz"
URL="https://dlcdn.apache.org/maven/maven-3/3.9.7/binaries/$MVN_INSTALL_FILE_NAME"
if [[ ! -d "$MVN_DIR" ]]; then
    curl -L "$URL" -o "$SHELL_DOWNLOAD_DIR/$MVN_INSTALL_FILE_NAME"
    tar -xzf "$SHELL_DOWNLOAD_DIR/$MVN_INSTALL_FILE_NAME" -C "$SHELL_PLUGINS_DIR"
    rm "$SHELL_DOWNLOAD_DIR/$MVN_INSTALL_FILE_NAME"
fi