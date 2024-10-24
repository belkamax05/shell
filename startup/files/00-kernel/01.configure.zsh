#? DEBUG

DEBUG_ENABLED=0          #? enables debug mode globally
DEBUG_TIMER=1            #? shows message "[timers]: X"
DEBUG_INSTALL=1          #? shows message "[install]: X"
DEBUG_FUNCTION=1         #? shows message "[<function>]: X"

_shellIsVerbose() {
    if [[ $SHELL_IS_VERBOSE == true ]]; then
        return $CODE_OK
    fi
    return $CODE_ERROR
}

#? CONFIGS
