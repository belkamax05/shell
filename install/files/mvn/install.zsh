# URL of the file to download
URL="https://dlcdn.apache.org/maven/maven-3/3.9.7/binaries/apache-maven-3.9.7-bin.tar.gz"
# Create the directories if they don't exist
mkdir -p "$SHELL_DOWNLOAD_DIR"
mkdir -p "$SHELL_PLUGINS_DIR"
# Check if the directory exists
if [[ ! -d "$MVN_DIR" ]]; then
    # Download the file
    curl -L "$URL" -o "$SHELL_DOWNLOAD_DIR/apache-maven-3.9.7-bin.tar.gz"
    # Extract the file
    tar -xzf "$SHELL_DOWNLOAD_DIR/apache-maven-3.9.7-bin.tar.gz" -C "$SHELL_PLUGINS_DIR"
    # Remove the file
    rm "$SHELL_DOWNLOAD_DIR/apache-maven-3.9.7-bin.tar.gz"
fi