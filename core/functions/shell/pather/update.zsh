s-pather-update() { #? shell foldder changes
    s-debug info "You switched to $(pwd)"
    s-pather-dir-change
    if [ $SHELL_IS_BACK_PROCESSING -eq 0 ]; then
        shell_navigation_list[$#shell_navigation_list+1]=$PWD
        return
    fi
}