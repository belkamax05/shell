shell-env() {
    case $1 in
        reset)
            shell-env-reset
            ;;
        load)
            shell-env-load
            ;;
        init)
            shell-env-reset
            shell-env-load
            ;;
        *)
            echo-error "Unknown shell env command: $1"
            ;;
    esac
}