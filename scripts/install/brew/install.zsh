if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
    test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    if ! grep -Fxq 'eval "$($(brew --prefix)/bin/brew shellenv)"' ~/.bashrc; then
        echo 'eval "$($(brew --prefix)/bin/brew shellenv)"' >> ~/.bashrc
    fi
fi