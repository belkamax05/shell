(
    if ls ~/.local/share/fonts/*Meslo* >/dev/null 2>&1; then
        return $CODE_OK
    fi
    return $CODE_ERROR
)