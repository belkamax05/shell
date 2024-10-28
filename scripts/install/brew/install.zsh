if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    s-run plugin-brew-init
    
    if ! grep -Fxq 'eval "$($(brew --prefix)/bin/brew shellenv)"' ~/.bashrc; then
        echo 'eval "$($(brew --prefix)/bin/brew shellenv)"' >> ~/.bashrc
    fi
fi