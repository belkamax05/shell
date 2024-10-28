shell-install2() {
    s-run pkg install $@
}

shell-pkg() {
    _pkgIsInstalled() {
        if s-run deb-pkg is-installed $@; then
            return $CODE_OK
        elif s-run snap-pkg is-installed $@; then
            return $CODE_OK
        elif s-run brew-pkg is-installed $@; then
            return $CODE_OK
        elif s-run script-pkg is-installed $@; then
            return $CODE_OK
        elif s-run gnome-ext-pkg is-installed $@; then
            return $CODE_OK
        else
            return $CODE_ERROR
        fi
    }

    _pkgInstall() {
        local howInstalled=$(shell pkg-installed-how $@ --first)
        # echo "$@ is installed by $howInstalled"
        local pkg_name=$1
        if [ -z "$howInstalled" ]; then
            echo-info "Package ${COLOR_YELLOW}$pkg_name${STYLE_RESET} is ${COLOR_RED}not installed${STYLE_RESET}"
        else
            echo-info "Package ${COLOR_YELLOW}$pkg_name${STYLE_RESET} is installed by ${COLOR_CYAN}$howInstalled${STYLE_RESET}"
        fi
        return $CODE_OK


        if s-run brew-pkg install $@; then
            return $CODE_OK
        elif s-run script-pkg install $@; then
            return $CODE_OK
        elif s-run snap-pkg install $@; then
            return $CODE_OK
        elif s-run deb-pkg install $@; then
            return $CODE_OK
        elif s-run gnome-ext-pkg install $@; then
        else
            return $CODE_ERROR
        fi
    }

    case $1 in
        is-installed)
            _pkgIsInstalled ${@:2};
            ;;
        install)
            _pkgInstall ${@:2};
            ;;
        *)
            _pkgInstall ${@:2};
            ;;
    esac
}


shell-install() {
    _cancel() {
        INSTALL_RUN_CANCEL=1
    }
    _install() {
        if [ -f "$SHELL_INSTALL_FILES_DIR/$function_name.zsh" ]; then
            source "$SHELL_INSTALL_FILES_DIR/$function_name.zsh"
            return $CODE_OK
        fi
        if [ -f "$SHELL_INSTALL_FILES_DIR/$function_name/install.zsh" ]; then
            source "$SHELL_INSTALL_FILES_DIR/$function_name/install.zsh"
            return $CODE_OK
        fi
        return $CODE_ERROR
    }
    _run() {
        local -r function_name="$1"
        INSTALL_RUN_CANCEL=0
        if [ -f "$SHELL_INSTALL_FILES_DIR/$function_name/prepare.zsh" ]; then
            source "$SHELL_INSTALL_FILES_DIR/$function_name/prepare.zsh"
        fi
        if [ $INSTALL_RUN_CANCEL -eq 1 ]; then
            debug-install "Installation of ${COLOR_ARGUMENT}$function_name${STYLE_RESET} was cancelled"
            return $CODE_OK
        fi
        _install $function_name
        if [ $? -eq 0 ]; then
            return $CODE_OK
        fi
        echo-error "Function $function_name not found"
        return $CODE_ERROR
    }
    # _install_required() {
    #     debug-install "Installing required packages..."
    #     mkdir -p "$SHELL_PLUGINS_DIR"
    #     # s-run install zap
    #     # s-run install nvm
    # }
    case $1 in
        cancel)
            _cancel ${@:2}
            ;;
        run)
            _run ${@:2}
            ;;
        # required)
        #     _install_required ${@:2}
        #     ;;
        *)
            _run $@
            ;;
    esac
}