s-runtime-options-history-limit() {
    HISTSIZE=1000           # Number of commands to keep in memory
    SAVEHIST=500            # Commands to keep in the history file
    HISTFILE=~/.zsh_history # Location of the history file
    setopt hist_ignore_all_dups  # Ignore duplicate commands
    setopt share_history    # Share history across sessions

}