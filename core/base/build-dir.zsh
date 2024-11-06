s-build-dir() {
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