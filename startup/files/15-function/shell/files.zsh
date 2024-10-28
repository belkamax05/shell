function shell-files() {
    _load() {
        local files_dir="$1"
        for file in $(find "$files_dir" -type f | sort); do
            source "$file"
        done
    }
    _build() {
        local files_dir="$1"
        local output_file="$2"

        local file_list=()
        #for file in $(ls "$files_dir" | sort); do
        for file in $(find "$files_dir" -type f | sort); do
            file_list+=("$file")
        done

        mkdir -p "$(dirname "$output_file")"
        awk 'FNR==1 && NR!=1 {print ""} {print}' "${file_list[@]}" > "$output_file"
    }
    _build-include() {
        local files_dir="$1"
        local output_file="$2"
        if [ -f "$output_file" ]; then
            source "$output_file"
            return $CODE_OK
        fi
        _build "$files_dir" "$output_file"
        source "$output_file"
        return $CODE_OK
    }
    case $1 in
        load)
            _load ${@:2}
            ;;
        build)
            _build ${@:2}
            ;;
        build-include)
            _build-include ${@:2}
            ;;
        *)
            echo-error "Command $command not found"
            ;;
    esac
}