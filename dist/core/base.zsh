#? shell alias
alias hard-exit="s-run hard-exit"
alias soft-exit="s-run soft-exit"
alias nav="s-run nav"
alias clear-cache="s-run clear-cache"
alias restart="s-run restart"
alias load="s-run load"
alias reload="s-run reload"
alias here="s-run here"
alias me="s-run me"
alias sc="s-run compile"

#? shorthands
alias shell="s-run"
alias she="hard-exit"
alias he="hard-exit"
alias sse="soft-exit"
alias ssr="soft-exit & restart"
alias s="s-run"
alias se="soft-exit"
alias scc="clear-cache"
alias scs="clear-startup"
alias rs="restart"
alias l="load"
alias rl="reload"
alias rr="restart"

#? global aliases

alias clr="clear"
alias c="clear"
alias dir='ls'
alias up="cd .."

#? some more ls aliases

# alias ll="ls -la"
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias fd="fdfind"
alias pip=pip3

CODE_OK=0
CODE_ERROR=1
CODE_WARNING=2
CODE_INFO=3
CODE_DEBUG=4
CODE_VERBOSE=5
CODE_TRACE=6
CODE_SILENT=7
CODE_NOT_FOUND=127

#? base colors
COLOR_CYAN="\033[38;5;51m"             #00FFFF
COLOR_DARK_RED="\033[38;5;196m"        #FF3131
COLOR_YELLOW="\033[38;5;226m"          #FFFF00
COLOR_HOTPINK="\033[38;5;199m"         #FF00AF
COLOR_GREEN="\033[38;5;46m"            #00FF00
COLOR_MAGENTA="\033[38;2;201;101;201m" #C965C9
COLOR_WHITE="\033[38;5;231m"           #FFFFFF
COLOR_DARK_BLUE="\033[38;5;21m"        #0000FF
COLOR_DARK_GREEN="\033[38;5;22m"       #00FF00
COLOR_DARK_YELLOW="\033[38;5;58m"      #FFFF00
COLOR_DARK_CYAN="\033[38;5;37m"        #00FFFF
COLOR_DARK_MAGENTA="\033[38;5;90m"     #FF00FF
COLOR_DARK_WHITE="\033[38;5;255m"      #FFFFFF
COLOR_DARK_GRAY="\033[38;5;240m"       #808080
COLOR_DARK_ORANGE="\033[38;5;208m"     #FFA500
COLOR_DARK_PINK="\033[38;5;198m"       #FF69B4
COLOR_DARK_PURPLE="\033[38;5;57m"      #800080
COLOR_DARK_TURQUOISE="\033[38;5;44m"   #40E0D0

#? semantic colors
COLOR_COMMAND="$COLOR_CYAN"
COLOR_INFO="$COLOR_CYAN"
COLOR_ARGUMENT="$COLOR_YELLOW"
COLOR_PARAMS="$COLOR_DARK_PINK"
COLOR_SUCCESS="$COLOR_GREEN"
COLOR_ERROR="$COLOR_DARK_RED"
COLOR_DEBUG="$COLOR_MAGENTA"
COLOR_WARNING="$COLOR_DARK_ORANGE"

#? styles
STYLE_RESET="\033[0m"
STYLE_BOLD="\033[1m"

SHELL_UNAME="$(uname -s)"

SHELL_DIST="$SHELL_DIR/dist"

SHELL_CONFIGS_DIR="$SHELL_DIR/configs"
SHELL_DOTFILES_DIR="$SHELL_CONFIGS_DIR/dotfiles"

SHARED_DIR="$HOME/.local/share"
SHELL_SHARED_DIR="$SHARED_DIR/shell"
SHELL_DOWNLOADS_DIR="$SHELL_SHARED_DIR/downloads"

SHELL_CACHE_DIR="$SHELL_SHARED_DIR/cache"

SHELL_PLUGINS_DIR="$SHELL_SHARED_DIR/plugins"

SHELL_STARTUP_DIR="$SHELL_DIR/startup"

SHELL_EVENTS_DIR="$SHELL_DIR/events"

SHELL_SCRIPTS_DIR="$SHELL_DIR/scripts"
SHELL_INSTALL_DIR="$SHELL_SCRIPTS_DIR/install"

SHELL_TWEAKS_DIR="$SHELL_SCRIPTS_DIR/tweaks"

SHELL_LINKS_DIR="$SHELL_DIR/links"

SHELL_LIBS_SRC_DIR="$SHELL_DIR/libs"
SHELL_LIBS_DIST_DIR="$SHELL_CACHE_DIR/libs"


#? nvm
# export NVM_DIR="$HOME/.nvm"

#? zap
ZAP_DIR="$SHARED_DIR/zap"
XDG_DATA_HOME="$SHARED_DIR"

#? mvn
MVN_DIR="$SHELL_PLUGINS_DIR/apache-maven-3.9.7"

CURRENT_FILE_PATH="${(%):-%x}"

# export PATH="$PATH:/usr/local/bin/docker"

# PATH="XX/bin:$PATH"
# Warning: /opt/homebrew/bin is not in your PATH.

SHELL_PREFFIX="shell "
SHELL_PREFFIX_ECHO="${COLOR_CYAN}$SHELL_PREFFIX${STYLE_RESET} 💬"
SHELL_PREFFIX_ERROR="${COLOR_ERROR}$SHELL_PREFFIX${STYLE_RESET} ❌"
SHELL_PREFFIX_SUCCESS="${COLOR_SUCCESS}$SHELL_PREFFIX${STYLE_RESET} ✅"
SHELL_PREFFIX_INFO="${COLOR_CYAN}$SHELL_PREFFIX${STYLE_RESET} ℹ️ "
SHELL_PREFFIX_DEBUG="${COLOR_DEBUG}$SHELL_PREFFIX${STYLE_RESET} 🚧"
SHELL_PREFFIX_WARNING="${COLOR_WARNING}$SHELL_PREFFIX${STYLE_RESET} ⚠️"

echo-fn() {
    local preffix="$SHELL_PREFFIX"
    local command=$1
    local args=(${@:2})
    if [[ $command == "error" ]]; then
        preffix="$SHELL_PREFFIX_ERROR"
    elif [[ $command == "success" ]]; then
        preffix="$SHELL_PREFFIX_SUCCESS"
    elif [[ $command == "info" ]]; then
        preffix="$SHELL_PREFFIX_INFO"
    elif [[ $command == "warning" ]]; then
        preffix="$SHELL_PREFFIX_WARNING"
    else
        args=($@)
    fi
    echo "$preffix ${args[@]}"
}
echo-error() {
    echo-fn error "$@"
}
echo-success() {
    echo-fn success "$@"
}
echo-info() {
    echo-fn info "$@"
}
echo-warning() {
    echo-fn warning "$@"
}

source-dir() {
    local dir="$1"
    for file in $(find "$dir" -type f | sort); do
        source "$file"
    done
}
build-dir() {
    local dir="$1"
    local output_file="$2"
    local file_list=()
    for file in $(find "$dir" -type f | sort); do
        file_list+=("$file")
    done
    echo-info "Building directory ${COLOR_ARGUMENT}$dir${STYLE_RESET} into ${COLOR_ARGUMENT}$output_file${STYLE_RESET}"
    mkdir -p "$(dirname "$output_file")"
    awk 'FNR==1 && NR!=1 {print ""} {print}' "${file_list[@]}" > "$output_file"
    
}
source-built-dir() {
    local dir="$1"
    local output_file="$2"
    if [[ ! -f "$output_file" ]]; then
        build-dir "$dir" "$output_file"
    fi
    source "$output_file"
    return $CODE_OK
}
