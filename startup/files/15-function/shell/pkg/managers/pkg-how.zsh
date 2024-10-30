s-pkg-how() {
    local pkg_name=$1
    local installed_pkg_managers=""
    local stop_at_first=false
    if [[ "$@" == *"--first"* ]]; then
        stop_at_first=true
    fi
    if s-run deb-is-installed $pkg_name; then
        installed_pkg_managers+="deb "
        $stop_at_first && echo "${installed_pkg_managers% }" && return
    fi
    if s-run brew-is-installed $pkg_name; then
        installed_pkg_managers+="brew "
        $stop_at_first && echo "${installed_pkg_managers% }" && return
    fi
    if s-run snap-is-installed $pkg_name; then
        installed_pkg_managers+="snap "
        $stop_at_first && echo "${installed_pkg_managers% }" && return
    fi
    if s-run script-pkg-is-installed $pkg_name; then
        installed_pkg_managers+="script "
        $stop_at_first && echo "${installed_pkg_managers% }" && return
    fi
    if command -v $pkg_name &> /dev/null; then
        installed_pkg_managers+="shell "
        $stop_at_first && echo "${installed_pkg_managers% }" && return
    fi
    echo "${installed_pkg_managers% }"
}