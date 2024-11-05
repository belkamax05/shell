s-default-command() {
    local value=$(gum choose "compile" "service")
    if [ -n "$value" ]; then
        s-$value
    fi
}