s-service-tweaks() {
    local options=(
        "sample-tweak"
        "sudo-nopwd"
        "default-zsh"
        "dark-theme"
    )
    if s-is linux; then
        options+=("gnome-no-logout-prompt")
    fi
    local value=$(gum choose "sample-tweak" "sudo-nopwd" "default-zsh" "gnome-no-logout-prompt" "dark-theme")
    if [ -n "$value" ]; then
        s-tweak apply $value
    fi
}