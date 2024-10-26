shell-tweak() {
    _tweakGet() {
        echo $(s-run config-file get $SHELL_SHARED_DIR/.tweak-config $@)
    }
    _tweakSet() {
        s-run config-file set $SHELL_SHARED_DIR/.tweak-config $@
    }
    _tweakApply() {
        local isTweakEnabled=$(_tweakGet $1)
        if [[ $isTweakEnabled != true ]]; then
            echo-info "Applying tweak '${COLOR_YELLOW}$1${STYLE_RESET}'..."
            local tweakPath=$SHELL_TWEAKS_DIR/$1.zsh
            if [ -f $tweakPath ]; then
                source $tweakPath
                _tweakSet $1 true
                echo-success "Tweak '${COLOR_YELLOW}$1${STYLE_RESET}' applied."
            else
                echo-error "Tweak '${COLOR_YELLOW}$1${STYLE_RESET}' not found."
            fi
        else
            echo-info "Skipping tweak '${COLOR_YELLOW}$1${STYLE_RESET}'..."
        fi
    }


    case $1 in
    get)
        _tweakGet ${@:2}
        ;;
    set)
        _tweakSet ${@:2}
        ;;
    apply)
        _tweakApply ${@:2}
        ;;
    *)
        _tweakApply $@
        ;;
    esac
}