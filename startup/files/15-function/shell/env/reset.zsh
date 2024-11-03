shell-env-reset() {
    DEBUG_TIMER=1            #? shows message "[timers]: X"
    DEBUG_INSTALL=1          #? shows message "[install]: X"
    DEBUG_FUNCTION=1         #? shows message "[<function>]: X"

    SHELL_IS_DEBUG=false
    SHELL_FORCE_VERBOSE=false #? forces verbose mode
    # SHELL_INSTALL_OPTIONAL=false #? installs optional packages
    # SHELL_INSTALL_REQUIRED=true #? installs required packages
    SHELL_IS_COMPILED=false
    SHELL_SKIP_INSTALL=false #? prevents all install cases

    SHELL_IS_BACK_PROCESSING=0
    SHELL_IS_STARTED=false
    SHELL_UNAME="$(uname -s)"
}