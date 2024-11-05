
#? on-shell-runtime event
if [ -n "$(declare -f on-shell-runtime)" ]; then
    on-shell-runtime
fi
tracing "on-shell-runtime done"
s-not compiled && s-pather init
tracing "paths done"