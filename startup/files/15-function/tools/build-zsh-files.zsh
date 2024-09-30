function build-zsh-files() {
    debug-function build-zsh-files $@
    local files_dir="$1"
    local output_file="$2"

    local file_list=()
    #for file in $(ls "$files_dir" | sort); do
    for file in $(find "$files_dir" -type f | sort); do
        file_list+=("$file")
    done

    awk 'FNR==1 && NR!=1 {print ""} {print}' "${file_list[@]}" > "$output_file"
}