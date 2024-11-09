s-pather-init() { #? every time shell is preparing to run at folder
    tracing "pather init"
    s-debug info "Initialised pwd at $(pwd)"
    add-zsh-hook chpwd s-pather-update
    s-pather-dir-change
}
