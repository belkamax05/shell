s-prompt() {
    if [[ -n "$1" ]]; then
        s-prompt-$1 "${@:2}"
    else
        local command=$(p-choose "p10k" --header="What prompt to use?")
        s-prompt-$command "$@"
    fi
}