source-dir() {
    local dir="$1"
    for file in $(find "$dir" -type f | sort); do
        source "$file"
    done
}
build-dir() {
    local dir="$1"
    local output_file="$2"
    local file_list=()
    for file in $(find "$dir" -type f | sort); do
        file_list+=("$file")
    done
    echo-info "Building directory ${COLOR_ARGUMENT}$dir${STYLE_RESET} into ${COLOR_ARGUMENT}$output_file${STYLE_RESET}"
    mkdir -p "$(dirname "$output_file")"
    awk 'FNR==1 && NR!=1 {print ""} {print}' "${file_list[@]}" > "$output_file"
    
}
source-built-dir() {
    local dir="$1"
    local output_file="$2"
    if [[ ! -f "$output_file" ]]; then
        build-dir "$dir" "$output_file"
    fi
    source "$output_file"
    return $CODE_OK
}