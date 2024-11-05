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

export SHELL=$(which zsh)

path-prepend() {
    local value="$1"
    if [[ -d "$value" && ":$PATH:" != *":$value:"* ]]; then
        export PATH="$PATH:$value"
    fi
}

path-prepend "$MVN_DIR/bin"
path-prepend "/home/.linuxbrew/bin"
path-prepend "$HOME/bin"
path-prepend "/opt/homebrew/bin"
path-prepend "$SHELL_CONFIGS_DIR/bin"
path-prepend "$NVM_DIR/bin"
path-prepend "/usr/local/bin/docker"

shell-ghub-gui() {
    sudo $SHELL_PLUGINS_DIR/ghub-gui/ghub-gui
}

is-echo-command() {
    local command=$1
    if [[ $command == "error" || $command == "success" || $command == "info" || $command == "warning" ]]; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}

verbose() {
    s-not verbose && return $CODE_OK
    local command=$1
    if is-echo-command $command; then
        echo-fn $command "${COLOR_CYAN}[[VERBOSE]]${STYLE_RESET} ${@:2}"
    else
        echo-fn "${COLOR_CYAN}[[VERBOSE]]${STYLE_RESET} $@"
    fi
}

compiling() {
    s-not compiled && return $CODE_OK
    local command=$1
    if is-echo-command $command; then
        echo-fn $command "${COLOR_YELLOW}[[COMPILING]]${STYLE_RESET} ${@:2}"
    else
        echo-fn "${COLOR_YELLOW}[[COMPILING]]${STYLE_RESET} $@"
    fi
}

debug() {
    s-not debug && return $CODE_OK
    local command=$1
    if is-echo-command $command; then
        echo-fn $command "${COLOR_MAGENTA}[[DEBUG]]${STYLE_RESET} ${@:2}"
    else
        echo-fn "${COLOR_MAGENTA}[[DEBUG]]${STYLE_RESET} $@"
    fi
}

tracing() {
    s-not tracing && return $CODE_OK
    local diffTime=$(s-timer diff tracing)
    echo "${COLOR_WHITE}$diffTime ${STYLE_RESET} $@"
}

function chpwd() {
  s-pather update
}

function command_not_found_handler {
    local command="$1"
    if s-is compiled; then
        s-not-found $@
        local _status=$?
        return $_status
    fi
    echo-error "${COLOR_COMMAND}command_not_found_handler${STYLE_RESET}" "Not found '${COLOR_ARGUMENT}$command${STYLE_RESET}'"
    return $CODE_NOT_FOUND
}

# function command_not_found_handler {
#     # echo "Not fund is under development"
#     # return $CODE_NOT_FOUND
# }

shell-runtime-apply-tweaks() {
    #? common tweaks
    for tweak in  sample-tweak sudo-nopwd; do
        s-run tweak apply $tweak
    done
    #? linux only tweaks
    if s-is linux; then
        for tweak in default-zsh gnome-no-logout-prompt dark-theme; do
            s-run tweak apply $tweak
        done
    fi
}

s-runtime-autoload() {
    fpath=($SHELL_DIR/functions $fpath)
    local allFunctions=($SHELL_DIR/functions/*)
    autoload -Uz $allFunctions
    autoload -U add-zsh-hook
}
    

s-runtime-completions() {
    tracing "Load runtime completions"
    autoload -Uz compinit
    compinit

    # compdef _shell shell
    # compdef _nav shell nav

    # function _nav {
    #   local -a nav_suggestions=()
    #   for key in "${(k)paths_alias_list[@]}"; do
    #     echo _nav "Add suggestion: $key"
    #     nav_suggestions+=($key)
    #   done
    #   compadd -- ${nav_suggestions}
    # }

}

shell-runtime-create-folders() {
    mkdir -p "$SHELL_DOWNLOADS_DIR"
    mkdir -p "$SHELL_PLUGINS_DIR"
}

shell-runtime-fzf-configure() {
    # # Feed the output of fd into fzf
    # fd --type f --strip-cwd-prefix | fzf

    # # Setting fd as the default source for fzf
    # export FZF_DEFAULT_COMMAND='fd --type f'

    # # Now fzf (w/o pipe) will use the fd command to generate the list
    # fzf

    # # To apply the command to CTRL-T as well
    # export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

    s-is linux && DEFAULT_FILE_FINDER=fdfind
    s-is darwin && DEFAULT_FILE_FINDER=fd

    #? Variables

    open_command="xargs -r code-insiders"
    preview_base="--preview 'bat -n --color=always {}'"
    preview_ui="--height 100% --info inline --border \
        --preview 'bat -n --color=always {}' --preview-window right,50%,border-horizontal \
        --bind 'ctrl-/:change-preview-window(50%|hidden|)' \
        --color 'fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899'"

    #? Initialisation

    #? Core configuration

    # https://github.com/junegunn/fzf#readme
    # [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

    # source <(fzf --zsh)
    # HISTFILE=~/.zsh_history
    # HISTSIZE=10000
    # SAVEHIST=10000
    # setopt appendhistory

    #? Finalise

    #? Aliases

    alias fp="fzf ${preview_base} | ${open_command}"
    alias f="fzf ${preview_ui} | ${open_command}"

    #? Exports

    export FZF_DEFAULT_COMMAND="$DEFAULT_FILE_FINDER --type f --strip-cwd-prefix --hidden --follow --exclude .git"
    # set -g FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"
    # export FZF_DEFAULT_COMMAND='ag -l --path-to-ignore ~/.ignore --nocolor --hidden -g ""'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

    export FZF_CTRL_T_OPTS="
    --walker-skip .git,node_modules,target
    --preview 'bat -n --color=always {}'
    --bind 'ctrl-/:change-preview-window(down|hidden|)'"

    #? Post-experiments

    # export FZF_DEFAULT_COMMAND="fzf ${layout_ui} | ${open_command}"
    # export FZF_CTRL_T_COMMAND="fzf ${layout_preview} | ${open_command}"
    # set -gx FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git --exclude node_modules"

    # set -gx FZF_COMPLETION_TRIGGER '@@'
    # set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border --preview-window down:1"
    # set -gx FZF_ALT_C_COMMAND "fd -t d . $HOME"
    # set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

    # eval "$(fzf --zsh)"

    # source <(fzf --zsh)
}

s-runtime-hooks() {
    tracing "Load runtime hooks"
    add-zsh-hook chpwd load-nvmrc
}

shell-runtime-kali() {
    tracing "Load kali runtime"

    # ~/.zshrc file for zsh interactive shells.
    # see /usr/share/doc/zsh/examples/zshrc for examples

    setopt autocd              # change directory just by typing its name
    #setopt correct            # auto correct mistakes
    setopt interactivecomments # allow comments in interactive mode
    setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
    setopt nonomatch           # hide error message if there is no match for the pattern
    setopt notify              # report the status of background jobs immediately
    setopt numericglobsort     # sort filenames numerically when it makes sense
    setopt promptsubst         # enable command substitution in prompt

    WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

    # hide EOL sign ('%')
    PROMPT_EOL_MARK=""

    # configure key keybindings
    bindkey -e                                        # emacs key bindings
    bindkey ' ' magic-space                           # do history expansion on space
    bindkey '^U' backward-kill-line                   # ctrl + U
    bindkey '^[[3;5~' kill-word                       # ctrl + Supr
    bindkey '^[[3~' delete-char                       # delete
    bindkey '^[[1;5C' forward-word                    # ctrl + ->
    bindkey '^[[1;5D' backward-word                   # ctrl + <-
    bindkey '^[[5~' beginning-of-buffer-or-history    # page up
    bindkey '^[[6~' end-of-buffer-or-history          # page down
    bindkey '^[[H' beginning-of-line                  # home
    bindkey '^[[F' end-of-line                        # end
    bindkey '^[[Z' undo                               # shift + tab undo last action

    # enable completion features
    compinit -d ~/.cache/zcompdump
    zstyle ':completion:*:*:*:*:*' menu select
    zstyle ':completion:*' auto-description 'specify: %d'
    zstyle ':completion:*' completer _expand _complete
    zstyle ':completion:*' format 'Completing %d'
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*' list-colors ''
    zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
    zstyle ':completion:*' rehash true
    zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
    zstyle ':completion:*' use-compctl false
    zstyle ':completion:*' verbose true
    zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

    # History configurations
    HISTFILE=~/.zsh_history
    HISTSIZE=1000
    SAVEHIST=2000
    setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
    setopt hist_ignore_dups       # ignore duplicated commands history list
    setopt hist_ignore_space      # ignore commands that start with space
    setopt hist_verify            # show command with history expansion to user before running it
    #setopt share_history         # share command history data

    # force zsh to show the complete history
    alias history="history 0"

    # configure `time` format
    TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

    # make less more friendly for non-text input files, see lesspipe(1)
    #[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

    # set variable identifying the chroot you work in (used in the prompt below)
    if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
        debian_chroot=$(cat /etc/debian_chroot)
    fi

    # set a fancy prompt (non-color, unless we know we "want" color)
    case "$TERM" in
        xterm-color|*-256color) color_prompt=yes;;
    esac

    # uncomment for a colored prompt, if the terminal has the capability; turned
    # off by default to not distract the user: the focus in a terminal window
    # should be on the output of commands, not on the prompt
    force_color_prompt=yes

    if [ -n "$force_color_prompt" ]; then
        if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
            # We have color support; assume it's compliant with Ecma-48
            # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
            # a case would tend to support setf rather than setaf.)
            color_prompt=yes
        else
            color_prompt=
        fi
    fi

    configure_prompt() {
        prompt_symbol=㉿
        # Skull emoji for root terminal
        #[ "$EUID" -eq 0 ] && prompt_symbol=💀
        case "$PROMPT_ALTERNATIVE" in
            twoline)
                PROMPT=$'%F{%(#.blue.green)}┌──${debian_chroot:+($debian_chroot)─}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))─}(%B%F{%(#.red.blue)}%n'$prompt_symbol$'%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '
                # Right-side prompt with exit codes and background processes
                #RPROMPT=$'%(?.. %? %F{red}%B⨯%b%F{reset})%(1j. %j %F{yellow}%B⚙%b%F{reset}.)'
                ;;
            oneline)
                PROMPT=$'${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{%(#.red.blue)}%n@%m%b%F{reset}:%B%F{%(#.blue.green)}%~%b%F{reset}%(#.#.$) '
                RPROMPT=
                ;;
            backtrack)
                PROMPT=$'${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{red}%n@%m%b%F{reset}:%B%F{blue}%~%b%F{reset}%(#.#.$) '
                RPROMPT=
                ;;
        esac
        unset prompt_symbol
    }

    # The following block is surrounded by two delimiters.
    # These delimiters must not be modified. Thanks.
    # START KALI CONFIG VARIABLES
    PROMPT_ALTERNATIVE=twoline
    NEWLINE_BEFORE_PROMPT=yes
    # STOP KALI CONFIG VARIABLES

    if [ "$color_prompt" = yes ]; then
        # override default virtualenv indicator in prompt
        VIRTUAL_ENV_DISABLE_PROMPT=1

        configure_prompt

        # enable syntax-highlighting
        if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
            . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
            ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
            ZSH_HIGHLIGHT_STYLES[default]=none
            ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
            ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
            ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
            ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
            ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
            ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
            ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
            ZSH_HIGHLIGHT_STYLES[path]=bold
            ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
            ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
            ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
            ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
            ZSH_HIGHLIGHT_STYLES[command-substitution]=none
            ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
            ZSH_HIGHLIGHT_STYLES[process-substitution]=none
            ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
            ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
            ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
            ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
            ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
            ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
            ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
            ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
            ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
            ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
            ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
            ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
            ZSH_HIGHLIGHT_STYLES[assign]=none
            ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
            ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
            ZSH_HIGHLIGHT_STYLES[named-fd]=none
            ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
            ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
            ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
            ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
            ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
            ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
            ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
            ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
            ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
        fi
    else
        PROMPT='${debian_chroot:+($debian_chroot)}%n@%m:%~%(#.#.$) '
    fi
    unset color_prompt force_color_prompt

    toggle_oneline_prompt(){
        if [ "$PROMPT_ALTERNATIVE" = oneline ]; then
            PROMPT_ALTERNATIVE=twoline
        else
            PROMPT_ALTERNATIVE=oneline
        fi
        configure_prompt
        zle reset-prompt
    }
    zle -N toggle_oneline_prompt
    # bindkey ^P toggle_oneline_prompt #? was disabled due to conflict

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
    xterm*|rxvt*|Eterm|aterm|kterm|gnome*|alacritty)
        TERM_TITLE=$'\e]0;${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%n@%m: %~\a'
        ;;
    *)
        ;;
    esac

    precmd() {
        # Print the previously configured title
        print -Pnr -- "$TERM_TITLE"

        # Print a new line before the prompt, but only if it is not the first line
        if [ "$NEWLINE_BEFORE_PROMPT" = yes ]; then
            if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
                _NEW_LINE_BEFORE_PROMPT=1
            else
                print ""
            fi
        fi
    }

    # enable color support of ls, less and man, and also add handy aliases
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions

        # alias ls='ls --color=auto'
        #alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'

        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
        alias diff='diff --color=auto'
        alias ip='ip --color=auto'

        export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
        export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
        export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
        export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
        export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
        export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
        export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

        # Take advantage of $LS_COLORS for completion as well
        zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
        zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
    fi

    # enable auto-suggestions based on the history
    if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        # change suggestion color
        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
    fi

    # enable command-not-found if installed
    if [ -f /etc/zsh_command_not_found ]; then
        . /etc/zsh_command_not_found
    fi

}

shell-runtime-keybindings() {
    tracing "Load keybindings"
    # bindkey -s '^b' 'echo Hello here^M'

    # function get_bindkey_value() {
    #   local hotkey="$1"
    #   local bindings_file="bindings.sh"

    #   # Escape special characters in hotkey for grep
    #   local escaped_hotkey=$(echo "$hotkey" | sed 's/\^/\\\^/g')

    #   # Search for the hotkey in the bindings file and extract the command
    #   local command=$(grep "bindkey -s '$escaped_hotkey'" "$bindings_file" | sed "s/bindkey -s '$escaped_hotkey' '\(.*\)^M'/\1/")

    #   if [ -z "$command" ]; then
    #     echo "No command found for hotkey: $hotkey"
    #   else
    #     echo "Command for hotkey '$hotkey': $command"
    #   fi
    # }

    function listen_hotkey() {
        echo "Press a hotkey sequence (e.g., '^y^b'): "
        read -r input_hotkey
    }
    bindkey -s '^h^k' 'listen_hotkey^M'
    # bindkey -s '^N' 'echo Hello^M'

    # bindkey -s '^y^b^p' 'yarn build --prod^M'
    # bindkey -s '^y^b^d' 'yarn build --dev^M'
    # bindkey -s '^y^b' 'yarn build^M'
    # bindkey -s '^y^s^p' 'yarn start --prod^M'
    # bindkey -s '^y^s' 'yarn start^M'
    # bindkey -s '^m' 'yarn mock^M'


# bindkey '^R' history-incremental-search-backward
# bindkey '^S' history-incremental-search-forward

}

s-runtime-options-history-limit() {
    HISTSIZE=1000           # Number of commands to keep in memory
    SAVEHIST=500            # Commands to keep in the history file
    HISTFILE=~/.zsh_history # Location of the history file
    setopt hist_ignore_all_dups  # Ignore duplicate commands
    setopt share_history    # Share history across sessions

}

s-runtime-options() {
    setopt auto_pushd

    s-run runtime-options-history-limit
}

shell-runtime-print-info() {
    echo "Runtime debug goes here"
}

shell-runtime-prompt-plugin() {
    plug "romkatv/powerlevel10k"
}

shell-runtime-prompt-configure() {
  # Generated by Powerlevel10k configuration wizard on 2024-08-20 at 04:40 WEST.
  # Based on romkatv/powerlevel10k/config/p10k-rainbow.zsh, checksum 44011.
  # Wizard options: nerdfont-complete + powerline, large icons, rainbow, unicode,
  # round separators, sharp heads, sharp tails, 2 lines, disconnected, full frame,
  # light-ornaments, sparse, many icons, concise, transient_prompt, instant_prompt=quiet.
  # Type `p10k configure` to generate another config.
  #
  # Config for Powerlevel10k with powerline prompt style with colorful background.
  # Type `p10k configure` to generate your own config based on it.
  #
  # Tip: Looking for a nice color? Here's a one-liner to print colormap.
  #
  #   for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done

  # Temporarily change options.
  'builtin' 'local' '-a' 'p10k_config_opts'
  [[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
  [[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
  [[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
  'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

  () {
    emulate -L zsh -o extended_glob

    # Unset all configuration options. This allows you to apply configuration changes without
    # restarting zsh. Edit ~/.p10k.zsh and type `source ~/.p10k.zsh`.
    unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

    # Zsh >= 5.1 is required.
    [[ $ZSH_VERSION == (5.<1->*|<6->.*) ]] || return

    # The list of segments shown on the left. Fill it with the most important segments.
    typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
      # =========================[ Line #1 ]=========================
      os_icon                 # os identifier
      dir                     # current directory
      vcs                     # git status
      # =========================[ Line #2 ]=========================
      newline                 # \n
      # prompt_char           # prompt symbol
    )

    # The list of segments shown on the right. Fill it with less important segments.
    # Right prompt on the last prompt line (where you are typing your commands) gets
    # automatically hidden when the input line reaches it. Right prompt above the
    # last prompt line gets hidden if it would overlap with left prompt.
    typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
      # =========================[ Line #1 ]=========================
      status                  # exit code of the last command
      command_execution_time  # duration of the last command
      background_jobs         # presence of background jobs
      direnv                  # direnv status (https://direnv.net/)
      asdf                    # asdf version manager (https://github.com/asdf-vm/asdf)
      virtualenv              # python virtual environment (https://docs.python.org/3/library/venv.html)
      anaconda                # conda environment (https://conda.io/)
      pyenv                   # python environment (https://github.com/pyenv/pyenv)
      goenv                   # go environment (https://github.com/syndbg/goenv)
      nodenv                  # node.js version from nodenv (https://github.com/nodenv/nodenv)
      nvm                     # node.js version from nvm (https://github.com/nvm-sh/nvm)
      nodeenv                 # node.js environment (https://github.com/ekalinin/nodeenv)
      # node_version          # node.js version
      # go_version            # go version (https://golang.org)
      # rust_version          # rustc version (https://www.rust-lang.org)
      # dotnet_version        # .NET version (https://dotnet.microsoft.com)
      # php_version           # php version (https://www.php.net/)
      # laravel_version       # laravel php framework version (https://laravel.com/)
      # java_version          # java version (https://www.java.com/)
      # package               # name@version from package.json (https://docs.npmjs.com/files/package.json)
      rbenv                   # ruby version from rbenv (https://github.com/rbenv/rbenv)
      rvm                     # ruby version from rvm (https://rvm.io)
      fvm                     # flutter version management (https://github.com/leoafarias/fvm)
      luaenv                  # lua version from luaenv (https://github.com/cehoffman/luaenv)
      jenv                    # java version from jenv (https://github.com/jenv/jenv)
      plenv                   # perl version from plenv (https://github.com/tokuhirom/plenv)
      perlbrew                # perl version from perlbrew (https://github.com/gugod/App-perlbrew)
      phpenv                  # php version from phpenv (https://github.com/phpenv/phpenv)
      scalaenv                # scala version from scalaenv (https://github.com/scalaenv/scalaenv)
      haskell_stack           # haskell version from stack (https://haskellstack.org/)
      kubecontext             # current kubernetes context (https://kubernetes.io/)
      terraform               # terraform workspace (https://www.terraform.io)
      # terraform_version     # terraform version (https://www.terraform.io)
      aws                     # aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
      aws_eb_env              # aws elastic beanstalk environment (https://aws.amazon.com/elasticbeanstalk/)
      azure                   # azure account name (https://docs.microsoft.com/en-us/cli/azure)
      gcloud                  # google cloud cli account and project (https://cloud.google.com/)
      google_app_cred         # google application credentials (https://cloud.google.com/docs/authentication/production)
      toolbox                 # toolbox name (https://github.com/containers/toolbox)
      context                 # user@hostname
      nordvpn                 # nordvpn connection status, linux only (https://nordvpn.com/)
      ranger                  # ranger shell (https://github.com/ranger/ranger)
      yazi                    # yazi shell (https://github.com/sxyazi/yazi)
      nnn                     # nnn shell (https://github.com/jarun/nnn)
      lf                      # lf shell (https://github.com/gokcehan/lf)
      xplr                    # xplr shell (https://github.com/sayanarijit/xplr)
      vim_shell               # vim shell indicator (:sh)
      midnight_commander      # midnight commander shell (https://midnight-commander.org/)
      nix_shell               # nix shell (https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html)
      chezmoi_shell           # chezmoi shell (https://www.chezmoi.io/)
      vi_mode                 # vi mode (you don't need this if you've enabled prompt_char)
      # vpn_ip                # virtual private network indicator
      # load                  # CPU load
      # disk_usage            # disk usage
      # ram                   # free RAM
      # swap                  # used swap
      todo                    # todo items (https://github.com/todotxt/todo.txt-cli)
      timewarrior             # timewarrior tracking status (https://timewarrior.net/)
      taskwarrior             # taskwarrior task count (https://taskwarrior.org/)
      per_directory_history   # Oh My Zsh per-directory-history local/global indicator
      # cpu_arch              # CPU architecture
      # time                  # current time
      # =========================[ Line #2 ]=========================
      newline
      # ip                    # ip address and bandwidth usage for a specified network interface
      # public_ip             # public IP address
      # proxy                 # system-wide http/https/ftp proxy
      # battery               # internal battery
      # wifi                  # wifi speed
      # example               # example user-defined segment (see prompt_example function below)
    )

    # Defines character set used by powerlevel10k. It's best to let `p10k configure` set it for you.
    typeset -g POWERLEVEL9K_MODE=nerdfont-complete
    # When set to `moderate`, some icons will have an extra space after them. This is meant to avoid
    # icon overlap when using non-monospace fonts. When set to `none`, spaces are not added.
    typeset -g POWERLEVEL9K_ICON_PADDING=moderate

    # When set to true, icons appear before content on both sides of the prompt. When set
    # to false, icons go after content. If empty or not set, icons go before content in the left
    # prompt and after content in the right prompt.
    #
    # You can also override it for a specific segment:
    #
    #   POWERLEVEL9K_STATUS_ICON_BEFORE_CONTENT=false
    #
    # Or for a specific segment in specific state:
    #
    #   POWERLEVEL9K_DIR_NOT_WRITABLE_ICON_BEFORE_CONTENT=false
    typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=

    # Add an empty line before each prompt.
    typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

    # Connect left prompt lines with these symbols. You'll probably want to use the same color
    # as POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND below.
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%242F╭─'
    typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX='%242F├─'
    typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%242F╰─'
    # Connect right prompt lines with these symbols.
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX='%242F─╮'
    typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX='%242F─┤'
    typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX='%242F─╯'

    # Filler between left and right prompt on the first prompt line. You can set it to ' ', '·' or
    # '─'. The last two make it easier to see the alignment between left and right prompt and to
    # separate prompt from command output. You might want to set POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
    # for more compact prompt if using this option.
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_BACKGROUND=
    typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_GAP_BACKGROUND=
    if [[ $POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR != ' ' ]]; then
      # The color of the filler. You'll probably want to match the color of POWERLEVEL9K_MULTILINE
      # ornaments defined above.
      typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=242
      # Start filler from the edge of the screen if there are no left segments on the first line.
      typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
      # End filler on the edge of the screen if there are no right segments on the first line.
      typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'
    fi

    # Separator between same-color segments on the left.
    typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='\uE0B5'
    # Separator between same-color segments on the right.
    typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='\uE0B7'
    # Separator between different-color segments on the left.
    typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B4'
    # Separator between different-color segments on the right.
    typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B6'
    # To remove a separator between two segments, add "_joined" to the second segment name.
    # For example: POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(os_icon context_joined)

    # The right end of left prompt.
    typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
    # The left end of right prompt.
    typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
    # The left end of left prompt.
    typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
    # The right end of right prompt.
    typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
    # Left prompt terminator for lines without any segments.
    typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=

    #################################[ os_icon: os identifier ]##################################
    # OS identifier color.
    typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=232
    typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=7
    # Custom icon.
    # typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='⭐'

    ################################[ prompt_char: prompt symbol ]################################
    # Transparent background.
    typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=
    # Green prompt symbol if the last command succeeded.
    typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=76
    # Red prompt symbol if the last command failed.
    typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=196
    # Default prompt symbol.
    typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
    # Prompt symbol in command vi mode.
    typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
    # Prompt symbol in visual vi mode.
    typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='V'
    # Prompt symbol in overwrite vi mode.
    typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='▶'
    typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
    # No line terminator if prompt_char is the last segment.
    typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
    # No line introducer if prompt_char is the first segment.
    typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
    # No surrounding whitespace.
    typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_{LEFT,RIGHT}_WHITESPACE=

    ##################################[ dir: current directory ]##################################
    # Current directory background color.
    typeset -g POWERLEVEL9K_DIR_BACKGROUND=4
    # Default current directory foreground color.
    typeset -g POWERLEVEL9K_DIR_FOREGROUND=254
    # If directory is too long, shorten some of its segments to the shortest possible unique
    # prefix. The shortened directory can be tab-completed to the original.
    typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
    # Replace removed segment suffixes with this symbol.
    typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
    # Color of the shortened directory segments.
    typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=250
    # Color of the anchor directory segments. Anchor segments are never shortened. The first
    # segment is always an anchor.
    typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=255
    # Display anchor directory segments in bold.
    typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
    # Don't shorten directories that contain any of these files. They are anchors.
    local anchor_files=(
      .bzr
      .citc
      .git
      .hg
      .node-version
      .python-version
      .go-version
      .ruby-version
      .lua-version
      .java-version
      .perl-version
      .php-version
      .tool-versions
      .shorten_folder_marker
      .svn
      .terraform
      CVS
      Cargo.toml
      composer.json
      go.mod
      package.json
      stack.yaml
    )
    typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
    # If set to "first" ("last"), remove everything before the first (last) subdirectory that contains
    # files matching $POWERLEVEL9K_SHORTEN_FOLDER_MARKER. For example, when the current directory is
    # /foo/bar/git_repo/nested_git_repo/baz, prompt will display git_repo/nested_git_repo/baz (first)
    # or nested_git_repo/baz (last). This assumes that git_repo and nested_git_repo contain markers
    # and other directories don't.
    #
    # Optionally, "first" and "last" can be followed by ":<offset>" where <offset> is an integer.
    # This moves the truncation point to the right (positive offset) or to the left (negative offset)
    # relative to the marker. Plain "first" and "last" are equivalent to "first:0" and "last:0"
    # respectively.
    typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false
    # Don't shorten this many last directory segments. They are anchors.
    typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
    # Shorten directory if it's longer than this even if there is space for it. The value can
    # be either absolute (e.g., '80') or a percentage of terminal width (e.g, '50%'). If empty,
    # directory will be shortened only when prompt doesn't fit or when other parameters demand it
    # (see POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS and POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT below).
    # If set to `0`, directory will always be shortened to its minimum length.
    typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
    # When `dir` segment is on the last prompt line, try to shorten it enough to leave at least this
    # many columns for typing commands.
    typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40
    # When `dir` segment is on the last prompt line, try to shorten it enough to leave at least
    # COLUMNS * POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT * 0.01 columns for typing commands.
    typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT=50
    # If set to true, embed a hyperlink into the directory. Useful for quickly
    # opening a directory in the file manager simply by clicking the link.
    # Can also be handy when the directory is shortened, as it allows you to see
    # the full directory that was used in previous commands.
    typeset -g POWERLEVEL9K_DIR_HYPERLINK=false

    # Enable special styling for non-writable and non-existent directories. See POWERLEVEL9K_LOCK_ICON
    # and POWERLEVEL9K_DIR_CLASSES below.
    typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v3

    # The default icon shown next to non-writable and non-existent directories when
    # POWERLEVEL9K_DIR_SHOW_WRITABLE is set to v3.
    # typeset -g POWERLEVEL9K_LOCK_ICON='⭐'

    # POWERLEVEL9K_DIR_CLASSES allows you to specify custom icons and colors for different
    # directories. It must be an array with 3 * N elements. Each triplet consists of:
    #
    #   1. A pattern against which the current directory ($PWD) is matched. Matching is done with
    #      extended_glob option enabled.
    #   2. Directory class for the purpose of styling.
    #   3. An empty string.
    #
    # Triplets are tried in order. The first triplet whose pattern matches $PWD wins.
    #
    # If POWERLEVEL9K_DIR_SHOW_WRITABLE is set to v3, non-writable and non-existent directories
    # acquire class suffix _NOT_WRITABLE and NON_EXISTENT respectively.
    #
    # For example, given these settings:
    #
    #   typeset -g POWERLEVEL9K_DIR_CLASSES=(
    #     '~/work(|/*)'  WORK     ''
    #     '~(|/*)'       HOME     ''
    #     '*'            DEFAULT  '')
    #
    # Whenever the current directory is ~/work or a subdirectory of ~/work, it gets styled with one
    # of the following classes depending on its writability and existence: WORK, WORK_NOT_WRITABLE or
    # WORK_NON_EXISTENT.
    #
    # Simply assigning classes to directories doesn't have any visible effects. It merely gives you an
    # option to define custom colors and icons for different directory classes.
    #
    #   # Styling for WORK.
    #   typeset -g POWERLEVEL9K_DIR_WORK_VISUAL_IDENTIFIER_EXPANSION='⭐'
    #   typeset -g POWERLEVEL9K_DIR_WORK_BACKGROUND=4
    #   typeset -g POWERLEVEL9K_DIR_WORK_FOREGROUND=254
    #   typeset -g POWERLEVEL9K_DIR_WORK_SHORTENED_FOREGROUND=250
    #   typeset -g POWERLEVEL9K_DIR_WORK_ANCHOR_FOREGROUND=255
    #
    #   # Styling for WORK_NOT_WRITABLE.
    #   typeset -g POWERLEVEL9K_DIR_WORK_NOT_WRITABLE_VISUAL_IDENTIFIER_EXPANSION='⭐'
    #   typeset -g POWERLEVEL9K_DIR_WORK_NOT_WRITABLE_BACKGROUND=4
    #   typeset -g POWERLEVEL9K_DIR_WORK_NOT_WRITABLE_FOREGROUND=254
    #   typeset -g POWERLEVEL9K_DIR_WORK_NOT_WRITABLE_SHORTENED_FOREGROUND=250
    #   typeset -g POWERLEVEL9K_DIR_WORK_NOT_WRITABLE_ANCHOR_FOREGROUND=255
    #
    #   # Styling for WORK_NON_EXISTENT.
    #   typeset -g POWERLEVEL9K_DIR_WORK_NON_EXISTENT_VISUAL_IDENTIFIER_EXPANSION='⭐'
    #   typeset -g POWERLEVEL9K_DIR_WORK_NON_EXISTENT_BACKGROUND=4
    #   typeset -g POWERLEVEL9K_DIR_WORK_NON_EXISTENT_FOREGROUND=254
    #   typeset -g POWERLEVEL9K_DIR_WORK_NON_EXISTENT_SHORTENED_FOREGROUND=250
    #   typeset -g POWERLEVEL9K_DIR_WORK_NON_EXISTENT_ANCHOR_FOREGROUND=255
    #
    # If a styling parameter isn't explicitly defined for some class, it falls back to the classless
    # parameter. For example, if POWERLEVEL9K_DIR_WORK_NOT_WRITABLE_FOREGROUND is not set, it falls
    # back to POWERLEVEL9K_DIR_FOREGROUND.
    #
    # typeset -g POWERLEVEL9K_DIR_CLASSES=()

    # Custom prefix.
    # typeset -g POWERLEVEL9K_DIR_PREFIX='in '

    #####################################[ vcs: git status ]######################################
    # Version control background colors.
    typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=2
    typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=3
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=2
    typeset -g POWERLEVEL9K_VCS_CONFLICTED_BACKGROUND=3
    typeset -g POWERLEVEL9K_VCS_LOADING_BACKGROUND=8

    # Branch icon. Set this parameter to '\UE0A0 ' for the popular Powerline branch icon.
    typeset -g POWERLEVEL9K_VCS_BRANCH_ICON='\uF126 '

    # Untracked files icon. It's really a question mark, your font isn't broken.
    # Change the value of this parameter to show a different icon.
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

    # Formatter for Git status.
    #
    # Example output: master wip ⇣42⇡42 *42 merge ~42 +42 !42 ?42.
    #
    # You can edit the function to customize how Git status looks.
    #
    # VCS_STATUS_* parameters are set by gitstatus plugin. See reference:
    # https://github.com/romkatv/gitstatus/blob/master/gitstatus.plugin.zsh.
    function my_git_formatter() {
      emulate -L zsh

      if [[ -n $P9K_CONTENT ]]; then
        # If P9K_CONTENT is not empty, use it. It's either "loading" or from vcs_info (not from
        # gitstatus plugin). VCS_STATUS_* parameters are not available in this case.
        typeset -g my_git_format=$P9K_CONTENT
        return
      fi

      # Styling for different parts of Git status.
      local       meta='%7F' # white foreground
      local      clean='%0F' # black foreground
      local   modified='%0F' # black foreground
      local  untracked='%0F' # black foreground
      local conflicted='%1F' # red foreground

      local res

      if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
        local branch=${(V)VCS_STATUS_LOCAL_BRANCH}
        # If local branch name is at most 32 characters long, show it in full.
        # Otherwise show the first 12 … the last 12.
        # Tip: To always show local branch name in full without truncation, delete the next line.
        # (( $#branch > 32 )) && branch[13,-13]="…"  # <-- this line
        res+="${clean}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}${branch//\%/%%}"
      fi

      if [[ -n $VCS_STATUS_TAG
            # Show tag only if not on a branch.
            # Tip: To always show tag, delete the next line.
            && -z $VCS_STATUS_LOCAL_BRANCH  # <-- this line
          ]]; then
        local tag=${(V)VCS_STATUS_TAG}
        # If tag name is at most 32 characters long, show it in full.
        # Otherwise show the first 12 … the last 12.
        # Tip: To always show tag name in full without truncation, delete the next line.
        (( $#tag > 32 )) && tag[13,-13]="…"  # <-- this line
        res+="${meta}#${clean}${tag//\%/%%}"
      fi

      # Display the current Git commit if there is no branch and no tag.
      # Tip: To always display the current Git commit, delete the next line.
      [[ -z $VCS_STATUS_LOCAL_BRANCH && -z $VCS_STATUS_TAG ]] &&  # <-- this line
        res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

      # Show tracking branch name if it differs from local branch.
      if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
        res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"
      fi

      # Display "wip" if the latest commit's summary contains "wip" or "WIP".
      if [[ $VCS_STATUS_COMMIT_SUMMARY == (|*[^[:alnum:]])(wip|WIP)(|[^[:alnum:]]*) ]]; then
        res+=" ${modified}wip"
      fi

      if (( VCS_STATUS_COMMITS_AHEAD || VCS_STATUS_COMMITS_BEHIND )); then
        # ⇣42 if behind the remote.
        (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
        # ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
        (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
        (( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
      elif [[ -n $VCS_STATUS_REMOTE_BRANCH ]]; then
        # Tip: Uncomment the next line to display '=' if up to date with the remote.
        # res+=" ${clean}="
      fi

      # ⇠42 if behind the push remote.
      (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
      (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" "
      # ⇢42 if ahead of the push remote; no leading space if also behind: ⇠42⇢42.
      (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && res+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"
      # *42 if have stashes.
      (( VCS_STATUS_STASHES        )) && res+=" ${clean}*${VCS_STATUS_STASHES}"
      # 'merge' if the repo is in an unusual state.
      [[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
      # ~42 if have merge conflicts.
      (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
      # +42 if have staged changes.
      (( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
      # !42 if have unstaged changes.
      (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
      # ?42 if have untracked files. It's really a question mark, your font isn't broken.
      # See POWERLEVEL9K_VCS_UNTRACKED_ICON above if you want to use a different icon.
      # Remove the next line if you don't want to see untracked files at all.
      (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}${VCS_STATUS_NUM_UNTRACKED}"
      # "─" if the number of unstaged files is unknown. This can happen due to
      # POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY (see below) being set to a non-negative number lower
      # than the number of files in the Git index, or due to bash.showDirtyState being set to false
      # in the repository config. The number of staged and untracked files may also be unknown
      # in this case.
      (( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}─"

      typeset -g my_git_format=$res
    }
    functions -M my_git_formatter 2>/dev/null

    # Don't count the number of unstaged, untracked and conflicted files in Git repositories with
    # more than this many files in the index. Negative value means infinity.
    #
    # If you are working in Git repositories with tens of millions of files and seeing performance
    # sagging, try setting POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY to a number lower than the output
    # of `git ls-files | wc -l`. Alternatively, add `bash.showDirtyState = false` to the repository's
    # config: `git config bash.showDirtyState false`.
    typeset -g POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1

    # Don't show Git status in prompt for repositories whose workdir matches this pattern.
    # For example, if set to '~', the Git repository at $HOME/.git will be ignored.
    # Multiple patterns can be combined with '|': '~(|/foo)|/bar/baz/*'.
    typeset -g POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN='~'

    # Disable the default Git status formatting.
    typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
    # Install our own Git status formatter.
    typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter()))+${my_git_format}}'
    # Enable counters for staged, unstaged, etc.
    typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1

    # Custom icon.
    # typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # Custom prefix.
    # typeset -g POWERLEVEL9K_VCS_PREFIX='on '

    # Show status of repositories of these types. You can add svn and/or hg if you are
    # using them. If you do, your prompt may become slow even when your current directory
    # isn't in an svn or hg repository.
    typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

    ##########################[ status: exit code of the last command ]###########################
    # Enable OK_PIPE, ERROR_PIPE and ERROR_SIGNAL status states to allow us to enable, disable and
    # style them independently from the regular OK and ERROR state.
    typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true

    # Status on success. No content, just an icon. No need to show it if prompt_char is enabled as
    # it will signify success by turning green.
    typeset -g POWERLEVEL9K_STATUS_OK=true
    typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'
    typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=2
    typeset -g POWERLEVEL9K_STATUS_OK_BACKGROUND=0

    # Status when some part of a pipe command fails but the overall exit status is zero. It may look
    # like this: 1|0.
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔'
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=2
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE_BACKGROUND=0

    # Status when it's just an error code (e.g., '1'). No need to show it if prompt_char is enabled as
    # it will signify error by turning red.
    typeset -g POWERLEVEL9K_STATUS_ERROR=true
    typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'
    typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=3
    typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=1

    # Status when the last command was terminated by a signal.
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
    # Use terse signal names: "INT" instead of "SIGINT(2)".
    typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='✘'
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=3
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_BACKGROUND=1

    # Status when some part of a pipe command fails and the overall exit status is also non-zero.
    # It may look like this: 1|0.
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='✘'
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=3
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_BACKGROUND=1

    ###################[ command_execution_time: duration of the last command ]###################
    # Execution time color.
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=0
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=3
    # Show duration of the last command if takes at least this many seconds.
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
    # Show this many fractional digits. Zero means round to seconds.
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
    # Duration format: 1d 2h 3m 4s.
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
    # Custom icon.
    # typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # Custom prefix.
    # typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PREFIX='took '

    #######################[ background_jobs: presence of background jobs ]#######################
    # Background jobs color.
    typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=6
    typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=0
    # Don't show the number of background jobs.
    typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
    # Custom icon.
    # typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #######################[ direnv: direnv status (https://direnv.net/) ]########################
    # Direnv color.
    typeset -g POWERLEVEL9K_DIRENV_FOREGROUND=3
    typeset -g POWERLEVEL9K_DIRENV_BACKGROUND=0
    # Custom icon.
    # typeset -g POWERLEVEL9K_DIRENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ###############[ asdf: asdf version manager (https://github.com/asdf-vm/asdf) ]###############
    # Default asdf color. Only used to display tools for which there is no color override (see below).
    # Tip:  Override these parameters for ${TOOL} with POWERLEVEL9K_ASDF_${TOOL}_FOREGROUND and
    # POWERLEVEL9K_ASDF_${TOOL}_BACKGROUND.
    typeset -g POWERLEVEL9K_ASDF_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_BACKGROUND=7

    # There are four parameters that can be used to hide asdf tools. Each parameter describes
    # conditions under which a tool gets hidden. Parameters can hide tools but not unhide them. If at
    # least one parameter decides to hide a tool, that tool gets hidden. If no parameter decides to
    # hide a tool, it gets shown.
    #
    # Special note on the difference between POWERLEVEL9K_ASDF_SOURCES and
    # POWERLEVEL9K_ASDF_PROMPT_ALWAYS_SHOW. Consider the effect of the following commands:
    #
    #   asdf local  python 3.8.1
    #   asdf global python 3.8.1
    #
    # After running both commands the current python version is 3.8.1 and its source is "local" as
    # it takes precedence over "global". If POWERLEVEL9K_ASDF_PROMPT_ALWAYS_SHOW is set to false,
    # it'll hide python version in this case because 3.8.1 is the same as the global version.
    # POWERLEVEL9K_ASDF_SOURCES will hide python version only if the value of this parameter doesn't
    # contain "local".

    # Hide tool versions that don't come from one of these sources.
    #
    # Available sources:
    #
    # - shell   `asdf current` says "set by ASDF_${TOOL}_VERSION environment variable"
    # - local   `asdf current` says "set by /some/not/home/directory/file"
    # - global  `asdf current` says "set by /home/username/file"
    #
    # Note: If this parameter is set to (shell local global), it won't hide tools.
    # Tip:  Override this parameter for ${TOOL} with POWERLEVEL9K_ASDF_${TOOL}_SOURCES.
    typeset -g POWERLEVEL9K_ASDF_SOURCES=(shell local global)

    # If set to false, hide tool versions that are the same as global.
    #
    # Note: The name of this parameter doesn't reflect its meaning at all.
    # Note: If this parameter is set to true, it won't hide tools.
    # Tip:  Override this parameter for ${TOOL} with POWERLEVEL9K_ASDF_${TOOL}_PROMPT_ALWAYS_SHOW.
    typeset -g POWERLEVEL9K_ASDF_PROMPT_ALWAYS_SHOW=false

    # If set to false, hide tool versions that are equal to "system".
    #
    # Note: If this parameter is set to true, it won't hide tools.
    # Tip: Override this parameter for ${TOOL} with POWERLEVEL9K_ASDF_${TOOL}_SHOW_SYSTEM.
    typeset -g POWERLEVEL9K_ASDF_SHOW_SYSTEM=true

    # If set to non-empty value, hide tools unless there is a file matching the specified file pattern
    # in the current directory, or its parent directory, or its grandparent directory, and so on.
    #
    # Note: If this parameter is set to empty value, it won't hide tools.
    # Note: SHOW_ON_UPGLOB isn't specific to asdf. It works with all prompt segments.
    # Tip: Override this parameter for ${TOOL} with POWERLEVEL9K_ASDF_${TOOL}_SHOW_ON_UPGLOB.
    #
    # Example: Hide nodejs version when there is no package.json and no *.js files in the current
    # directory, in `..`, in `../..` and so on.
    #
    #   typeset -g POWERLEVEL9K_ASDF_NODEJS_SHOW_ON_UPGLOB='*.js|package.json'
    typeset -g POWERLEVEL9K_ASDF_SHOW_ON_UPGLOB=

    # Ruby version from asdf.
    typeset -g POWERLEVEL9K_ASDF_RUBY_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_RUBY_BACKGROUND=1
    # typeset -g POWERLEVEL9K_ASDF_RUBY_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_RUBY_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Python version from asdf.
    typeset -g POWERLEVEL9K_ASDF_PYTHON_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_PYTHON_BACKGROUND=4
    # typeset -g POWERLEVEL9K_ASDF_PYTHON_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_PYTHON_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Go version from asdf.
    typeset -g POWERLEVEL9K_ASDF_GOLANG_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_GOLANG_BACKGROUND=4
    # typeset -g POWERLEVEL9K_ASDF_GOLANG_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_GOLANG_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Node.js version from asdf.
    typeset -g POWERLEVEL9K_ASDF_NODEJS_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_NODEJS_BACKGROUND=2
    # typeset -g POWERLEVEL9K_ASDF_NODEJS_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_NODEJS_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Rust version from asdf.
    typeset -g POWERLEVEL9K_ASDF_RUST_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_RUST_BACKGROUND=208
    # typeset -g POWERLEVEL9K_ASDF_RUST_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_RUST_SHOW_ON_UPGLOB='*.foo|*.bar'

    # .NET Core version from asdf.
    typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_BACKGROUND=5
    # typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Flutter version from asdf.
    typeset -g POWERLEVEL9K_ASDF_FLUTTER_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_FLUTTER_BACKGROUND=4
    # typeset -g POWERLEVEL9K_ASDF_FLUTTER_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_FLUTTER_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Lua version from asdf.
    typeset -g POWERLEVEL9K_ASDF_LUA_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_LUA_BACKGROUND=4
    # typeset -g POWERLEVEL9K_ASDF_LUA_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_LUA_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Java version from asdf.
    typeset -g POWERLEVEL9K_ASDF_JAVA_FOREGROUND=1
    typeset -g POWERLEVEL9K_ASDF_JAVA_BACKGROUND=7
    # typeset -g POWERLEVEL9K_ASDF_JAVA_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_JAVA_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Perl version from asdf.
    typeset -g POWERLEVEL9K_ASDF_PERL_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_PERL_BACKGROUND=4
    # typeset -g POWERLEVEL9K_ASDF_PERL_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_PERL_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Erlang version from asdf.
    typeset -g POWERLEVEL9K_ASDF_ERLANG_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_ERLANG_BACKGROUND=1
    # typeset -g POWERLEVEL9K_ASDF_ERLANG_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_ERLANG_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Elixir version from asdf.
    typeset -g POWERLEVEL9K_ASDF_ELIXIR_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_ELIXIR_BACKGROUND=5
    # typeset -g POWERLEVEL9K_ASDF_ELIXIR_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_ELIXIR_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Postgres version from asdf.
    typeset -g POWERLEVEL9K_ASDF_POSTGRES_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_POSTGRES_BACKGROUND=6
    # typeset -g POWERLEVEL9K_ASDF_POSTGRES_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_POSTGRES_SHOW_ON_UPGLOB='*.foo|*.bar'

    # PHP version from asdf.
    typeset -g POWERLEVEL9K_ASDF_PHP_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_PHP_BACKGROUND=5
    # typeset -g POWERLEVEL9K_ASDF_PHP_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_PHP_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Haskell version from asdf.
    typeset -g POWERLEVEL9K_ASDF_HASKELL_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_HASKELL_BACKGROUND=3
    # typeset -g POWERLEVEL9K_ASDF_HASKELL_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_HASKELL_SHOW_ON_UPGLOB='*.foo|*.bar'

    # Julia version from asdf.
    typeset -g POWERLEVEL9K_ASDF_JULIA_FOREGROUND=0
    typeset -g POWERLEVEL9K_ASDF_JULIA_BACKGROUND=2
    # typeset -g POWERLEVEL9K_ASDF_JULIA_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_ASDF_JULIA_SHOW_ON_UPGLOB='*.foo|*.bar'

    ##########[ nordvpn: nordvpn connection status, linux only (https://nordvpn.com/) ]###########
    # NordVPN connection indicator color.
    typeset -g POWERLEVEL9K_NORDVPN_FOREGROUND=7
    typeset -g POWERLEVEL9K_NORDVPN_BACKGROUND=4
    # Hide NordVPN connection indicator when not connected.
    typeset -g POWERLEVEL9K_NORDVPN_{DISCONNECTED,CONNECTING,DISCONNECTING}_CONTENT_EXPANSION=
    typeset -g POWERLEVEL9K_NORDVPN_{DISCONNECTED,CONNECTING,DISCONNECTING}_VISUAL_IDENTIFIER_EXPANSION=
    # Custom icon.
    # typeset -g POWERLEVEL9K_NORDVPN_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #################[ ranger: ranger shell (https://github.com/ranger/ranger) ]##################
    # Ranger shell color.
    typeset -g POWERLEVEL9K_RANGER_FOREGROUND=3
    typeset -g POWERLEVEL9K_RANGER_BACKGROUND=0
    # Custom icon.
    # typeset -g POWERLEVEL9K_RANGER_VISUAL_IDENTIFIER_EXPANSION='⭐'
    
    ####################[ yazi: yazi shell (https://github.com/sxyazi/yazi) ]#####################
    # Yazi shell color.
    typeset -g POWERLEVEL9K_YAZI_FOREGROUND=3
    typeset -g POWERLEVEL9K_YAZI_BACKGROUND=0
    # Custom icon.
    # typeset -g POWERLEVEL9K_YAZI_VISUAL_IDENTIFIER_EXPANSION='⭐'
    
    ######################[ nnn: nnn shell (https://github.com/jarun/nnn) ]#######################
    # Nnn shell color.
    typeset -g POWERLEVEL9K_NNN_FOREGROUND=0
    typeset -g POWERLEVEL9K_NNN_BACKGROUND=6
    # Custom icon.
    # typeset -g POWERLEVEL9K_NNN_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ######################[ lf: lf shell (https://github.com/gokcehan/lf) ]#######################
    # lf shell color.
    typeset -g POWERLEVEL9K_LF_FOREGROUND=0
    typeset -g POWERLEVEL9K_LF_BACKGROUND=6
    # Custom icon.
    # typeset -g POWERLEVEL9K_LF_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##################[ xplr: xplr shell (https://github.com/sayanarijit/xplr) ]##################
    # xplr shell color.
    typeset -g POWERLEVEL9K_XPLR_FOREGROUND=0
    typeset -g POWERLEVEL9K_XPLR_BACKGROUND=6
    # Custom icon.
    # typeset -g POWERLEVEL9K_XPLR_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ###########################[ vim_shell: vim shell indicator (:sh) ]###########################
    # Vim shell indicator color.
    typeset -g POWERLEVEL9K_VIM_SHELL_FOREGROUND=0
    typeset -g POWERLEVEL9K_VIM_SHELL_BACKGROUND=2
    # Custom icon.
    # typeset -g POWERLEVEL9K_VIM_SHELL_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ######[ midnight_commander: midnight commander shell (https://midnight-commander.org/) ]######
    # Midnight Commander shell color.
    typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_FOREGROUND=3
    typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_BACKGROUND=0
    # Custom icon.
    # typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #[ nix_shell: nix shell (https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html) ]##
    # Nix shell color.
    typeset -g POWERLEVEL9K_NIX_SHELL_FOREGROUND=0
    typeset -g POWERLEVEL9K_NIX_SHELL_BACKGROUND=4

    # Display the icon of nix_shell if PATH contains a subdirectory of /nix/store.
    # typeset -g POWERLEVEL9K_NIX_SHELL_INFER_FROM_PATH=false

    # Tip: If you want to see just the icon without "pure" and "impure", uncomment the next line.
    # typeset -g POWERLEVEL9K_NIX_SHELL_CONTENT_EXPANSION=

    # Custom icon.
    # typeset -g POWERLEVEL9K_NIX_SHELL_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##################[ chezmoi_shell: chezmoi shell (https://www.chezmoi.io/) ]##################
    # chezmoi shell color.
    typeset -g POWERLEVEL9K_CHEZMOI_SHELL_FOREGROUND=0
    typeset -g POWERLEVEL9K_CHEZMOI_SHELL_BACKGROUND=4
    # Custom icon.
    # typeset -g POWERLEVEL9K_CHEZMOI_SHELL_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##################################[ disk_usage: disk usage ]##################################
    # Colors for different levels of disk usage.
    typeset -g POWERLEVEL9K_DISK_USAGE_NORMAL_FOREGROUND=3
    typeset -g POWERLEVEL9K_DISK_USAGE_NORMAL_BACKGROUND=0
    typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_FOREGROUND=0
    typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_BACKGROUND=3
    typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_FOREGROUND=7
    typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_BACKGROUND=1
    # Thresholds for different levels of disk usage (percentage points).
    typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_LEVEL=90
    typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_LEVEL=95
    # If set to true, hide disk usage when below $POWERLEVEL9K_DISK_USAGE_WARNING_LEVEL percent.
    typeset -g POWERLEVEL9K_DISK_USAGE_ONLY_WARNING=false
    # Custom icon.
    # typeset -g POWERLEVEL9K_DISK_USAGE_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ###########[ vi_mode: vi mode (you don't need this if you've enabled prompt_char) ]###########
    # Foreground color.
    typeset -g POWERLEVEL9K_VI_MODE_FOREGROUND=0
    # Text and color for normal (a.k.a. command) vi mode.
    typeset -g POWERLEVEL9K_VI_COMMAND_MODE_STRING=NORMAL
    typeset -g POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND=2
    # Text and color for visual vi mode.
    typeset -g POWERLEVEL9K_VI_VISUAL_MODE_STRING=VISUAL
    typeset -g POWERLEVEL9K_VI_MODE_VISUAL_BACKGROUND=4
    # Text and color for overtype (a.k.a. overwrite and replace) vi mode.
    typeset -g POWERLEVEL9K_VI_OVERWRITE_MODE_STRING=OVERTYPE
    typeset -g POWERLEVEL9K_VI_MODE_OVERWRITE_BACKGROUND=3
    # Text and color for insert vi mode.
    typeset -g POWERLEVEL9K_VI_INSERT_MODE_STRING=
    typeset -g POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND=8
    # Custom icon.
    # typeset -g POWERLEVEL9K_VI_MODE_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ######################################[ ram: free RAM ]#######################################
    # RAM color.
    typeset -g POWERLEVEL9K_RAM_FOREGROUND=0
    typeset -g POWERLEVEL9K_RAM_BACKGROUND=3
    # Custom icon.
    # typeset -g POWERLEVEL9K_RAM_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #####################################[ swap: used swap ]######################################
    # Swap color.
    typeset -g POWERLEVEL9K_SWAP_FOREGROUND=0
    typeset -g POWERLEVEL9K_SWAP_BACKGROUND=3
    # Custom icon.
    # typeset -g POWERLEVEL9K_SWAP_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ######################################[ load: CPU load ]######################################
    # Show average CPU load over this many last minutes. Valid values are 1, 5 and 15.
    typeset -g POWERLEVEL9K_LOAD_WHICH=5
    # Load color when load is under 50%.
    typeset -g POWERLEVEL9K_LOAD_NORMAL_FOREGROUND=0
    typeset -g POWERLEVEL9K_LOAD_NORMAL_BACKGROUND=2
    # Load color when load is between 50% and 70%.
    typeset -g POWERLEVEL9K_LOAD_WARNING_FOREGROUND=0
    typeset -g POWERLEVEL9K_LOAD_WARNING_BACKGROUND=3
    # Load color when load is over 70%.
    typeset -g POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND=0
    typeset -g POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND=1
    # Custom icon.
    # typeset -g POWERLEVEL9K_LOAD_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ################[ todo: todo items (https://github.com/todotxt/todo.txt-cli) ]################
    # Todo color.
    typeset -g POWERLEVEL9K_TODO_FOREGROUND=0
    typeset -g POWERLEVEL9K_TODO_BACKGROUND=8
    # Hide todo when the total number of tasks is zero.
    typeset -g POWERLEVEL9K_TODO_HIDE_ZERO_TOTAL=true
    # Hide todo when the number of tasks after filtering is zero.
    typeset -g POWERLEVEL9K_TODO_HIDE_ZERO_FILTERED=false

    # Todo format. The following parameters are available within the expansion.
    #
    # - P9K_TODO_TOTAL_TASK_COUNT     The total number of tasks.
    # - P9K_TODO_FILTERED_TASK_COUNT  The number of tasks after filtering.
    #
    # These variables correspond to the last line of the output of `todo.sh -p ls`:
    #
    #   TODO: 24 of 42 tasks shown
    #
    # Here 24 is P9K_TODO_FILTERED_TASK_COUNT and 42 is P9K_TODO_TOTAL_TASK_COUNT.
    #
    # typeset -g POWERLEVEL9K_TODO_CONTENT_EXPANSION='$P9K_TODO_FILTERED_TASK_COUNT'

    # Custom icon.
    # typeset -g POWERLEVEL9K_TODO_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ###########[ timewarrior: timewarrior tracking status (https://timewarrior.net/) ]############
    # Timewarrior color.
    typeset -g POWERLEVEL9K_TIMEWARRIOR_FOREGROUND=255
    typeset -g POWERLEVEL9K_TIMEWARRIOR_BACKGROUND=8

    # If the tracked task is longer than 24 characters, truncate and append "…".
    # Tip: To always display tasks without truncation, delete the following parameter.
    # Tip: To hide task names and display just the icon when time tracking is enabled, set the
    # value of the following parameter to "".
    typeset -g POWERLEVEL9K_TIMEWARRIOR_CONTENT_EXPANSION='${P9K_CONTENT:0:24}${${P9K_CONTENT:24}:+…}'

    # Custom icon.
    # typeset -g POWERLEVEL9K_TIMEWARRIOR_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##############[ taskwarrior: taskwarrior task count (https://taskwarrior.org/) ]##############
    # Taskwarrior color.
    typeset -g POWERLEVEL9K_TASKWARRIOR_FOREGROUND=0
    typeset -g POWERLEVEL9K_TASKWARRIOR_BACKGROUND=6

    # Taskwarrior segment format. The following parameters are available within the expansion.
    #
    # - P9K_TASKWARRIOR_PENDING_COUNT   The number of pending tasks: `task +PENDING count`.
    # - P9K_TASKWARRIOR_OVERDUE_COUNT   The number of overdue tasks: `task +OVERDUE count`.
    #
    # Zero values are represented as empty parameters.
    #
    # The default format:
    #
    #   '${P9K_TASKWARRIOR_OVERDUE_COUNT:+"!$P9K_TASKWARRIOR_OVERDUE_COUNT/"}$P9K_TASKWARRIOR_PENDING_COUNT'
    #
    # typeset -g POWERLEVEL9K_TASKWARRIOR_CONTENT_EXPANSION='$P9K_TASKWARRIOR_PENDING_COUNT'

    # Custom icon.
    # typeset -g POWERLEVEL9K_TASKWARRIOR_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ######[ per_directory_history: Oh My Zsh per-directory-history local/global indicator ]#######
    # Color when using local/global history.
    typeset -g POWERLEVEL9K_PER_DIRECTORY_HISTORY_LOCAL_FOREGROUND=0
    typeset -g POWERLEVEL9K_PER_DIRECTORY_HISTORY_LOCAL_BACKGROUND=5
    typeset -g POWERLEVEL9K_PER_DIRECTORY_HISTORY_GLOBAL_FOREGROUND=0
    typeset -g POWERLEVEL9K_PER_DIRECTORY_HISTORY_GLOBAL_BACKGROUND=3

    # Tip: Uncomment the next two lines to hide "local"/"global" text and leave just the icon.
    # typeset -g POWERLEVEL9K_PER_DIRECTORY_HISTORY_LOCAL_CONTENT_EXPANSION=''
    # typeset -g POWERLEVEL9K_PER_DIRECTORY_HISTORY_GLOBAL_CONTENT_EXPANSION=''

    # Custom icon.
    # typeset -g POWERLEVEL9K_PER_DIRECTORY_HISTORY_LOCAL_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # typeset -g POWERLEVEL9K_PER_DIRECTORY_HISTORY_GLOBAL_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ################################[ cpu_arch: CPU architecture ]################################
    # CPU architecture color.
    typeset -g POWERLEVEL9K_CPU_ARCH_FOREGROUND=0
    typeset -g POWERLEVEL9K_CPU_ARCH_BACKGROUND=3

    # Hide the segment when on a specific CPU architecture.
    # typeset -g POWERLEVEL9K_CPU_ARCH_X86_64_CONTENT_EXPANSION=
    # typeset -g POWERLEVEL9K_CPU_ARCH_X86_64_VISUAL_IDENTIFIER_EXPANSION=

    # Custom icon.
    # typeset -g POWERLEVEL9K_CPU_ARCH_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##################################[ context: user@hostname ]##################################
    # Context color when running with privileges.
    typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=1
    typeset -g POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND=0
    # Context color in SSH without privileges.
    typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND=3
    typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_BACKGROUND=0
    # Default context color (no privileges, no SSH).
    typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=3
    typeset -g POWERLEVEL9K_CONTEXT_BACKGROUND=0

    # Context format when running with privileges: user@hostname.
    typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%n@%m'
    # Context format when in SSH without privileges: user@hostname.
    typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_TEMPLATE='%n@%m'
    # Default context format (no privileges, no SSH): user@hostname.
    typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

    # Don't show context unless running with privileges or in SSH.
    # Tip: Remove the next line to always show context.
    typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=

    # Custom icon.
    # typeset -g POWERLEVEL9K_CONTEXT_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # Custom prefix.
    # typeset -g POWERLEVEL9K_CONTEXT_PREFIX='with '

    ###[ virtualenv: python virtual environment (https://docs.python.org/3/library/venv.html) ]###
    # Python virtual environment color.
    typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=0
    typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND=4
    # Don't show Python version next to the virtual environment name.
    typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
    # If set to "false", won't show virtualenv if pyenv is already shown.
    # If set to "if-different", won't show virtualenv if it's the same as pyenv.
    typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=false
    # Separate environment name from Python version only with a space.
    typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=
    # Custom icon.
    # typeset -g POWERLEVEL9K_VIRTUALENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #####################[ anaconda: conda environment (https://conda.io/) ]######################
    # Anaconda environment color.
    typeset -g POWERLEVEL9K_ANACONDA_FOREGROUND=0
    typeset -g POWERLEVEL9K_ANACONDA_BACKGROUND=4

    # Anaconda segment format. The following parameters are available within the expansion.
    #
    # - CONDA_PREFIX                 Absolute path to the active Anaconda/Miniconda environment.
    # - CONDA_DEFAULT_ENV            Name of the active Anaconda/Miniconda environment.
    # - CONDA_PROMPT_MODIFIER        Configurable prompt modifier (see below).
    # - P9K_ANACONDA_PYTHON_VERSION  Current python version (python --version).
    #
    # CONDA_PROMPT_MODIFIER can be configured with the following command:
    #
    #   conda config --set env_prompt '({default_env}) '
    #
    # The last argument is a Python format string that can use the following variables:
    #
    # - prefix       The same as CONDA_PREFIX.
    # - default_env  The same as CONDA_DEFAULT_ENV.
    # - name         The last segment of CONDA_PREFIX.
    # - stacked_env  Comma-separated list of names in the environment stack. The first element is
    #                always the same as default_env.
    #
    # Note: '({default_env}) ' is the default value of env_prompt.
    #
    # The default value of POWERLEVEL9K_ANACONDA_CONTENT_EXPANSION expands to $CONDA_PROMPT_MODIFIER
    # without the surrounding parentheses, or to the last path component of CONDA_PREFIX if the former
    # is empty.
    typeset -g POWERLEVEL9K_ANACONDA_CONTENT_EXPANSION='${${${${CONDA_PROMPT_MODIFIER#\(}% }%\)}:-${CONDA_PREFIX:t}}'

    # Custom icon.
    # typeset -g POWERLEVEL9K_ANACONDA_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ################[ pyenv: python environment (https://github.com/pyenv/pyenv) ]################
    # Pyenv color.
    typeset -g POWERLEVEL9K_PYENV_FOREGROUND=0
    typeset -g POWERLEVEL9K_PYENV_BACKGROUND=4
    # Hide python version if it doesn't come from one of these sources.
    typeset -g POWERLEVEL9K_PYENV_SOURCES=(shell local global)
    # If set to false, hide python version if it's the same as global:
    # $(pyenv version-name) == $(pyenv global).
    typeset -g POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=false
    # If set to false, hide python version if it's equal to "system".
    typeset -g POWERLEVEL9K_PYENV_SHOW_SYSTEM=true

    # Pyenv segment format. The following parameters are available within the expansion.
    #
    # - P9K_CONTENT                Current pyenv environment (pyenv version-name).
    # - P9K_PYENV_PYTHON_VERSION   Current python version (python --version).
    #
    # The default format has the following logic:
    #
    # 1. Display just "$P9K_CONTENT" if it's equal to "$P9K_PYENV_PYTHON_VERSION" or
    #    starts with "$P9K_PYENV_PYTHON_VERSION/".
    # 2. Otherwise display "$P9K_CONTENT $P9K_PYENV_PYTHON_VERSION".
    typeset -g POWERLEVEL9K_PYENV_CONTENT_EXPANSION='${P9K_CONTENT}${${P9K_CONTENT:#$P9K_PYENV_PYTHON_VERSION(|/*)}:+ $P9K_PYENV_PYTHON_VERSION}'

    # Custom icon.
    # typeset -g POWERLEVEL9K_PYENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ################[ goenv: go environment (https://github.com/syndbg/goenv) ]################
    # Goenv color.
    typeset -g POWERLEVEL9K_GOENV_FOREGROUND=0
    typeset -g POWERLEVEL9K_GOENV_BACKGROUND=4
    # Hide go version if it doesn't come from one of these sources.
    typeset -g POWERLEVEL9K_GOENV_SOURCES=(shell local global)
    # If set to false, hide go version if it's the same as global:
    # $(goenv version-name) == $(goenv global).
    typeset -g POWERLEVEL9K_GOENV_PROMPT_ALWAYS_SHOW=false
    # If set to false, hide go version if it's equal to "system".
    typeset -g POWERLEVEL9K_GOENV_SHOW_SYSTEM=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_GOENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##########[ nodenv: node.js version from nodenv (https://github.com/nodenv/nodenv) ]##########
    # Nodenv color.
    typeset -g POWERLEVEL9K_NODENV_FOREGROUND=2
    typeset -g POWERLEVEL9K_NODENV_BACKGROUND=0
    # Hide node version if it doesn't come from one of these sources.
    typeset -g POWERLEVEL9K_NODENV_SOURCES=(shell local global)
    # If set to false, hide node version if it's the same as global:
    # $(nodenv version-name) == $(nodenv global).
    typeset -g POWERLEVEL9K_NODENV_PROMPT_ALWAYS_SHOW=false
    # If set to false, hide node version if it's equal to "system".
    typeset -g POWERLEVEL9K_NODENV_SHOW_SYSTEM=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_NODENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##############[ nvm: node.js version from nvm (https://github.com/nvm-sh/nvm) ]###############
    # Nvm color.
    typeset -g POWERLEVEL9K_NVM_FOREGROUND=0
    typeset -g POWERLEVEL9K_NVM_BACKGROUND=5
    # If set to false, hide node version if it's the same as default:
    # $(nvm version current) == $(nvm version default).
    typeset -g POWERLEVEL9K_NVM_PROMPT_ALWAYS_SHOW=false
    # If set to false, hide node version if it's equal to "system".
    typeset -g POWERLEVEL9K_NVM_SHOW_SYSTEM=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_NVM_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ############[ nodeenv: node.js environment (https://github.com/ekalinin/nodeenv) ]############
    # Nodeenv color.
    typeset -g POWERLEVEL9K_NODEENV_FOREGROUND=2
    typeset -g POWERLEVEL9K_NODEENV_BACKGROUND=0
    # Don't show Node version next to the environment name.
    typeset -g POWERLEVEL9K_NODEENV_SHOW_NODE_VERSION=false
    # Separate environment name from Node version only with a space.
    typeset -g POWERLEVEL9K_NODEENV_{LEFT,RIGHT}_DELIMITER=
    # Custom icon.
    # typeset -g POWERLEVEL9K_NODEENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##############################[ node_version: node.js version ]###############################
    # Node version color.
    typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND=7
    typeset -g POWERLEVEL9K_NODE_VERSION_BACKGROUND=2
    # Show node version only when in a directory tree containing package.json.
    typeset -g POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_NODE_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #######################[ go_version: go version (https://golang.org) ]########################
    # Go version color.
    typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND=255
    typeset -g POWERLEVEL9K_GO_VERSION_BACKGROUND=2
    # Show go version only when in a go project subdirectory.
    typeset -g POWERLEVEL9K_GO_VERSION_PROJECT_ONLY=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_GO_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #################[ rust_version: rustc version (https://www.rust-lang.org) ]##################
    # Rust version color.
    typeset -g POWERLEVEL9K_RUST_VERSION_FOREGROUND=0
    typeset -g POWERLEVEL9K_RUST_VERSION_BACKGROUND=208
    # Show rust version only when in a rust project subdirectory.
    typeset -g POWERLEVEL9K_RUST_VERSION_PROJECT_ONLY=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_RUST_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ###############[ dotnet_version: .NET version (https://dotnet.microsoft.com) ]################
    # .NET version color.
    typeset -g POWERLEVEL9K_DOTNET_VERSION_FOREGROUND=7
    typeset -g POWERLEVEL9K_DOTNET_VERSION_BACKGROUND=5
    # Show .NET version only when in a .NET project subdirectory.
    typeset -g POWERLEVEL9K_DOTNET_VERSION_PROJECT_ONLY=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_DOTNET_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #####################[ php_version: php version (https://www.php.net/) ]######################
    # PHP version color.
    typeset -g POWERLEVEL9K_PHP_VERSION_FOREGROUND=0
    typeset -g POWERLEVEL9K_PHP_VERSION_BACKGROUND=5
    # Show PHP version only when in a PHP project subdirectory.
    typeset -g POWERLEVEL9K_PHP_VERSION_PROJECT_ONLY=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_PHP_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##########[ laravel_version: laravel php framework version (https://laravel.com/) ]###########
    # Laravel version color.
    typeset -g POWERLEVEL9K_LARAVEL_VERSION_FOREGROUND=1
    typeset -g POWERLEVEL9K_LARAVEL_VERSION_BACKGROUND=7
    # Custom icon.
    # typeset -g POWERLEVEL9K_LARAVEL_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #############[ rbenv: ruby version from rbenv (https://github.com/rbenv/rbenv) ]##############
    # Rbenv color.
    typeset -g POWERLEVEL9K_RBENV_FOREGROUND=0
    typeset -g POWERLEVEL9K_RBENV_BACKGROUND=1
    # Hide ruby version if it doesn't come from one of these sources.
    typeset -g POWERLEVEL9K_RBENV_SOURCES=(shell local global)
    # If set to false, hide ruby version if it's the same as global:
    # $(rbenv version-name) == $(rbenv global).
    typeset -g POWERLEVEL9K_RBENV_PROMPT_ALWAYS_SHOW=false
    # If set to false, hide ruby version if it's equal to "system".
    typeset -g POWERLEVEL9K_RBENV_SHOW_SYSTEM=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_RBENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ####################[ java_version: java version (https://www.java.com/) ]####################
    # Java version color.
    typeset -g POWERLEVEL9K_JAVA_VERSION_FOREGROUND=1
    typeset -g POWERLEVEL9K_JAVA_VERSION_BACKGROUND=7
    # Show java version only when in a java project subdirectory.
    typeset -g POWERLEVEL9K_JAVA_VERSION_PROJECT_ONLY=true
    # Show brief version.
    typeset -g POWERLEVEL9K_JAVA_VERSION_FULL=false
    # Custom icon.
    # typeset -g POWERLEVEL9K_JAVA_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ###[ package: name@version from package.json (https://docs.npmjs.com/files/package.json) ]####
    # Package color.
    typeset -g POWERLEVEL9K_PACKAGE_FOREGROUND=0
    typeset -g POWERLEVEL9K_PACKAGE_BACKGROUND=6

    # Package format. The following parameters are available within the expansion.
    #
    # - P9K_PACKAGE_NAME     The value of `name` field in package.json.
    # - P9K_PACKAGE_VERSION  The value of `version` field in package.json.
    #
    # typeset -g POWERLEVEL9K_PACKAGE_CONTENT_EXPANSION='${P9K_PACKAGE_NAME//\%/%%}@${P9K_PACKAGE_VERSION//\%/%%}'

    # Custom icon.
    # typeset -g POWERLEVEL9K_PACKAGE_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #######################[ rvm: ruby version from rvm (https://rvm.io) ]########################
    # Rvm color.
    typeset -g POWERLEVEL9K_RVM_FOREGROUND=0
    typeset -g POWERLEVEL9K_RVM_BACKGROUND=240
    # Don't show @gemset at the end.
    typeset -g POWERLEVEL9K_RVM_SHOW_GEMSET=false
    # Don't show ruby- at the front.
    typeset -g POWERLEVEL9K_RVM_SHOW_PREFIX=false
    # Custom icon.
    # typeset -g POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ###########[ fvm: flutter version management (https://github.com/leoafarias/fvm) ]############
    # Fvm color.
    typeset -g POWERLEVEL9K_FVM_FOREGROUND=0
    typeset -g POWERLEVEL9K_FVM_BACKGROUND=4
    # Custom icon.
    # typeset -g POWERLEVEL9K_FVM_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##########[ luaenv: lua version from luaenv (https://github.com/cehoffman/luaenv) ]###########
    # Lua color.
    typeset -g POWERLEVEL9K_LUAENV_FOREGROUND=0
    typeset -g POWERLEVEL9K_LUAENV_BACKGROUND=4
    # Hide lua version if it doesn't come from one of these sources.
    typeset -g POWERLEVEL9K_LUAENV_SOURCES=(shell local global)
    # If set to false, hide lua version if it's the same as global:
    # $(luaenv version-name) == $(luaenv global).
    typeset -g POWERLEVEL9K_LUAENV_PROMPT_ALWAYS_SHOW=false
    # If set to false, hide lua version if it's equal to "system".
    typeset -g POWERLEVEL9K_LUAENV_SHOW_SYSTEM=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_LUAENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ###############[ jenv: java version from jenv (https://github.com/jenv/jenv) ]################
    # Java color.
    typeset -g POWERLEVEL9K_JENV_FOREGROUND=1
    typeset -g POWERLEVEL9K_JENV_BACKGROUND=7
    # Hide java version if it doesn't come from one of these sources.
    typeset -g POWERLEVEL9K_JENV_SOURCES=(shell local global)
    # If set to false, hide java version if it's the same as global:
    # $(jenv version-name) == $(jenv global).
    typeset -g POWERLEVEL9K_JENV_PROMPT_ALWAYS_SHOW=false
    # If set to false, hide java version if it's equal to "system".
    typeset -g POWERLEVEL9K_JENV_SHOW_SYSTEM=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_JENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ###########[ plenv: perl version from plenv (https://github.com/tokuhirom/plenv) ]############
    # Perl color.
    typeset -g POWERLEVEL9K_PLENV_FOREGROUND=0
    typeset -g POWERLEVEL9K_PLENV_BACKGROUND=4
    # Hide perl version if it doesn't come from one of these sources.
    typeset -g POWERLEVEL9K_PLENV_SOURCES=(shell local global)
    # If set to false, hide perl version if it's the same as global:
    # $(plenv version-name) == $(plenv global).
    typeset -g POWERLEVEL9K_PLENV_PROMPT_ALWAYS_SHOW=false
    # If set to false, hide perl version if it's equal to "system".
    typeset -g POWERLEVEL9K_PLENV_SHOW_SYSTEM=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_PLENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ###########[ perlbrew: perl version from perlbrew (https://github.com/gugod/App-perlbrew) ]############
    # Perlbrew color.
    typeset -g POWERLEVEL9K_PERLBREW_FOREGROUND=67
    # Show perlbrew version only when in a perl project subdirectory.
    typeset -g POWERLEVEL9K_PERLBREW_PROJECT_ONLY=true
    # Don't show "perl-" at the front.
    typeset -g POWERLEVEL9K_PERLBREW_SHOW_PREFIX=false
    # Custom icon.
    # typeset -g POWERLEVEL9K_PERLBREW_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ############[ phpenv: php version from phpenv (https://github.com/phpenv/phpenv) ]############
    # PHP color.
    typeset -g POWERLEVEL9K_PHPENV_FOREGROUND=0
    typeset -g POWERLEVEL9K_PHPENV_BACKGROUND=5
    # Hide php version if it doesn't come from one of these sources.
    typeset -g POWERLEVEL9K_PHPENV_SOURCES=(shell local global)
    # If set to false, hide php version if it's the same as global:
    # $(phpenv version-name) == $(phpenv global).
    typeset -g POWERLEVEL9K_PHPENV_PROMPT_ALWAYS_SHOW=false
    # If set to false, hide PHP version if it's equal to "system".
    typeset -g POWERLEVEL9K_PHPENV_SHOW_SYSTEM=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_PHPENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #######[ scalaenv: scala version from scalaenv (https://github.com/scalaenv/scalaenv) ]#######
    # Scala color.
    typeset -g POWERLEVEL9K_SCALAENV_FOREGROUND=0
    typeset -g POWERLEVEL9K_SCALAENV_BACKGROUND=1
    # Hide scala version if it doesn't come from one of these sources.
    typeset -g POWERLEVEL9K_SCALAENV_SOURCES=(shell local global)
    # If set to false, hide scala version if it's the same as global:
    # $(scalaenv version-name) == $(scalaenv global).
    typeset -g POWERLEVEL9K_SCALAENV_PROMPT_ALWAYS_SHOW=false
    # If set to false, hide scala version if it's equal to "system".
    typeset -g POWERLEVEL9K_SCALAENV_SHOW_SYSTEM=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_SCALAENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##########[ haskell_stack: haskell version from stack (https://haskellstack.org/) ]###########
    # Haskell color.
    typeset -g POWERLEVEL9K_HASKELL_STACK_FOREGROUND=0
    typeset -g POWERLEVEL9K_HASKELL_STACK_BACKGROUND=3

    # Hide haskell version if it doesn't come from one of these sources.
    #
    #   shell:  version is set by STACK_YAML
    #   local:  version is set by stack.yaml up the directory tree
    #   global: version is set by the implicit global project (~/.stack/global-project/stack.yaml)
    typeset -g POWERLEVEL9K_HASKELL_STACK_SOURCES=(shell local)
    # If set to false, hide haskell version if it's the same as in the implicit global project.
    typeset -g POWERLEVEL9K_HASKELL_STACK_ALWAYS_SHOW=true
    # Custom icon.
    # typeset -g POWERLEVEL9K_HASKELL_STACK_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ################[ terraform: terraform workspace (https://www.terraform.io) ]#################
    # Don't show terraform workspace if it's literally "default".
    typeset -g POWERLEVEL9K_TERRAFORM_SHOW_DEFAULT=false
    # POWERLEVEL9K_TERRAFORM_CLASSES is an array with even number of elements. The first element
    # in each pair defines a pattern against which the current terraform workspace gets matched.
    # More specifically, it's P9K_CONTENT prior to the application of context expansion (see below)
    # that gets matched. If you unset all POWERLEVEL9K_TERRAFORM_*CONTENT_EXPANSION parameters,
    # you'll see this value in your prompt. The second element of each pair in
    # POWERLEVEL9K_TERRAFORM_CLASSES defines the workspace class. Patterns are tried in order. The
    # first match wins.
    #
    # For example, given these settings:
    #
    #   typeset -g POWERLEVEL9K_TERRAFORM_CLASSES=(
    #     '*prod*'  PROD
    #     '*test*'  TEST
    #     '*'       OTHER)
    #
    # If your current terraform workspace is "project_test", its class is TEST because "project_test"
    # doesn't match the pattern '*prod*' but does match '*test*'.
    #
    # You can define different colors, icons and content expansions for different classes:
    #
    #   typeset -g POWERLEVEL9K_TERRAFORM_TEST_FOREGROUND=2
    #   typeset -g POWERLEVEL9K_TERRAFORM_TEST_BACKGROUND=0
    #   typeset -g POWERLEVEL9K_TERRAFORM_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
    #   typeset -g POWERLEVEL9K_TERRAFORM_TEST_CONTENT_EXPANSION='> ${P9K_CONTENT} <'
    typeset -g POWERLEVEL9K_TERRAFORM_CLASSES=(
        # '*prod*'  PROD    # These values are examples that are unlikely
        # '*test*'  TEST    # to match your needs. Customize them as needed.
        '*'         OTHER)
    typeset -g POWERLEVEL9K_TERRAFORM_OTHER_FOREGROUND=4
    typeset -g POWERLEVEL9K_TERRAFORM_OTHER_BACKGROUND=0
    # typeset -g POWERLEVEL9K_TERRAFORM_OTHER_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #############[ terraform_version: terraform version (https://www.terraform.io) ]##############
    # Terraform version color.
    typeset -g POWERLEVEL9K_TERRAFORM_VERSION_FOREGROUND=4
    typeset -g POWERLEVEL9K_TERRAFORM_VERSION_BACKGROUND=0
    # Custom icon.
    # typeset -g POWERLEVEL9K_TERRAFORM_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ################[ terraform_version: It shows active terraform version (https://www.terraform.io) ]#################
    typeset -g POWERLEVEL9K_TERRAFORM_VERSION_SHOW_ON_COMMAND='terraform|tf'

    #############[ kubecontext: current kubernetes context (https://kubernetes.io/) ]#############
    # Show kubecontext only when the command you are typing invokes one of these tools.
    # Tip: Remove the next line to always show kubecontext.
    typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens|kubectx|oc|istioctl|kogito|k9s|helmfile|flux|fluxctl|stern|kubeseal|skaffold|kubent|kubecolor|cmctl|sparkctl'

    # Kubernetes context classes for the purpose of using different colors, icons and expansions with
    # different contexts.
    #
    # POWERLEVEL9K_KUBECONTEXT_CLASSES is an array with even number of elements. The first element
    # in each pair defines a pattern against which the current kubernetes context gets matched.
    # More specifically, it's P9K_CONTENT prior to the application of context expansion (see below)
    # that gets matched. If you unset all POWERLEVEL9K_KUBECONTEXT_*CONTENT_EXPANSION parameters,
    # you'll see this value in your prompt. The second element of each pair in
    # POWERLEVEL9K_KUBECONTEXT_CLASSES defines the context class. Patterns are tried in order. The
    # first match wins.
    #
    # For example, given these settings:
    #
    #   typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=(
    #     '*prod*'  PROD
    #     '*test*'  TEST
    #     '*'       DEFAULT)
    #
    # If your current kubernetes context is "deathray-testing/default", its class is TEST
    # because "deathray-testing/default" doesn't match the pattern '*prod*' but does match '*test*'.
    #
    # You can define different colors, icons and content expansions for different classes:
    #
    #   typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_FOREGROUND=0
    #   typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_BACKGROUND=2
    #   typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
    #   typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_CONTENT_EXPANSION='> ${P9K_CONTENT} <'
    typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=(
        # '*prod*'  PROD    # These values are examples that are unlikely
        # '*test*'  TEST    # to match your needs. Customize them as needed.
        '*'       DEFAULT)
    typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND=7
    typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_BACKGROUND=5
    # typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_VISUAL_IDENTIFIER_EXPANSION='⭐'

    # Use POWERLEVEL9K_KUBECONTEXT_CONTENT_EXPANSION to specify the content displayed by kubecontext
    # segment. Parameter expansions are very flexible and fast, too. See reference:
    # http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion.
    #
    # Within the expansion the following parameters are always available:
    #
    # - P9K_CONTENT                The content that would've been displayed if there was no content
    #                              expansion defined.
    # - P9K_KUBECONTEXT_NAME       The current context's name. Corresponds to column NAME in the
    #                              output of `kubectl config get-contexts`.
    # - P9K_KUBECONTEXT_CLUSTER    The current context's cluster. Corresponds to column CLUSTER in the
    #                              output of `kubectl config get-contexts`.
    # - P9K_KUBECONTEXT_NAMESPACE  The current context's namespace. Corresponds to column NAMESPACE
    #                              in the output of `kubectl config get-contexts`. If there is no
    #                              namespace, the parameter is set to "default".
    # - P9K_KUBECONTEXT_USER       The current context's user. Corresponds to column AUTHINFO in the
    #                              output of `kubectl config get-contexts`.
    #
    # If the context points to Google Kubernetes Engine (GKE) or Elastic Kubernetes Service (EKS),
    # the following extra parameters are available:
    #
    # - P9K_KUBECONTEXT_CLOUD_NAME     Either "gke" or "eks".
    # - P9K_KUBECONTEXT_CLOUD_ACCOUNT  Account/project ID.
    # - P9K_KUBECONTEXT_CLOUD_ZONE     Availability zone.
    # - P9K_KUBECONTEXT_CLOUD_CLUSTER  Cluster.
    #
    # P9K_KUBECONTEXT_CLOUD_* parameters are derived from P9K_KUBECONTEXT_CLUSTER. For example,
    # if P9K_KUBECONTEXT_CLUSTER is "gke_my-account_us-east1-a_my-cluster-01":
    #
    #   - P9K_KUBECONTEXT_CLOUD_NAME=gke
    #   - P9K_KUBECONTEXT_CLOUD_ACCOUNT=my-account
    #   - P9K_KUBECONTEXT_CLOUD_ZONE=us-east1-a
    #   - P9K_KUBECONTEXT_CLOUD_CLUSTER=my-cluster-01
    #
    # If P9K_KUBECONTEXT_CLUSTER is "arn:aws:eks:us-east-1:123456789012:cluster/my-cluster-01":
    #
    #   - P9K_KUBECONTEXT_CLOUD_NAME=eks
    #   - P9K_KUBECONTEXT_CLOUD_ACCOUNT=123456789012
    #   - P9K_KUBECONTEXT_CLOUD_ZONE=us-east-1
    #   - P9K_KUBECONTEXT_CLOUD_CLUSTER=my-cluster-01
    typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION=
    # Show P9K_KUBECONTEXT_CLOUD_CLUSTER if it's not empty and fall back to P9K_KUBECONTEXT_NAME.
    POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${P9K_KUBECONTEXT_CLOUD_CLUSTER:-${P9K_KUBECONTEXT_NAME}}'
    # Append the current context's namespace if it's not "default".
    POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${${:-/$P9K_KUBECONTEXT_NAMESPACE}:#/default}'

    # Custom prefix.
    # typeset -g POWERLEVEL9K_KUBECONTEXT_PREFIX='at '

    #[ aws: aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html) ]#
    # Show aws only when the command you are typing invokes one of these tools.
    # Tip: Remove the next line to always show aws.
    typeset -g POWERLEVEL9K_AWS_SHOW_ON_COMMAND='aws|awless|cdk|terraform|pulumi|terragrunt'

    # POWERLEVEL9K_AWS_CLASSES is an array with even number of elements. The first element
    # in each pair defines a pattern against which the current AWS profile gets matched.
    # More specifically, it's P9K_CONTENT prior to the application of context expansion (see below)
    # that gets matched. If you unset all POWERLEVEL9K_AWS_*CONTENT_EXPANSION parameters,
    # you'll see this value in your prompt. The second element of each pair in
    # POWERLEVEL9K_AWS_CLASSES defines the profile class. Patterns are tried in order. The
    # first match wins.
    #
    # For example, given these settings:
    #
    #   typeset -g POWERLEVEL9K_AWS_CLASSES=(
    #     '*prod*'  PROD
    #     '*test*'  TEST
    #     '*'       DEFAULT)
    #
    # If your current AWS profile is "company_test", its class is TEST
    # because "company_test" doesn't match the pattern '*prod*' but does match '*test*'.
    #
    # You can define different colors, icons and content expansions for different classes:
    #
    #   typeset -g POWERLEVEL9K_AWS_TEST_FOREGROUND=28
    #   typeset -g POWERLEVEL9K_AWS_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
    #   typeset -g POWERLEVEL9K_AWS_TEST_CONTENT_EXPANSION='> ${P9K_CONTENT} <'
    typeset -g POWERLEVEL9K_AWS_CLASSES=(
        # '*prod*'  PROD    # These values are examples that are unlikely
        # '*test*'  TEST    # to match your needs. Customize them as needed.
        '*'       DEFAULT)
    typeset -g POWERLEVEL9K_AWS_DEFAULT_FOREGROUND=7
    typeset -g POWERLEVEL9K_AWS_DEFAULT_BACKGROUND=1
    # typeset -g POWERLEVEL9K_AWS_DEFAULT_VISUAL_IDENTIFIER_EXPANSION='⭐'

    # AWS segment format. The following parameters are available within the expansion.
    #
    # - P9K_AWS_PROFILE  The name of the current AWS profile.
    # - P9K_AWS_REGION   The region associated with the current AWS profile.
    typeset -g POWERLEVEL9K_AWS_CONTENT_EXPANSION='${P9K_AWS_PROFILE//\%/%%}${P9K_AWS_REGION:+ ${P9K_AWS_REGION//\%/%%}}'

    #[ aws_eb_env: aws elastic beanstalk environment (https://aws.amazon.com/elasticbeanstalk/) ]#
    # AWS Elastic Beanstalk environment color.
    typeset -g POWERLEVEL9K_AWS_EB_ENV_FOREGROUND=2
    typeset -g POWERLEVEL9K_AWS_EB_ENV_BACKGROUND=0
    # Custom icon.
    # typeset -g POWERLEVEL9K_AWS_EB_ENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##########[ azure: azure account name (https://docs.microsoft.com/en-us/cli/azure) ]##########
    # Show azure only when the command you are typing invokes one of these tools.
    # Tip: Remove the next line to always show azure.
    typeset -g POWERLEVEL9K_AZURE_SHOW_ON_COMMAND='az|terraform|pulumi|terragrunt'

    # POWERLEVEL9K_AZURE_CLASSES is an array with even number of elements. The first element
    # in each pair defines a pattern against which the current azure account name gets matched.
    # More specifically, it's P9K_CONTENT prior to the application of context expansion (see below)
    # that gets matched. If you unset all POWERLEVEL9K_AZURE_*CONTENT_EXPANSION parameters,
    # you'll see this value in your prompt. The second element of each pair in
    # POWERLEVEL9K_AZURE_CLASSES defines the account class. Patterns are tried in order. The
    # first match wins.
    #
    # For example, given these settings:
    #
    #   typeset -g POWERLEVEL9K_AZURE_CLASSES=(
    #     '*prod*'  PROD
    #     '*test*'  TEST
    #     '*'       OTHER)
    #
    # If your current azure account is "company_test", its class is TEST because "company_test"
    # doesn't match the pattern '*prod*' but does match '*test*'.
    #
    # You can define different colors, icons and content expansions for different classes:
    #
    #   typeset -g POWERLEVEL9K_AZURE_TEST_FOREGROUND=2
    #   typeset -g POWERLEVEL9K_AZURE_TEST_BACKGROUND=0
    #   typeset -g POWERLEVEL9K_AZURE_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
    #   typeset -g POWERLEVEL9K_AZURE_TEST_CONTENT_EXPANSION='> ${P9K_CONTENT} <'
    typeset -g POWERLEVEL9K_AZURE_CLASSES=(
        # '*prod*'  PROD    # These values are examples that are unlikely
        # '*test*'  TEST    # to match your needs. Customize them as needed.
        '*'         OTHER)

    # Azure account name color.
    typeset -g POWERLEVEL9K_AZURE_OTHER_FOREGROUND=7
    typeset -g POWERLEVEL9K_AZURE_OTHER_BACKGROUND=4
    # Custom icon.
    # typeset -g POWERLEVEL9K_AZURE_OTHER_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ##########[ gcloud: google cloud account and project (https://cloud.google.com/) ]###########
    # Show gcloud only when the command you are typing invokes one of these tools.
    # Tip: Remove the next line to always show gcloud.
    typeset -g POWERLEVEL9K_GCLOUD_SHOW_ON_COMMAND='gcloud|gcs|gsutil'
    # Google cloud color.
    typeset -g POWERLEVEL9K_GCLOUD_FOREGROUND=7
    typeset -g POWERLEVEL9K_GCLOUD_BACKGROUND=4

    # Google cloud format. Change the value of POWERLEVEL9K_GCLOUD_PARTIAL_CONTENT_EXPANSION and/or
    # POWERLEVEL9K_GCLOUD_COMPLETE_CONTENT_EXPANSION if the default is too verbose or not informative
    # enough. You can use the following parameters in the expansions. Each of them corresponds to the
    # output of `gcloud` tool.
    #
    #   Parameter                | Source
    #   -------------------------|--------------------------------------------------------------------
    #   P9K_GCLOUD_CONFIGURATION | gcloud config configurations list --format='value(name)'
    #   P9K_GCLOUD_ACCOUNT       | gcloud config get-value account
    #   P9K_GCLOUD_PROJECT_ID    | gcloud config get-value project
    #   P9K_GCLOUD_PROJECT_NAME  | gcloud projects describe $P9K_GCLOUD_PROJECT_ID --format='value(name)'
    #
    # Note: ${VARIABLE//\%/%%} expands to ${VARIABLE} with all occurrences of '%' replaced with '%%'.
    #
    # Obtaining project name requires sending a request to Google servers. This can take a long time
    # and even fail. When project name is unknown, P9K_GCLOUD_PROJECT_NAME is not set and gcloud
    # prompt segment is in state PARTIAL. When project name gets known, P9K_GCLOUD_PROJECT_NAME gets
    # set and gcloud prompt segment transitions to state COMPLETE.
    #
    # You can customize the format, icon and colors of gcloud segment separately for states PARTIAL
    # and COMPLETE. You can also hide gcloud in state PARTIAL by setting
    # POWERLEVEL9K_GCLOUD_PARTIAL_VISUAL_IDENTIFIER_EXPANSION and
    # POWERLEVEL9K_GCLOUD_PARTIAL_CONTENT_EXPANSION to empty.
    typeset -g POWERLEVEL9K_GCLOUD_PARTIAL_CONTENT_EXPANSION='${P9K_GCLOUD_PROJECT_ID//\%/%%}'
    typeset -g POWERLEVEL9K_GCLOUD_COMPLETE_CONTENT_EXPANSION='${P9K_GCLOUD_PROJECT_NAME//\%/%%}'

    # Send a request to Google (by means of `gcloud projects describe ...`) to obtain project name
    # this often. Negative value disables periodic polling. In this mode project name is retrieved
    # only when the current configuration, account or project id changes.
    typeset -g POWERLEVEL9K_GCLOUD_REFRESH_PROJECT_NAME_SECONDS=60

    # Custom icon.
    # typeset -g POWERLEVEL9K_GCLOUD_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #[ google_app_cred: google application credentials (https://cloud.google.com/docs/authentication/production) ]#
    # Show google_app_cred only when the command you are typing invokes one of these tools.
    # Tip: Remove the next line to always show google_app_cred.
    typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_SHOW_ON_COMMAND='terraform|pulumi|terragrunt'

    # Google application credentials classes for the purpose of using different colors, icons and
    # expansions with different credentials.
    #
    # POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES is an array with even number of elements. The first
    # element in each pair defines a pattern against which the current kubernetes context gets
    # matched. More specifically, it's P9K_CONTENT prior to the application of context expansion
    # (see below) that gets matched. If you unset all POWERLEVEL9K_GOOGLE_APP_CRED_*CONTENT_EXPANSION
    # parameters, you'll see this value in your prompt. The second element of each pair in
    # POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES defines the context class. Patterns are tried in order.
    # The first match wins.
    #
    # For example, given these settings:
    #
    #   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES=(
    #     '*:*prod*:*'  PROD
    #     '*:*test*:*'  TEST
    #     '*'           DEFAULT)
    #
    # If your current Google application credentials is "service_account deathray-testing x@y.com",
    # its class is TEST because it doesn't match the pattern '* *prod* *' but does match '* *test* *'.
    #
    # You can define different colors, icons and content expansions for different classes:
    #
    #   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_TEST_FOREGROUND=28
    #   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
    #   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_TEST_CONTENT_EXPANSION='$P9K_GOOGLE_APP_CRED_PROJECT_ID'
    typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES=(
        # '*:*prod*:*'  PROD    # These values are examples that are unlikely
        # '*:*test*:*'  TEST    # to match your needs. Customize them as needed.
        '*'             DEFAULT)
    typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_FOREGROUND=7
    typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_BACKGROUND=4
    # typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_VISUAL_IDENTIFIER_EXPANSION='⭐'

    # Use POWERLEVEL9K_GOOGLE_APP_CRED_CONTENT_EXPANSION to specify the content displayed by
    # google_app_cred segment. Parameter expansions are very flexible and fast, too. See reference:
    # http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion.
    #
    # You can use the following parameters in the expansion. Each of them corresponds to one of the
    # fields in the JSON file pointed to by GOOGLE_APPLICATION_CREDENTIALS.
    #
    #   Parameter                        | JSON key file field
    #   ---------------------------------+---------------
    #   P9K_GOOGLE_APP_CRED_TYPE         | type
    #   P9K_GOOGLE_APP_CRED_PROJECT_ID   | project_id
    #   P9K_GOOGLE_APP_CRED_CLIENT_EMAIL | client_email
    #
    # Note: ${VARIABLE//\%/%%} expands to ${VARIABLE} with all occurrences of '%' replaced by '%%'.
    typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_CONTENT_EXPANSION='${P9K_GOOGLE_APP_CRED_PROJECT_ID//\%/%%}'

    ##############[ toolbox: toolbox name (https://github.com/containers/toolbox) ]###############
    # Toolbox color.
    typeset -g POWERLEVEL9K_TOOLBOX_FOREGROUND=0
    typeset -g POWERLEVEL9K_TOOLBOX_BACKGROUND=3
    # Don't display the name of the toolbox if it matches fedora-toolbox-*.
    typeset -g POWERLEVEL9K_TOOLBOX_CONTENT_EXPANSION='${P9K_TOOLBOX_NAME:#fedora-toolbox-*}'
    # Custom icon.
    # typeset -g POWERLEVEL9K_TOOLBOX_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # Custom prefix.
    # typeset -g POWERLEVEL9K_TOOLBOX_PREFIX='in '

    ###############################[ public_ip: public IP address ]###############################
    # Public IP color.
    typeset -g POWERLEVEL9K_PUBLIC_IP_FOREGROUND=7
    typeset -g POWERLEVEL9K_PUBLIC_IP_BACKGROUND=0
    # Custom icon.
    # typeset -g POWERLEVEL9K_PUBLIC_IP_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ########################[ vpn_ip: virtual private network indicator ]#########################
    # VPN IP color.
    typeset -g POWERLEVEL9K_VPN_IP_FOREGROUND=0
    typeset -g POWERLEVEL9K_VPN_IP_BACKGROUND=6
    # When on VPN, show just an icon without the IP address.
    # Tip: To display the private IP address when on VPN, remove the next line.
    typeset -g POWERLEVEL9K_VPN_IP_CONTENT_EXPANSION=
    # Regular expression for the VPN network interface. Run `ifconfig` or `ip -4 a show` while on VPN
    # to see the name of the interface.
    typeset -g POWERLEVEL9K_VPN_IP_INTERFACE='(gpd|wg|(.*tun)|tailscale)[0-9]*|(zt.*)'
    # If set to true, show one segment per matching network interface. If set to false, show only
    # one segment corresponding to the first matching network interface.
    # Tip: If you set it to true, you'll probably want to unset POWERLEVEL9K_VPN_IP_CONTENT_EXPANSION.
    typeset -g POWERLEVEL9K_VPN_IP_SHOW_ALL=false
    # Custom icon.
    # typeset -g POWERLEVEL9K_VPN_IP_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ###########[ ip: ip address and bandwidth usage for a specified network interface ]###########
    # IP color.
    typeset -g POWERLEVEL9K_IP_BACKGROUND=4
    typeset -g POWERLEVEL9K_IP_FOREGROUND=0
    # The following parameters are accessible within the expansion:
    #
    #   Parameter             | Meaning
    #   ----------------------+-------------------------------------------
    #   P9K_IP_IP             | IP address
    #   P9K_IP_INTERFACE      | network interface
    #   P9K_IP_RX_BYTES       | total number of bytes received
    #   P9K_IP_TX_BYTES       | total number of bytes sent
    #   P9K_IP_RX_BYTES_DELTA | number of bytes received since last prompt
    #   P9K_IP_TX_BYTES_DELTA | number of bytes sent since last prompt
    #   P9K_IP_RX_RATE        | receive rate (since last prompt)
    #   P9K_IP_TX_RATE        | send rate (since last prompt)
    typeset -g POWERLEVEL9K_IP_CONTENT_EXPANSION='${P9K_IP_RX_RATE:+⇣$P9K_IP_RX_RATE }${P9K_IP_TX_RATE:+⇡$P9K_IP_TX_RATE }$P9K_IP_IP'
    # Show information for the first network interface whose name matches this regular expression.
    # Run `ifconfig` or `ip -4 a show` to see the names of all network interfaces.
    typeset -g POWERLEVEL9K_IP_INTERFACE='[ew].*'
    # Custom icon.
    # typeset -g POWERLEVEL9K_IP_VISUAL_IDENTIFIER_EXPANSION='⭐'

    #########################[ proxy: system-wide http/https/ftp proxy ]##########################
    # Proxy color.
    typeset -g POWERLEVEL9K_PROXY_FOREGROUND=4
    typeset -g POWERLEVEL9K_PROXY_BACKGROUND=0
    # Custom icon.
    # typeset -g POWERLEVEL9K_PROXY_VISUAL_IDENTIFIER_EXPANSION='⭐'

    ################################[ battery: internal battery ]#################################
    # Show battery in red when it's below this level and not connected to power supply.
    typeset -g POWERLEVEL9K_BATTERY_LOW_THRESHOLD=20
    typeset -g POWERLEVEL9K_BATTERY_LOW_FOREGROUND=1
    # Show battery in green when it's charging or fully charged.
    typeset -g POWERLEVEL9K_BATTERY_{CHARGING,CHARGED}_FOREGROUND=2
    # Show battery in yellow when it's discharging.
    typeset -g POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=3
    # Battery pictograms going from low to high level of charge.
    typeset -g POWERLEVEL9K_BATTERY_STAGES='\uf58d\uf579\uf57a\uf57b\uf57c\uf57d\uf57e\uf57f\uf580\uf581\uf578'
    # Don't show the remaining time to charge/discharge.
    typeset -g POWERLEVEL9K_BATTERY_VERBOSE=false
    typeset -g POWERLEVEL9K_BATTERY_BACKGROUND=0

    #####################################[ wifi: wifi speed ]#####################################
    # WiFi color.
    typeset -g POWERLEVEL9K_WIFI_FOREGROUND=0
    typeset -g POWERLEVEL9K_WIFI_BACKGROUND=4
    # Custom icon.
    # typeset -g POWERLEVEL9K_WIFI_VISUAL_IDENTIFIER_EXPANSION='⭐'

    # Use different colors and icons depending on signal strength ($P9K_WIFI_BARS).
    #
    #   # Wifi colors and icons for different signal strength levels (low to high).
    #   typeset -g my_wifi_fg=(0 0 0 0 0)                                # <-- change these values
    #   typeset -g my_wifi_icon=('WiFi' 'WiFi' 'WiFi' 'WiFi' 'WiFi')     # <-- change these values
    #
    #   typeset -g POWERLEVEL9K_WIFI_CONTENT_EXPANSION='%F{${my_wifi_fg[P9K_WIFI_BARS+1]}}$P9K_WIFI_LAST_TX_RATE Mbps'
    #   typeset -g POWERLEVEL9K_WIFI_VISUAL_IDENTIFIER_EXPANSION='%F{${my_wifi_fg[P9K_WIFI_BARS+1]}}${my_wifi_icon[P9K_WIFI_BARS+1]}'
    #
    # The following parameters are accessible within the expansions:
    #
    #   Parameter             | Meaning
    #   ----------------------+---------------
    #   P9K_WIFI_SSID         | service set identifier, a.k.a. network name
    #   P9K_WIFI_LINK_AUTH    | authentication protocol such as "wpa2-psk" or "none"; empty if unknown
    #   P9K_WIFI_LAST_TX_RATE | wireless transmit rate in megabits per second
    #   P9K_WIFI_RSSI         | signal strength in dBm, from -120 to 0
    #   P9K_WIFI_NOISE        | noise in dBm, from -120 to 0
    #   P9K_WIFI_BARS         | signal strength in bars, from 0 to 4 (derived from P9K_WIFI_RSSI and P9K_WIFI_NOISE)

    ####################################[ time: current time ]####################################
    # Current time color.
    typeset -g POWERLEVEL9K_TIME_FOREGROUND=0
    typeset -g POWERLEVEL9K_TIME_BACKGROUND=7
    # Format for the current time: 09:51:02. See `man 3 strftime`.
    typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
    # If set to true, time will update when you hit enter. This way prompts for the past
    # commands will contain the start times of their commands as opposed to the default
    # behavior where they contain the end times of their preceding commands.
    typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false
    # Custom icon.
    # typeset -g POWERLEVEL9K_TIME_VISUAL_IDENTIFIER_EXPANSION='⭐'
    # Custom prefix.
    # typeset -g POWERLEVEL9K_TIME_PREFIX='at '

    # Example of a user-defined prompt segment. Function prompt_example will be called on every
    # prompt if `example` prompt segment is added to POWERLEVEL9K_LEFT_PROMPT_ELEMENTS or
    # POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS. It displays an icon and yellow text on red background
    # greeting the user.
    #
    # Type `p10k help segment` for documentation and a more sophisticated example.
    function prompt_example() {
      p10k segment -b 1 -f 3 -i '⭐' -t 'hello, %n'
    }

    # User-defined prompt segments may optionally provide an instant_prompt_* function. Its job
    # is to generate the prompt segment for display in instant prompt. See
    # https://github.com/romkatv/powerlevel10k#instant-prompt.
    #
    # Powerlevel10k will call instant_prompt_* at the same time as the regular prompt_* function
    # and will record all `p10k segment` calls it makes. When displaying instant prompt, Powerlevel10k
    # will replay these calls without actually calling instant_prompt_*. It is imperative that
    # instant_prompt_* always makes the same `p10k segment` calls regardless of environment. If this
    # rule is not observed, the content of instant prompt will be incorrect.
    #
    # Usually, you should either not define instant_prompt_* or simply call prompt_* from it. If
    # instant_prompt_* is not defined for a segment, the segment won't be shown in instant prompt.
    function instant_prompt_example() {
      # Since prompt_example always makes the same `p10k segment` calls, we can call it from
      # instant_prompt_example. This will give us the same `example` prompt segment in the instant
      # and regular prompts.
      prompt_example
    }

    # User-defined prompt segments can be customized the same way as built-in segments.
    typeset -g POWERLEVEL9K_EXAMPLE_FOREGROUND=3
    typeset -g POWERLEVEL9K_EXAMPLE_BACKGROUND=1
    # typeset -g POWERLEVEL9K_EXAMPLE_VISUAL_IDENTIFIER_EXPANSION='⭐'

    # Transient prompt works similarly to the builtin transient_rprompt option. It trims down prompt
    # when accepting a command line. Supported values:
    #
    #   - off:      Don't change prompt when accepting a command line.
    #   - always:   Trim down prompt when accepting a command line.
    #   - same-dir: Trim down prompt when accepting a command line unless this is the first command
    #               typed after changing current working directory.
    typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always

    # Instant prompt mode.
    #
    #   - off:     Disable instant prompt. Choose this if you've tried instant prompt and found
    #              it incompatible with your zsh configuration files.
    #   - quiet:   Enable instant prompt and don't print warnings when detecting console output
    #              during zsh initialization. Choose this if you've read and understood
    #              https://github.com/romkatv/powerlevel10k#instant-prompt.
    #   - verbose: Enable instant prompt and print a warning when detecting console output during
    #              zsh initialization. Choose this if you've never tried instant prompt, haven't
    #              seen the warning, or if you are unsure what this all means.
    typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

    # Hot reload allows you to change POWERLEVEL9K options after Powerlevel10k has been initialized.
    # For example, you can type POWERLEVEL9K_BACKGROUND=red and see your prompt turn red. Hot reload
    # can slow down prompt by 1-2 milliseconds, so it's better to keep it turned off unless you
    # really need it.
    typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

    # If p10k is already loaded, reload configuration.
    # This works even with POWERLEVEL9K_DISABLE_HOT_RELOAD=true.
    (( ! $+functions[p10k] )) || p10k reload
  }

  # Tell `p10k configure` which file it should overwrite.
  typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

  (( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
  'builtin' 'unset' 'p10k_config_opts'

}

shell-runtime-zap-plugins() {
    # for plugin in fzf fzf-tab mvn; do
    #     azSourceSystemPlugin "$plugin/include.zsh"
    # done

    # #! Zap plugins
    # #? https://github.com/zsh-users/zsh-autosuggestions
    # #? https://github.com/zsh-users/zsh-completions
    for plugin in \
        zsh-users/zsh-autosuggestions \
        zsh-users/zsh-completions \
        zsh-users/zsh-syntax-highlighting \
        wintermi/zsh-lsd \
        zap-zsh/supercharge; do
        plug "$plugin"
    done
    # zap-zsh/zap-prompt

    # plug "zap-zsh/zap-prompt"
    # for plugin in brew p10k lsd nvm mvn fzf; do
    #     # az include-plugin "$plugin"
    #     azSourceSystemPlugin "$plugin/include.zsh"
    # done
}

s-runtime() {
    
}

s-build() {
    _buildShell() {
        echo-error "TODO _buildShell is legacy"
        # rm -rf $SHELL_LIBS_DIST_DIR
        # mkdir -p $SHELL_LIBS_DIST_DIR
        # s-run files build $SHELL_STARTUP_FILES_DIR $SHELL_STARTUP_FILE
    }
    local command=$1
    case $command in
        shell)
            _buildShell ${@:2}
            ;;
        files)
            s-run files build ${@:2}
            ;;
        *)
            _buildShell $@
            ;;
    esac
}

s-clear-cache() {
    echo-info "Clear cache at ${COLOR_ARGUMENT}$SHELL_CACHE_DIR${STYLE_RESET}"
    rm -rf "$SHELL_CACHE_DIR"
}
s-clear-dist() {
    echo-info "Clear dist at ${COLOR_ARGUMENT}$SHELL_DIST${STYLE_RESET}"
    rm -rf "$SHELL_DIST"
}
s-clear() {
    case $1 in
        cache)
            s-run clear-cache
            ;;
        dist)
            s-run clear-dist
            ;;
        *)
            s-run clear-cache
            s-run clear-dist
            ;;
    esac
}

shell-compile() {
    s-run clear dist
    s-run user set PRINT_TIME_NEXT_RUN true
    # s-run build
    s-run reload
}

shell-config-file() {
    _configFileGet() {
        local configFile=$1
        local variableName=$2
        if [ ! -f $configFile ]; then
            echo ""
            return
        fi
        local userValue=$(cat $configFile | grep $variableName | cut -d'=' -f2)
        echo "$userValue"
    }
    _configFileSet() {
        local configFile=$1
        local variableName=$2
        local variableValue=$3

        mkdir -p "$SHELL_SHARED_DIR"
        touch "$configFile"
        # Check if the variable already exists in the file
        if grep -q "^$variableName=" "$configFile"; then
            if s-is linux; then
                sed -i "s/^$variableName=.*/$variableName=$variableValue/" "$configFile"
            elif s-is darwin; then
                sed -i '' "s/^$variableName=.*/$variableName=$variableValue/" "$configFile"
            fi
        else
            # Add the new variable
            echo "$variableName=$variableValue" >>"$configFile"
        fi
    }

    case $1 in
        get)
            _configFileGet ${@:2}
            ;;
        set)
            _configFileSet ${@:2}
            ;;
        *)
            echo-error "Invalid '${COLOR_YELLOW}shell-config-file${STYLE_RESET}' command '${COLOR_YELLOW}$1${STYLE_RESET}'."
            ;;
    esac
}

s-debug() {
    _debuggerSet() {
        s-user set SHELL_IS_DEBUG $1
        SHELL_IS_DEBUG=$1
    }
    _debuggerEnv() {
        s-not compiled && debug info "Shell compiling..."
        s-is compiled && debug success "Shell compiled!"
        s-not started && debug info "Shell starting..."
        s-is started && debug success "Shell started!"
        return $CODE_OK
    }
    case $1 in
        env)
            _debuggerEnv
            ;;
        enable)
            _debuggerSet true
            ;;
        disable)
            _debuggerSet false
            ;;
        *)
            echo-error "!!! Unknown debugger command: $1"
            ;;
    esac
}

shell-download() {
    local _downloadFrom=$1
    local _downloadTo=$2
    if [ -z "$_downloadFrom" ]; then
        echo-error "Please provide a download link"
        return 1
    fi
    if [ -z "$_downloadTo" ]; then
        echo-error "Please provide a download destination"
        return 1
    fi
    if [ -f "$_downloadTo" ]; then
        echo-warning "$_downloadTo already exists. Overwrite? (y/n)"
        read _overwrite
        if [ "$_overwrite" != "y" ]; then
            return $CODE_ERROR
        fi
    fi
    echo-info "Downloading $_downloadFrom to $_downloadTo"
    curl -fsSL $_downloadFrom -o $_downloadTo
    if [ $? -eq 0 ]; then
        echo-success "Downloaded $_downloadFrom to $_downloadTo"
    else
        echo-error "Failed to download $_downloadFrom to $_downloadTo"
    fi
    # sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    # sudo chmod a+r /etc/apt/keyrings/docker.asc
}

shell-env-load() {
    local runtimeConfigsFile="$SHELL_CONFIGS_DIR/overrides.zsh"
    if [[ -f $runtimeConfigsFile ]]; then
        source $runtimeConfigsFile
    else
        compiling warning "No runtime configs found at $runtimeConfigsFile"
    fi

    SHELL_IS_COMPILED=false
    local currentFile="$(dirname ${(%):-%x})"
    #? if currentFile include 'dist' in path, then it's compiled
    if [[ $currentFile == *dist* ]]; then
        SHELL_IS_COMPILED=true
    fi
}

shell-env-reset() {
    DEBUG_TIMER=1            #? shows message "[timers]: X"
    DEBUG_INSTALL=1          #? shows message "[install]: X"
    DEBUG_FUNCTION=1         #? shows message "[<function>]: X"

    SHELL_IS_DEBUG=false
    SHELL_FORCE_VERBOSE=false #? forces verbose mode
    # SHELL_INSTALL_OPTIONAL=false #? installs optional packages
    # SHELL_INSTALL_REQUIRED=true #? installs required packages
    SHELL_IS_COMPILED=false
    SHELL_SKIP_INSTALL=false #? prevents all install cases

    SHELL_IS_BACK_PROCESSING=0
    SHELL_IS_STARTED=false
    SHELL_UNAME="$(uname -s)"
}

shell-env() {
    case $1 in
        reset)
            shell-env-reset
            ;;
        load)
            shell-env-load
            ;;
        init)
            shell-env-reset
            shell-env-load
            ;;
        *)
            echo-error "Unknown shell env command: $1"
            ;;
    esac
}


shell-hard-exit() {
    s-run clear cache
    exit 0
}

shell-soft-exit() {
    s-run clear cache
    exit 0
}

shell-files() {
    _load() {
        local files_dir="$1"
        for file in $(find "$files_dir" -type f | sort); do
            source "$file"
        done
    }
    _build() {
        local files_dir="$1"
        local output_file="$2"

        local file_list=()
        #for file in $(ls "$files_dir" | sort); do
        for file in $(find "$files_dir" -type f | sort); do
            file_list+=("$file")
        done

        mkdir -p "$(dirname "$output_file")"
        awk 'FNR==1 && NR!=1 {print ""} {print}' "${file_list[@]}" > "$output_file"
    }
    _build-include() {
        local files_dir="$1"
        local output_file="$2"
        if [ -f "$output_file" ]; then
            source "$output_file"
            return $CODE_OK
        fi
        _build "$files_dir" "$output_file"
        source "$output_file"
        return $CODE_OK
    }
    case $1 in
        load)
            _load ${@:2}
            ;;
        build)
            _build ${@:2}
            ;;
        build-include)
            _build-include ${@:2}
            ;;
        *)
            echo-error "Command $command not found"
            ;;
    esac
}

shell-guard() {
    set() {
        local name="$1"
        debug info "Guard set '${COLOR_ARGUMENT}$name${STYLE_RESET}'"
        SHELL_GUARD="SHELL_GUARD_${name//-/_}_ZSH"
        eval "$SHELL_GUARD=1"
    }
    unset() {
        local name="$1"
        debug info "Guard unset '${COLOR_ARGUMENT}$name${STYLE_RESET}'"
        SHELL_GUARD="SHELL_GUARD_${name//-/_}_ZSH"
        eval "$SHELL_GUARD=0"
    }
    check() {
        local name="$1"
        SHELL_GUARD="SHELL_GUARD_${name//-/_}_ZSH"
        print -v SHELL_GUARD_VALUE -- "${(P)SHELL_GUARD}"
        if [ "$SHELL_GUARD_VALUE" -eq 1 ]; then
            return 1
        fi
        return 0
    }

    case $1 in
        set)
            set ${@:2}
            ;;
        unset)
            unset ${@:2}
            ;;
        check)
            check ${@:2}
            ;;
        *)
            echo-error "Unknown command: $1"
            ;;
    esac
}

s-here() {
    nav "$SHELL_DIR"
}

s-is-compiled() {
    if [[ $SHELL_IS_COMPILED == true ]]; then
        return $CODE_OK
    else
        return $CODE_ERROR
    fi
}

s-is-darwin() {
    [[ "$SHELL_UNAME" == "Darwin" ]]
}

s-is-debug() {
    if [[ $SHELL_IS_DEBUG == true ]]; then
        return $CODE_OK
    else
        return $CODE_ERROR
    fi
}

s-is-linux() {
    [[ "$SHELL_UNAME" == "Linux" ]]
}

s-is-started() {
    if [[ $SHELL_IS_STARTED == true ]]; then
        return $CODE_OK
    else
        return $CODE_ERROR
    fi
}


s-is-tracing() {
    if [[ $SHELL_IS_TRACING == true ]]; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}

s-is-verbose() {
    if [[ $SHELL_IS_VERBOSE == true ]] || [[ $SHELL_FORCE_VERBOSE == true ]]; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}

s-is() {
    if [ $# -eq 0 ]; then
        return $CODE_NOT_FOUND
    fi
    s-is-$1 ${@:2}
}

# SHELL_LIBS_SRC_DIR="$SHELL_DIR/libs"
# SHELL_LIBS_DIST_DIR="$SHELL_CACHE_DIR/libs"

s-lib() {
    _compileLib() {
        debug info "s-lib compile $1"
        s-run files build $SHELL_LIBS_SRC_DIR/$1 $SHELL_LIBS_DIST_DIR/$1.zsh
    }
    _includeLib() {
        if [ ! -f $SHELL_LIBS_DIST_DIR/$1.zsh ]; then
            _compileLib $1
        fi
        debug info "s-lib include $1"
        source $SHELL_LIBS_DIST_DIR/$1.zsh
    }
    _runLib() {
        _includeLib $1
        s-run $1 ${@:2}
        return $?
    }

    case $1 in
        compile)
            _compileLib ${@:2}
            return $?
            ;;
        include)
            _includeLib ${@:2}
            return $?
            ;;
        run)
            _runLib ${@:2}
            return $?
            ;;
        *)
            _runLib $@
            return $?
            ;;
    esac
}

shell-linker() {
    _linkerDotfiles() {
        echo-info "Creating dotfiles linking..."
        ln -sf "$SHELL_DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
        ln -sf "$SHELL_DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
        ln -sf "$SHELL_DOTFILES_DIR/.zshenv" "$HOME/.zshenv"
        ln -sf "$SHELL_DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
    }

    _linkerBin() {
        debug warning "TODO remove linker bin"
        # echo-info "Creating bin linking..."
    }

    _linkerConfigs() {
        local target_link="$SHELL_CONFIGS_DIR/shell-config"
        if [ -L "$target_link" ] || [ -e "$target_link" ]; then
            echo-info "Recreating link at ${COLOR_YELLOW}$target_link${STYLE_RESET}..."
            rm -rf "$target_link"
        else
            echo-info "Creating configs linking at ${COLOR_YELLOW}$target_link${STYLE_RESET}..."
        fi
        ln -s "$SHELL_SHARED_DIR" "$target_link"
    }

    case $1 in
        dotfiles)
            _linkerDotfiles
            ;;
        configs)
            _linkerConfigs
            ;;
        bin)
            _linkerBin
            ;;
        all)
            _linkerDotfiles
            _linkerConfigs
            _linkerBin
            ;;
        *)
            echo-error "Unknown linker type: $1"
            ;;
    esac
}

shell-load() {
    source ~/.zshrc
}

shell-me() {
    _meV1() {
        cat /etc/os-release
    }
    _meV2() {
        neofetch
    }
    
    case $1 in
        1)
            _meV1
            ;;
        2)
            _meV2
            ;;
        all)
            _meV1
            _meV2
            ;;
        *)
            echo "1: /etc/os-release"
            echo "2: neofetch"
            echo "all: all"
            ;;
    esac
}

shell-nav() {
    _list() {
        for key in "${(k)paths_alias_list[@]}"; do
            echo "$key: ${paths_alias_list[$key]}"
        done
    }
    _add() {
        s-pather add-alias $@
    }
    _back() {
        local prevPath=${shell_navigation_list[$(( ${#shell_navigation_list[@]} - 1 ))]}
        if [ -z "$prevPath" ]; then
            echo-error "No previous path to navigate"
            return $CODE_ERROR
        fi
        SHELL_IS_BACK_PROCESSING=1
        cd $prevPath
        local _cdStatus=$?
        SHELL_IS_BACK_PROCESSING=0
        if [ $_cdStatus -eq 0 ]; then
            shell_navigation_list=(${shell_navigation_list[1,$(( ${#shell_navigation_list[@]} - 1 ))]})
        else
            echo-error "Can't navigate to previous path"
        fi

    }
    _run() {
        local navPath=$1
        verbose info "Navigate to ${COLOR_ARGUMENT}$navPath${STYLE_RESET}. Args: $@"
        if [ $navPath = "back" ]; then
            s-pather back $@
            return $?
        fi
        if [ ! -d "$navPath" ]; then
            local navPathAlias=$paths_alias_list[$navPath]
            if [ -z "$navPathAlias" ]; then
                echo-error "Can't navigate to ${COLOR_ARGUMENT}$navPath${STYLE_RESET}"
                return $CODE_ERROR
            fi
            if [ ! -d "$navPathAlias" ]; then
                echo-error "Alias for ${COLOR_ARGUMENT}$navPath${STYLE_RESET} is not a directory: ${COLOR_ARGUMENT}$navPathAlias${STYLE_RESET}"
                return $CODE_ERROR
            fi
            navPath=$navPathAlias
        fi
        cd $navPath
        if [ $? -ne 0 ]; then
            echo-error "Can't navigate to ${COLOR_ARGUMENT}$navPath${STYLE_RESET}"
        fi
    }

    local command=$1
    case $command in
        list)
            _list ${@:2}
            ;;
        add)
            _add ${@:2}
            ;;
        run)
            _run ${@:2}
            ;;
        back)
            _back ${@:2}
            ;;
        *)
            _run $@
            ;;
    esac
}


s-not-found() {
    _errorNF() {
        echo-error "${COLOR_COMMAND}not-found${STYLE_RESET}" $@
    }
    if [[ $SHELL_IS_PROJECT -eq 1 ]]; then
        s-project $@
        local _status=$?
        if [[ $_status -eq $CODE_OK ]]; then
            return $CODE_OK
        elif [[ $_status -ne $CODE_NOT_FOUND ]]; then
            _errorNF "Project run error '${COLOR_ARGUMENT}$_status${STYLE_RESET}'. Arguments $@"
            return $_status
        fi
    fi
    s-run $@
    local _status=$?
    if [[ $_status -eq $CODE_OK ]]; then
        return $CODE_OK
    elif [[ $_status -ne $CODE_NOT_FOUND ]]; then
        _errorNF "Unknown error ($_status). Arguments $@"
        return $_status
    fi
    _errorNF "Not found '${COLOR_ARGUMENT}$1${STYLE_RESET}'"
    return $CODE_NOT_FOUND
}

# testnf-sample() {
#     echo "This sample runs well"
# }

# typeset -gA command_cache
# s-not-found() {
#     echo "START Cache is: ${command_cache[@]}"
#     local cmd="$1"

#     if [[ -z $cmd ]]; then
#         echo-error "Command is required"
#         return 1
#     fi

#     if [[ -z ${command_cache[$cmd]} ]]; then
#         echo "Command '$cmd' not found. Caching alternative path: '$cmd-sample'"
#         command_cache[$cmd]="$cmd-sample"
#         echo "END Cache is: ${command_cache[@]}"
#         # return $CODE_NOT_FOUND
#     fi
    
#     if [[ -n ${command_cache[$cmd]} ]]; then
#         echo "Running cached command for '$cmd': ${command_cache[$cmd]}"
#         eval "${command_cache[$cmd]}" "${@:2}"
#         return $CODE_OK
#     fi

#     # local alternative_path="$cmd-sample"

#     # command_cache[$cmd]=$alternative_path
#     # # echo "Command '$cmd' not found. Caching alternative path: '${command_cache[$cmd]}'"
#     # echo "END Cache is: ${command_cache[@]}"
#     # return 127
# }

s-not() {
    if s-is $@; then
        return $CODE_ERROR
    else
        return $CODE_OK
    fi
}

s-pather() {
    _add-alias() { #? adds new alias of path
        paths_alias_list[$1]="$2"
    }
    _get() { #? returns alias or path, based on alias name
        local path=$1
        local pathAlias=$paths_alias_list[$path]
        if [ -z "$pathAlias" ]; then
            echo $path
        else
            echo $pathAlias
        fi
    }
    _dir_change() {
        s-run project pwd-check
    }
    _init() { #? every time shell is preparing to run at folder
        compiling info "You are currently at $(pwd)"
        _dir_change
        # load-nvmrc
    }
    _update() { #? shell foldder changes
        verbose info "You switched to $(pwd)"
        _dir_change
        if [ $SHELL_IS_BACK_PROCESSING -eq 0 ]; then
            shell_navigation_list[$#shell_navigation_list+1]=$PWD
            return
        fi
        
    }
    case $1 in
        add-alias)
            _add-alias ${@:2}
            ;;
        init) 
            _init ${@:2}
            ;;
        get) 
            _get ${@:2}
            ;;
        update)
            _update ${@:2}
            ;;
        *)
            echo-error "TODO shell-on-path-change"
            ;;
    esac
}

shell-brew-pkg() {
    case $1 in
        is-installed)
            s-run brew-is-installed ${@:2}
            ;;
        install)
            s-run brew-install ${@:2}
            ;;
        *)
            s-run brew-install $@
            ;;
    esac
}

shell-deb-pkg() {
    case $1 in
        is-installed)
            s-run deb-is-installed ${@:2}
            ;;
        install)
            s-run deb-install ${@:2}
            ;;
        *)
            s-run deb-install $@
            ;;
    esac
}

s-pkg-install-optional() {
    echo-info "Installing ${COLOR_CYAN}OPTIONAL${STYLE_RESET} packages"
    _installPackages=""
    if s-is linux; then
        _installPackages="$_installPackages build-essential procps twingate chrome java erdtree"
        _installPackages="$_installPackages gnome-browser-connector gnome-tweaks gnome-shell-extension-installer gnome-shell-extension-prefs"
        _installPackages="$_installPackages ulauncher teams-for-linux whatsapp-linux-app raindrop slack spotify"
        _installPackages="$_installPackages docker docker-desktop meslo-fonts warp-terminal yazi chatgpt-desktop"
        _installPackages="$_installPackages gnome-shell-extension-installer gnome-shell-extension-prefs notion-app libfuse2t64"
    fi

    packages_array=(${=_installPackages})
    for package in "${packages_array[@]}"; do
        s-install $package
    done

    if s-is linux; then
        s-install outlook-for-linux --edge
    fi
}

s-pkg-install-required() {
    echo-info "Installing ${COLOR_CYAN}REQUIRED${STYLE_RESET} packages"
    _installPackages=""
    s-is linux &&  _installPackages="$_installPackages brew fd-find snapd"
    _installPackages="openssl curl file git zap nvm mvn fzf lsd neofetch powerlevel10k gum $_installPackages"
    s-is linux && _installPackages="$_installPackages fd-find snapd"

    packages_array=(${=_installPackages})
    for package in "${packages_array[@]}"; do
        s-install $package
        # if [[ $package == "nvm" ]]; then
        #     s-run plugin-nvm-init
        # fi
        if [[ $package == "zap" ]]; then
            s-run plugin-zap-init
        fi
        if [[ $package == "brew" ]]; then
            s-run plugin-brew-init
        fi
    done
}

s-pkg-how() {
    local pkg_name=$1
    local installed_pkg_managers=""
    local stop_at_first=false
    if [[ "$@" == *"--first"* ]]; then
        stop_at_first=true
    fi
    if s-run script-pkg-is-installed $pkg_name; then
        installed_pkg_managers+="script "
        $stop_at_first && echo "${installed_pkg_managers% }" && return
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
    if command -v $pkg_name &> /dev/null; then
        installed_pkg_managers+="shell "
        $stop_at_first && echo "${installed_pkg_managers% }" && return
    fi
    echo "${installed_pkg_managers% }"
}

s-pkg-install() {
    local package=$1
    if [[ -z $package ]]; then
        s-run pkg-install-required
        return $CODE_OK
    fi
    [[ $package == "required" ]] && s-run pkg-install-required && return $CODE_OK
    [[ $package == "optional" ]] && s-run pkg-install-optional && return $CODE_OK

    if s-run pkg-is-installed $@; then
        local howInstalled=$(s-run pkg-how $@ --first)
        echo-info "Package ${COLOR_YELLOW}$1${STYLE_RESET} is already installed via ${COLOR_CYAN}$howInstalled${STYLE_RESET}."
    else
        s-run pkg-just-install $@
    fi
}

s-pkg-is-installed() {
    if [[ "$@" == *"--script"* ]]; then
        s-run script-pkg-is-installed $@
        return $?
    fi
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
    local howInstalled=$(s-run pkg-how $@ --first)
    if [ -z "$howInstalled" ]; then
        return $CODE_ERROR
    else
        return $CODE_OK
    fi
}

s-pkg-just-install() {
    local installerName=""
    [[ "$@" == *"--brew"* ]] && installerName="brew"
    [[ "$@" == *"--deb"* ]] && installerName="deb"
    [[ "$@" == *"--snap"* ]] && installerName="snap"
    [[ "$@" == *"--script-pkg"* ]] && installerName="script-pkg"
    [[ "$@" == *"--script"* ]] && installerName="script-pkg"

    if s-run script-pkg-can-install "$@"; then
        installerName="script-pkg"
    elif s-run snap-can-install "$@"; then
        installerName="snap"
    elif s-run brew-can-install "$@"; then
        installerName="brew"
    elif s-run deb-can-install "$@"; then
        installerName="deb"
    fi

    if [[ -z $installerName ]]; then
        echo-error "No installer found for $@. ($installerName)"
        return $CODE_ERROR
    fi
    if [[ $SHELL_SKIP_INSTALL == true ]]; then
        echo-warning "Installation via ${COLOR_CYAN}$installerName${STYLE_RESET} of ${COLOR_YELLOW}$1${STYLE_RESET} is skipped."
        return $CODE_ERROR
    fi
    s-run $installerName-just-install $@
}

s-pkg-remove() {
    howInstalled=""
    if s-run pkg-is-installed $@; then
        howInstalled=$(s-run pkg-how $@ --first)
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

shell-brew-can-install() {
    if brew info "$1" >/dev/null 2>&1; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}

shell-brew-install() {
    if s-run brew-is-installed $1; then
        echo-info "Brew package '${COLOR_YELLOW}$1${STYLE_RESET}' is already installed."
        return $CODE_OK
    fi
    shell-brew-just-install $@
}

shell-brew-is-installed() {
    local -r package_name="$1"
    brew list -1 | grep -q "^$package_name\$" && return $CODE_OK
    return $CODE_ERROR
}

shell-brew-just-install() {
    local -r package_name="$1"
    echo-info "Installing Brew package '${COLOR_YELLOW}$package_name${STYLE_RESET}'..."
    brew install $package_name
    if [ $? -eq 0 ]; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}

shell-brew-remove() {
    brew remove $@
}

shell-deb-can-install() {
    if apt-cache show $1 >/dev/null 2>&1; then
        return $CODE_OK
    fi
    if [[ -f $1 ]]; then
        return $CODE_OK
    fi
    return $CODE_NOT_FOUND
}

shell-deb-install() {
    if s-run deb-is-installed $1; then
        echo-info "Debian package '${COLOR_YELLOW}$1${STYLE_RESET}' is already installed."
        return $CODE_OK
    fi
    s-run deb-just-install $@
}

shell-deb-is-installed() {
    local -r package_name="$1"
    dpkg-query -W -f='${Status}' $package_name 2>/dev/null | grep -q "install ok installed" && return $CODE_OK
    # dpkg -l | grep -q $pkg_name && echo "Deb2" && return $CODE_OK
    return $CODE_ERROR
}

shell-deb-just-install() {
    if apt-cache show $1 >/dev/null 2>&1; then
        echo-info "Installing Debian package '${COLOR_YELLOW}$1${STYLE_RESET}' from APT..."
        sudo apt install -y $1
        if [ $? -eq 0 ]; then
            return $CODE_OK
        fi
        return $CODE_ERROR
    fi
    if [[ -f $1 ]]; then
        echo-info "Installing Debian package '${COLOR_YELLOW}$1${STYLE_RESET}' locally..."
        sudo apt install -y $1
        if [ $? -eq 0 ]; then
            return $CODE_OK
        fi
        return $CODE_ERROR
    fi
    return $CODE_NOT_FOUND
}

shell-deb-remove() {
    sudo apt remove $@
}

shell-script-pkg-can-install() {
    if [ -f "$SHELL_INSTALL_DIR/$1/install.zsh" ]; then
        return $CODE_OK
    fi
    return $CODE_NOT_FOUND
}

shell-script-pkg-install() {
    if s-run script-pkg-is-installed $1; then
        echo-info "Script package '${COLOR_YELLOW}$1${STYLE_RESET}' is already installed."
        return $CODE_OK
    fi
    s-run script-pkg-just-install $@
}

shell-script-pkg-is-installed() {
    local -r package_name="$1"
    if [[ -f "$SHELL_INSTALL_DIR/$pkg_name/is_installed.zsh" ]]; then
        source "$SHELL_INSTALL_DIR/$pkg_name/is_installed.zsh"
        local _status=$?
        if [[ $_status -eq 0 ]]; then
            return $CODE_OK
        fi
    fi
    return $CODE_ERROR
}

shell-script-pkg-just-install() {
    if [ -f "$SHELL_INSTALL_DIR/$1/install.zsh" ]; then
        echo-info "Installing Script package '${COLOR_YELLOW}$1${STYLE_RESET}'..."
        source "$SHELL_INSTALL_DIR/$1/install.zsh"
        return $CODE_OK
    fi
    return $CODE_NOT_FOUND
}

shell-script-pkg-remove() {
    if [ -f "$SHELL_INSTALL_DIR/$1/remove.zsh" ]; then
        echo-info "Removing Script package '${COLOR_YELLOW}$1${STYLE_RESET}'..."
        source "$SHELL_INSTALL_DIR/$1/remove.zsh"
        return $CODE_OK
    fi
    return $CODE_NOT_FOUND
}

shell-snap-can-install() {
    if snap find $1 | grep -q "^$1 "; then
        return $CODE_OK
    fi
    return $CODE_NOT_FOUND
}

shell-snap-install() {
    if s-run snap-is-installed $1; then
        echo-info "Snap package '${COLOR_YELLOW}$1${STYLE_RESET}' is already installed."
        return $CODE_OK
    fi
    s-run snap-just-install $@
}

shell-snap-is-installed() {
    local -r package_name="$1"
    if snap list | grep -q "^$package_name "; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}

shell-snap-just-install() {
    echo-info "Installing Snap package '${COLOR_YELLOW}$1${STYLE_RESET}'..."
    sudo snap install $1
    if [ $? -eq 0 ]; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}

shell-snap-remove() {
    sudo snap remove $@
}

shell-script-pkg() {
    case $1 in
        is-installed)
            s-run script-pkg-is-installed ${@:2}
            ;;
        install)
            s-run script-pkg-install ${@:2}
            ;;
        *)
            s-run script-pkg-install $@
            ;;
    esac
}

shell-snap-pkg() {
    case $1 in
        is-installed)
            s-run snap-is-installed ${@:2}
            ;;
        install)
            s-run snap-install ${@:2}
            ;;
        *)
            s-run snap-install $@
            ;;
    esac
}

s-pkg() {
    case $1 in
        is-installed)
            s-pkg-is-installed ${@:2};
            ;;
        just-install)
            s-pkg-just-install ${@:2};
            ;;
        install)
            s-pkg-install ${@:2};
            ;;
        remove)
            s-pkg-remove ${@:2};
            ;;
        *)
            # _pkgInstall ${@:2};
            echo-error "Invalid shell-pkg command: $1";
            ;;
    esac
}
s-install() {
    s-pkg install $@
}
s-remove() {
    s-pkg remove $@
}
s-just-install() {
    s-pkg just-install $@
}
s-is-installed() {
    s-pkg is-installed $@
}

shell-plugin-brew-init() {
    tracing "Load brew TODO"
    # test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
    # test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
}

s-plugin-init() {
    s-run plugin-brew-init
    s-run plugin-nvm-init
    s-run plugin-zap-init
}

load-nvmrc() {
    tracing "Load nvmrc"
    if [[ ":$PATH:" != *":$NVM_DIR/bin:"* ]]; then
        # export PATH="$NVM_DIR/bin:$PATH"
    fi
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"
    if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
        if [ "$nvmrc_node_version" = "N/A" ]; then
            nvm install
        elif [ "$nvmrc_node_version" != "$node_version" ]; then
            nvm use --silent
        fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
        nvm use default
    fi
}

shell-plugin-nvm-init() {
    # shellcheck source=/dev/null
    # source "$HOME/.nvm/nvm.sh"
    if [ -z "$NVM_LOADED" ]; then
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        export NVM_LOADED=true
    fi

    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
    # if s-is macos; then
    #     [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    #     [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" 
    # fi

}

# s-plugin-nvm-init() {
#     if [[ $(command -v nvm) ]]; then
#         echo-fn error "NVM already loaded"
#         return
#     fi
#     nvm() {
#         debug info "Loading nvm from nvm.sh"
#         local nvmDir="$(brew --prefix nvm)"
#         [[ -s "$nvmDir/nvm.sh" ]] && \. "$nvmDir/nvm.sh"  # This loads nvm
#         # [[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#         nvm "$@"
#     }
# }

shell-plugin-zap-init() {
    tracing "Load zap"
    if [[ -f $ZAP_DIR/zap.zsh ]]; then
        source $ZAP_DIR/zap.zsh
    fi
}

s-project() {
    _list() {
        if [ ${#projects_scripts_list[@]} -eq 0 ]; then
            echo-info "No projects scripts found"
            return $CODE_OK
        fi
        for key in "${(k)projects_scripts_list[@]}"; do
            echo "$key: ${projects_scripts_list[$key]}"
        done
    }
    _add() {
        local pathOrAlias=$1
        local pathResolved=$(s-pather get $pathOrAlias)
        local scriptName=$2
        projects_scripts_list[$pathResolved]=$scriptName
    }
    _pwd-check() {
        SHELL_IS_PROJECT=0
        local scriptName=${projects_scripts_list[$PWD]}
        if [ -n "$scriptName" ]; then
            # debug success "Script for project: $scriptName"
            SHELL_IS_PROJECT=1
            return $CODE_OK
        fi
        # verbose-error "No script found for $scriptName at $PWD"
    }
    _run() {
        local scriptName=${projects_scripts_list[$PWD]}
        if [ -z "$scriptName" ]; then
            echo-error "No script found for $PWD"
            return $CODE_ERROR
        fi
        $scriptName $@
        local _status=$?
        if [ $_status -eq $CODE_OK ]; then
            return $CODE_OK
        elif [ $_status -ne $CODE_NOT_FOUND ]; then
            echo-error "Unknown project error $_status. $@"
        fi
        return $_status
    }

    case $1 in
        add)
            _add ${@:2}
            ;;
        pwd-check)
            _pwd-check ${@:2}
            ;;
        list)
            _list ${@:2}
            ;;
        run)
            _run ${@:2}
            return $?
            ;;
        *)
            _run $@
            return $?
            ;;
    esac
}

shell-reload() {
    exec zsh
}

shell-restart() {
    clear && exec zsh
}

s-run() {
    local command=$1
    local allArgs=$@
    if [ -z "$command" ]; then
        echo-error "shell: command is required. See 'shell help'."
        return $CODE_ERROR
    fi


    #? run via 's-$command'
    if [ -n "$(declare -f s-$command)" ]; then
        s-$command ${@:2}
        local _status=$?
        # if [ $_status -ne $CODE_OK ] && [ $_status -ne $CODE_NOT_FOUND ]; then
        #     # echo-error "'${COLOR_ARGUMENT}shell $command${STYLE_RESET}' failed. Status: $_status"

        # fi
        return $_status
    fi

    #? run via 'shell-$command'
    if [ -n "$(declare -f shell-$command)" ]; then
        shell-$command ${@:2}
        local _status=$?
        # if [ $_status -ne $CODE_OK ] && [ $_status -ne $CODE_NOT_FOUND ]; then
        #     # echo-error "'${COLOR_ARGUMENT}shell $command${STYLE_RESET}' failed. Status: $_status"

        # fi
        return $_status
    fi

    #? run via '$command'
    if [ -n "$(declare -f $command)" ]; then
        $command ${@:2}
        local _status=$?
        # if [ $_status -ne $CODE_OK ] && [ $_status -ne $CODE_NOT_FOUND ]; then
        #     # echo-error "'${COLOR_ARGUMENT}shell $command${STYLE_RESET}' failed. Status: $_status"
        # fi
        return $_status
    fi

    #? run from libs
    if [ -d "$SHELL_LIBS_SRC_DIR/$command" ]; then
        s-lib run $command ${@:2}
        local _status=$?
        # if [ $_status -ne $CODE_OK ] && [ $_status -ne $CODE_NOT_FOUND ]; then
        #     # echo-error "'${COLOR_ARGUMENT}shell lib $command${STYLE_RESET}' failed. Status: $_status"
        # fi
        return $_status
    fi

    #? run script from scripts
    if [ -f "$SHELL_SCRIPTS_DIR/$command.zsh" ]; then
        source "$SHELL_SCRIPTS_DIR/$command.zsh" ${@:2}
        return $CODE_OK
    fi

    return $CODE_NOT_FOUND
}

shell-tweak() {
    _tweakGet() {
        echo $(s-run config-file get $SHELL_SHARED_DIR/.tweak-config $@)
    }
    _tweakSet() {
        s-run config-file set $SHELL_SHARED_DIR/.tweak-config $@
    }
    _tweakApply() {
        local isTweakEnabled=$(_tweakGet $1)
        if [[ $isTweakEnabled != true ]]; then
            echo-info "Applying tweak '${COLOR_YELLOW}$1${STYLE_RESET}'..."
            local tweakPath=$SHELL_TWEAKS_DIR/$1.zsh
            if [ -f $tweakPath ]; then
                source $tweakPath
                _tweakSet $1 true
                echo-success "Tweak '${COLOR_YELLOW}$1${STYLE_RESET}' applied."
            else
                echo-error "Tweak '${COLOR_YELLOW}$1${STYLE_RESET}' not found."
            fi
        else
            echo-info "Skipping already installed tweak '${COLOR_YELLOW}$1${STYLE_RESET}'..."
        fi
    }


    case $1 in
    get)
        _tweakGet ${@:2}
        ;;
    set)
        _tweakSet ${@:2}
        ;;
    apply)
        _tweakApply ${@:2}
        ;;
    *)
        _tweakApply $@
        ;;
    esac
}

s-user() {
    local userConfigFile="$SHELL_SHARED_DIR/.user-config"
    _userGet() {
        s-run config-file get $userConfigFile $@
    }
    _userSet() {
        s-run config-file set $userConfigFile $@
    }
    _userLoad() {
        if [ -f $userConfigFile ]; then
            source $userConfigFile
        fi
    }

    case $1 in
        get)
            _userGet ${@:2}
            ;;
        set)
            _userSet ${@:2}
            ;;
        load)
            _userLoad
            ;;
        *)
            echo "Invalid '${COLOR_YELLOW}s-user${STYLE_RESET}' command '${COLOR_YELLOW}$1${STYLE_RESET}'."
            ;;
    esac
}

s-git-current-branch() {
    git branch --show-current
    # git rev-parse --abbrev-ref HEAD
}

s-git-current-commit() {
    git log -1 --pretty=format:"%h %s"
}

s-git-current-user-name() {
    git config --global user.name
}
s-git-current-user-email() {
    git config --global user.email
}
s-git-current-user() {
    echo "$(s-git current-user-name) <$(s-git current-user-email)>"
}

s-git-dialog-commit() {
    _commitMessage="$1"
    if [[ $_commitMessage == "" ]]; then
        _commitMessage=$(gum input --header "Commit message")
    fi
    if [[ "$@" == *"--flow"* ]]; then
        _commitFlowMode=$(gum choose "feat" "fix" "hotfix" --header "GitFlow Commit mode")
        _commitMessage=$(gum input --header "Commit message" --value="DFS2-00000: $_commitFlowMode: $_commitMessage")
    fi
    _stagedCount=$(s-git staged-files-count)
    s-git me
    echo-warning "Commit ${COLOR_ARGUMENT}$_stagedCount${STYLE_RESET} files with message ${COLOR_ARGUMENT}$_commitMessage${STYLE_RESET}"
    if gum confirm "Do you want to commit?"; then
        s-git fast-commit $@
        s-git me
    fi
    return $CODE_OK
}

s-git-fast-commit() {
    git commit --no-verify -m "$1" ${@:2}
    if [[ "$@" == *"--sync"* ]]; then
        git sync
    fi
}

s-git-fast-push() {
    git push --no-verify -u origin
}

s-git-github-open() {
    local file=$1
    local remote=${2:-origin}
    local repoRoot=$(s-git repo-root)
    local branch=$(s-git current-branch)

    echo "file: $file"
    echo "remote: $remote"
    echo "repoRoot: $repoRoot"
    echo "branch: $branch"
    local url=$(git config --get remote.$remote.url)
    echo "url: $url"

    [[ -n $repoRoot && -n $branch && -n $remote ]] || return 1

    # local path=${PWD/#$repoRoot/}
    local pwd2=$(pwd)
    echo "pwd2: $pwd2"
    local path="${PWD#$repoRoot}"
    echo "localPpathath: $path"
    echo "PWD: $PWD"
    echo "repoRoot: $repoRoot"
    [[ -n $file ]] && localPath+=/$file
    echo "path: $path"

    local a
    IFS=:/ read -A a <<< "$url"
    local len=${#a[@]}
    local user=${a[$len-1]%.git}
    local repo=${a[$len-0]%.git}

    local viewMode="tree"
    if [[ -n $file ]]; then
        viewMode="blob"
    fi
    local url="https://github.com/$user/$repo/$viewMode/$branch$path"
    echo $url
}

s-git-gho() {
    s-git-github-open $@
}

s-git-hard-reset() {
    echo "Hard reset is not recommended. Use with caution. (TODO: Add confirmation)"
    # git reset --hard HEAD
    # git clean -df
}

s-git-merge-squash-reset() {
    git merge --no-commit --squash $1
    git reset HEAD
    return $CODE_OK
}

s-git-me() {
    #? display info about git user
    echo-info "Directory: ${COLOR_ARGUMENT}$(pwd)${STYLE_RESET}"
    echo-info "Current user: ${COLOR_ARGUMENT}$(s-git current-user)${STYLE_RESET}"
    echo-info "Current branch: ${COLOR_ARGUMENT}$(s-git current-branch)${STYLE_RESET}"
    echo-info "Current commit: ${COLOR_ARGUMENT}$(s-git current-commit)${STYLE_RESET}"
    echo-info "Staged files: ${COLOR_ARGUMENT}$(s-git staged-files-count)${STYLE_RESET}. (${COLOR_ARGUMENT}git staged-files${STYLE_RESET} for details)"
    echo-info "Unstaged files: ${COLOR_ARGUMENT}$(s-git unstaged-files-count)${STYLE_RESET}. (${COLOR_ARGUMENT}git unstaged-files${STYLE_RESET} for details)"
    echo-info "Modified files: ${COLOR_ARGUMENT}$(s-git modified-files-count)${STYLE_RESET}. (${COLOR_ARGUMENT}git modified-files${STYLE_RESET} for details)"
    echo-info "Created files: ${COLOR_ARGUMENT}$(s-git created-files-count)${STYLE_RESET}. (${COLOR_ARGUMENT}git created-files${STYLE_RESET} for details)"
    echo-info "Deleted files: ${COLOR_ARGUMENT}$(s-git deleted-files-count)${STYLE_RESET}. (${COLOR_ARGUMENT}git deleted-files${STYLE_RESET} for details)"

    return $CODE_OK
}

s-git-repo-root() {
    git rev-parse --show-toplevel
}

s-git-set-email() {
    git config --global user.email "$1"
    s-git current-user
    return $CODE_OK
}

s-git-soft-reset() {
    echo-warning "Soft reset is not recommended. Use with caution. (TODO: Add confirmation)"
    # git reset --soft HEAD~1;
}

s-git-stage-all() {
    git add -A
}

s-git-stage-modified() {
    git add -u
}

s-git-created-files() {
    git ls-files --others --exclude-standard
}

s-git-created-files-count() {
    s-git created-files | wc -l
    return $CODE_OK
}

s-git-deleted-files() {
    git diff --diff-filter=D --name-only
}

s-git-deleted-files-count() {
    s-git deleted-files | wc -l
    return $CODE_OK
}

s-git-modified-files() {
    git diff --name-only
    return $CODE_OK
}

s-git-modified-files-count() {
    s-git modified-files | wc -l
    return $CODE_OK
}

s-git-staged-files() {
    git diff --name-only --cached
    return $CODE_OK
}

s-git-staged-files-count() {
    s-git staged-files | wc -l
    return $CODE_OK
}

s-git-unstaged-files() {
    _unstagedFiles=$(git modified-files)
    _newFiles=$(git created-files)
    _allFiles="$_unstagedFiles"$'\n'"$_newFiles"
    #? Remove any empty lines
    _allFiles=$(echo "$_allFiles" | sed '/^$/d')
    echo "$_allFiles"
    return $CODE_OK
}

s-git-unstaged-files-count() {
    s-git unstaged-files | wc -l
    return $CODE_OK
}

s-git-sync() {
    git fetch --all
    git pull
    if [[ "$@" == *"--push"* ]]; then
        s-git fast-push
    fi
    return $CODE_OK
}

s-git() {
    if [[ -z $1 ]]; then
        echo-error "Empty command for s-git"
        return $CODE_ERROR
    fi
    s-git-$1 ${@:2}
}

s-posture-check() {
  # Check if UFW is active
  ufw_status=$(sudo ufw status | grep "Status: active")
  if [ -n "$ufw_status" ]; then
    echo "UFW Firewall: Active"
  else
    echo "UFW Firewall: Inactive"
  fi

  # Check if firewalld is active
  firewalld_status=$(sudo systemctl is-active firewalld)
  if [ "$firewalld_status" = "active" ]; then
    echo "firewalld: Active"
  else
    echo "firewalld: Inactive"
  fi

  # Check for LUKS encryption on partitions
  encrypted_partitions=$(lsblk -o NAME,FSTYPE | grep crypt)
  if [ -n "$encrypted_partitions" ]; then
    echo "LUKS Encryption: Active"
  else
    echo "LUKS Encryption: Not found"
  fi
}

s-posture-disable-ufw() {
    sudo ufw disable
}

s-posture-install-firewalld() {
    #? Installing and Using firewalld 
    sudo apt install firewalld
    sudo systemctl enable firewalld
    sudo systemctl start firewalld
}

s-posture-install-luks() {
    #? Configure Automatic Security Updates: Set up automatic updates for security patches:
    sudo dpkg-reconfigure --priority=low unattended-upgrades

    #? Enable Full-Disk Encryption on Additional Drives (If Needed): If you add new drives and want to encrypt them, you can use cryptsetup to encrypt the partitions:
    # sudo cryptsetup luksFormat /dev/sdX
    # sudo cryptsetup open /dev/sdX encrypted_partition

    #? Enable UFW Logging: You can enable firewall logging for more visibility into what’s being blocked:
    sudo ufw logging on

}

s-posture-install-ufw() {
    #? Install UFW: During installation, make sure to install ufw. On most Ubuntu or Debian-based distributions, it's installed by default, but you can ensure it by running:
    sudo apt install ufw

    #? Enable UFW: After installation is complete and before configuring the system further, enable the firewall:
    sudo ufw enable

    #? Configure Firewall Rules: Depending on the services you're running (e.g., SSH, HTTP), configure the rules:
    sudo ufw allow ssh
    sudo ufw allow http
    sudo ufw allow https

    #? Ensure UFW Starts on Boot: UFW should automatically start on boot once enabled, but you can ensure this by running:
    sudo systemctl enable ufw
}

s-posture() {
    if [ $# -eq 0 ]; then
        echo-error "s-posture: Missing argument"
        return 1
    fi
    s-posture-$1 ${@:2}
}

typeset -gA shell_timer_list
s-timer() {
    _timerStart() {
        local name="$1"
        s-is linux && local startTime=$(date +%s.%N)
        s-is darwin && local startTime=$(date +%s)
        shell_timer_list[$name]=$startTime
    }
    _timerGetDiff() {
        local name=$1
        local startTime=${shell_timer_list[$name]}
        s-is linux && local endTime=$(date +%s.%N)
        s-is darwin && local endTime=$(date +%s)
        local diffTime=$((endTime - startTime))
        local diffRounded="$(echo $diffTime | cut -c1-5)"
        echo $diffRounded
    }
    _timerStop() {
        local name=$1
        local preffix=$2
        local suffix=$3
        local startTime=${shell_timer_list[$name]}
        local diffRounded="$(_timerGetDiff $name)"
        echo-info "$preffix${COLOR_ARGUMENT}$diffRounded${STYLE_RESET}$suffix"
    }
    case $1 in
        start)
            _timerStart ${@:2}
            ;;
        stop)
            _timerStop ${@:2}
            ;;
        diff)
            _timerGetDiff ${@:2}
            ;;
        *)
            echo "Usage: s-timer start|stop <name>"
            ;;
    esac
}

s-tm() {
    #? kill all tmux sessions
    # tmux kill-server
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
