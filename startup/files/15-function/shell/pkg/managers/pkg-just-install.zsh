shell-pkg-just-install() {
    if [[ "$@" == *"--brew"* ]]; then
        s-run brew-just-install $@
        return $?
    fi
    if [[ "$@" == *"--deb"* ]]; then
        s-run deb-just-install $@
        return $?
    fi
    if [[ "$@" == *"--snap"* ]]; then
        s-run snap-just-install $@
        return $?
    fi
    if [[ "$@" == *"--script"* ]]; then
        s-run script-just-install $@
        return $?
    fi

    if s-run script-pkg-can-install $@; then
        s-run script-pkg-just-install $@
        return $?
    fi
    if s-run snap-can-install $@; then
        s-run snap-just-install $@
        return $?
    fi
    if s-run brew-can-install $@; then
        s-run brew-just-install $@
        return $?
    fi
    if s-run deb-can-install $@; then
        s-run deb-just-install $@
        return $?
    fi
}