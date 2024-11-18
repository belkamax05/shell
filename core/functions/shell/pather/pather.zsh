s-pather() {
    case $1 in
        add-alias)
            s-pather-add-alias ${@:2}
            ;;
        init) 
            s-pather-init ${@:2}
            ;;
        get) 
            s-pather-get ${@:2}
            ;;
        update)
            s-pather-update ${@:2}
            ;;
        *)
            echo-error "TODO shell-on-path-change"
            ;;
    esac
}
 