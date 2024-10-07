shell-service() {
    case "$1" in
        "scripts-connect")
            shell-service-scripts-connect
            ;;
        *)
            echo-error "Unknown service '$1'."
            ;;
    esac
}