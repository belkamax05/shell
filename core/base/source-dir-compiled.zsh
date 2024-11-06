s-source-dir-compiled() {
    local dir="$1"
    local output_file="$2"
    if [[ ! -f "$output_file" ]]; then
        s-build-dir "$dir" "$output_file"
    fi
    source "$output_file"
    return $CODE_OK
}