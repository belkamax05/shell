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
}