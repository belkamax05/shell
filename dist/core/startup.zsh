#? associative array
typeset -gA paths_alias_list
typeset -gA projects_scripts_list

#? indexed array
typeset -ga shell_navigation_list=(
    "$PWD"
)

#!header
tracing "runtime start 1"
s-run runtime-timer-start
tracing "runtime start 2"
s-run env init
tracing "runtime start 3"
s-user load
#!header

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

#!compile
if s-not compiled; then
    tracing "compiling..."
    echo-info "Runtime finished"
    s-run build
    s-debugger env
    s-run runtime-timer-stop
    s-run reload
else
    tracing "skipping compilation..."
    s-debugger env
    s-run runtime-timer-stop
fi
tracing "compile done"
#!compile

#!footer
zcompile ~/.zshrc
tracing "runtime end"
SHELL_IS_STARTED=true
#!footer
