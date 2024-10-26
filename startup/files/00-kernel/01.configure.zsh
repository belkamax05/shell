#? DEBUG

DEBUG_ENABLED=0          #? enables debug mode globally
DEBUG_TIMER=1            #? shows message "[timers]: X"
DEBUG_INSTALL=1          #? shows message "[install]: X"
DEBUG_FUNCTION=1         #? shows message "[<function>]: X"

SHELL_FORCE_VERBOSE=false #? forces verbose mode

_shellIsVerbose() {
    if [[ $SHELL_IS_VERBOSE == true ]] || [[ $SHELL_FORCE_VERBOSE == true ]]; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}

#? CONFIGS
