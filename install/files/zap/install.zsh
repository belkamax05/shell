if ! command -v zap &> /dev/null; then
    echo "Zap is not installed. Installing..."
    (zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep)
else
    echo "Zap is already installed."
fi