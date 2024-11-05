s-source-dir() {
    local dir="$1"
    for file in $(find "$dir" -type f | sort); do
        source "$file"
    done
}