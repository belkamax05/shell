echo-fn() {
    local preffix="$SHELL_PREFFIX"
    local command=$1
    local args=(${@:2})
    if [[ $command == "error" ]]; then
        preffix="$SHELL_PREFFIX_ERROR"
    elif [[ $command == "success" ]]; then
        preffix="$SHELL_PREFFIX_SUCCESS"
    elif [[ $command == "info" ]]; then
        preffix="$SHELL_PREFFIX_INFO"
    elif [[ $command == "warning" ]]; then
        preffix="$SHELL_PREFFIX_WARNING"
    else
        args=($@)
    fi
    echo "$preffix ${args[@]}"
}
echo-error() {
    echo-fn error "$@"
}
echo-success() {
    echo-fn success "$@"
}
echo-info() {
    echo-fn info "$@"
}
echo-warning() {
    echo-fn warning "$@"
}