s-pkg-is-installed() {
    if [[ "$@" == *"--brew"* ]]; then
        s-run brew-is-installed $@
        return $?
    fi
    if [[ "$@" == *"--deb"* ]]; then
        s-run deb-is-installed $@
        return $?
    fi
    if [[ "$@" == *"--snap"* ]]; then
        s-run snap-is-installed $@
        return $?
    fi
    if [[ "$@" == *"--script"* ]]; then
        s-run script-pkg-is-installed $@
        return $?
    fi
    local howInstalled=$(s-run pkg-how $@ --first)
    if [ -z "$howInstalled" ]; then
        return $CODE_ERROR
    else
        return $CODE_OK
    fi
}