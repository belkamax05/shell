shell-pkg-remove() {
    howInstalled=""
    if s-run pkg-is-installed $@; then
        howInstalled=$(shell pkg-installed-how $@ --first)
        # echo-info "Package ${COLOR_YELLOW}$1${STYLE_RESET} is already installed via ${COLOR_CYAN}$howInstalled${STYLE_RESET}."
    fi
    if [[ -z $howInstalled ]]; then
        echo-info "Package ${COLOR_YELLOW}$1${STYLE_RESET} is not installed."
    else
        case $howInstalled in
            brew) s-run brew-remove $@ ;;
            deb) s-run deb-remove $@ ;;
            snap) s-run snap-remove $@ ;;
            script) s-run script-pkg-remove $@ ;;
            *) echo-error "Unsupported package manager: $howInstalled" ;;
        esac
    fi
}