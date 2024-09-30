#? runs previously defined runtime function
if [ -n "$(declare -f on-shell-runtime)" ]; then
    on-shell-runtime
else
    debug-error "on-shell-runtime is not defined. This is user function, you should define it in your zshrc file."
fi