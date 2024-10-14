shell-git() {
    case $1 in
        me)
            git-command-me ${@:2}
            ;;
        gho)
            git-command-gho ${@:2}
            ;;
        *)
            echo-error "Invalid git command: $1"
            ;;
    esac
}