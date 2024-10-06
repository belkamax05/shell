function shell-on-path-change-init() {
    debug-function "shell-on-path-change-init" "Args: $@"
    # export SHELL_ON_PATH_CHANGE_LAST_PATH=$PWD
}

function shell-on-path-change-update() {
    debug-function "shell-on-path-change-update" "Args: $@"
    # local current_path=$PWD
    # if [ "$SHELL_ON_PATH_CHANGE_LAST_PATH" != "$current_path" ]; then
    #     shell-on-path-change-notify $@
    #     export SHELL_ON_PATH_CHANGE_LAST_PATH=$current_path
    # fi
}

function shell-on-path-change() {
    local command=$1
    debug-function "shell-on-path-change" "Args: $@, Current: $PWD"
    case $command in
        init)
            shell-on-path-change-init ${@:2}
            ;;
        change)
            shell-on-path-change-update ${@:2}
            ;;
        *)
            # shell-on-path-change-notify ${@:2}
            echo-error "TODO shell-on-path-change"
            ;;
    esac
    # shell-on-path-change-notify $@
    # shell-on-path-change-update $@
}