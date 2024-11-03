s-runtime-hooks() {
    tracing "Load runtime hooks"
    add-zsh-hook chpwd load-nvmrc
}