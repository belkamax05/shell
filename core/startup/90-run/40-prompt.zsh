#? prompt
local p10k_dir="$(brew --prefix)/share/powerlevel10k"
[[ -d $p10k_dir ]] && source "$p10k_dir/powerlevel10k.zsh-theme"
s-run runtime-prompt-configure