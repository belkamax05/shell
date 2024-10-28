shell-env-reset() {
    DEBUG_ENABLED=1          #? enables debug mode globally
    DEBUG_TIMER=1            #? shows message "[timers]: X"
    DEBUG_INSTALL=1          #? shows message "[install]: X"
    DEBUG_FUNCTION=1         #? shows message "[<function>]: X"

    SHELL_FORCE_VERBOSE=false #? forces verbose mode
    SHELL_PREVENT_INSTALL=false #? prevents installation of packages
    SHELL_INSTALL_OPTIONAL=false #? installs optional packages
    SHELL_IS_COMPILED=false

    SHELL_IS_BACK_PROCESSING=0
    SHELL_IS_STARTED=false
    SHELL_UNAME="$(uname -s)"
}