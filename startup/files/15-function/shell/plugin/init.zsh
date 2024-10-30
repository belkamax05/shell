shell-plugin-init() {
    tracing "plugins init 1"
    s-run plugin-brew-init
    tracing "plugins init 2"
    # s-run plugin-nvm-init
    tracing "plugins init 3"
    s-run plugin-zap-init
    tracing "plugins init 4"
}