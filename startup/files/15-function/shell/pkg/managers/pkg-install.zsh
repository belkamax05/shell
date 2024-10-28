shell-pkg-install() {
    if s-run pkg-is-installed $@; then
        local howInstalled=$(shell pkg-installed-how $@ --first)
        echo-info "Package ${COLOR_YELLOW}$1${STYLE_RESET} is already installed via ${COLOR_CYAN}$howInstalled${STYLE_RESET}."
    else
        s-run pkg-just-install $@
    fi
}

#  _pkgInstall() {
#         local howInstalled=$(shell pkg-installed-how $@ --first)
#         # echo "$@ is installed by $howInstalled"
#         local pkg_name=$1
#         if [ -z "$howInstalled" ]; then
#             echo-info "Package ${COLOR_YELLOW}$pkg_name${STYLE_RESET} is ${COLOR_RED}not installed${STYLE_RESET}"
#         else
#             echo-info "Package ${COLOR_YELLOW}$pkg_name${STYLE_RESET} is installed by ${COLOR_CYAN}$howInstalled${STYLE_RESET}"
#         fi
#         return $CODE_OK


#         if s-run brew-pkg install $@; then
#             return $CODE_OK
#         elif s-run script-pkg install $@; then
#             return $CODE_OK
#         elif s-run snap-pkg install $@; then
#             return $CODE_OK
#         elif s-run deb-pkg install $@; then
#             return $CODE_OK
#         elif s-run gnome-ext-pkg install $@; then
#         else
#             return $CODE_ERROR
#         fi
#     }