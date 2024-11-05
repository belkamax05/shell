s-service() {
    local script=$(gum choose "sample" "tweaks" "install-required" "install-optional")
    if [ -n "$script" ]; then
        s-service-$script
    fi
}