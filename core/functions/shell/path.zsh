s-path-prepend() {
    local value="$1"
    export PATH="$value:$PATH"
}
s-path-remove-duplicates() {
    export PATH=$(echo -n $PATH | awk -v RS=: -v ORS=: '!a[$0]++' | sed 's/:$//')
}
