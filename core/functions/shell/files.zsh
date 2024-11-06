shell-files() {
    case $1 in
        load)
            s-source-dir ${@:2}
            ;;
        build)
            s-build-dir ${@:2}
            ;;
        build-include)
            s-source-dir-compiled ${@:2}
            ;;
        *)
            echo-error "Command $command not found"
            ;;
    esac
}