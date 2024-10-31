shell-guard() {
    set() {
        local name="$1"
        debug info "Guard set '${COLOR_ARGUMENT}$name${STYLE_RESET}'"
        SHELL_GUARD="SHELL_GUARD_${name//-/_}_ZSH"
        eval "$SHELL_GUARD=1"
    }
    unset() {
        local name="$1"
        debug info "Guard unset '${COLOR_ARGUMENT}$name${STYLE_RESET}'"
        SHELL_GUARD="SHELL_GUARD_${name//-/_}_ZSH"
        eval "$SHELL_GUARD=0"
    }
    check() {
        local name="$1"
        SHELL_GUARD="SHELL_GUARD_${name//-/_}_ZSH"
        print -v SHELL_GUARD_VALUE -- "${(P)SHELL_GUARD}"
        if [ "$SHELL_GUARD_VALUE" -eq 1 ]; then
            return 1
        fi
        return 0
    }

    case $1 in
        set)
            set ${@:2}
            ;;
        unset)
            unset ${@:2}
            ;;
        check)
            check ${@:2}
            ;;
        *)
            echo-error "Unknown command: $1"
            ;;
    esac
}