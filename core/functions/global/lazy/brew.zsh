brew() {
    unset -f brew
    eval "$($(brew --prefix)/bin/brew shellenv)"
}