s-timer start startup

#? associative array
typeset -gA paths_alias_list
typeset -gA projects_scripts_list

#? indexed array
typeset -ga shell_navigation_list=(
    "$PWD"
)

s-run env init
tracing "runtime start"
s-user load

s-run runtime-autoload

#? system
if s-not compiled; then
    s-run runtime-create-folders
    s-run plugin-init
    s-run linker all
    s-run runtime-apply-tweaks
    tracing "installing done"
else
    s-run plugin-init
fi

#? plugins
s-run runtime-zap-plugins
s-run runtime-fzf-configure


#? completions
s-run runtime-completions

#? prompt
local p10k_dir="$(brew --prefix)/share/powerlevel10k"
[[ -d $p10k_dir ]] && source "$p10k_dir/powerlevel10k.zsh-theme"
s-run runtime-prompt-configure

tracing "prompts done"
s-run runtime-options
s-run runtime-kali
s-run runtime-keybindings


#? on-shell-runtime event
if [ -n "$(declare -f on-shell-runtime)" ]; then
    on-shell-runtime
fi
tracing "on-shell-runtime done"
s-not compiled && s-pather init
tracing "paths done"

zcompile ~/.zshrc

SHELL_IS_STARTED=true
if [[ $PRINT_TIME_NEXT_RUN == true ]]; then
    s-run user set PRINT_TIME_NEXT_RUN false
    s-timer stop zshenv "Zshenv runtime: " " seconds"
    s-timer stop startup "Startup runtime: " " seconds"
fi
