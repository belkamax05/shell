s-run runtime
[[ $SHELL_IS_SOURCE == true ]] && s-run compile
s-run user set SHELL_IS_COMPILED true
SHELL_IS_COMPILED=true
SHELL_IS_STARTED=true
