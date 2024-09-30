function debug() {
    if [ "$DEBUG_ENABLED" = 1 ]; then
        echo-debug "$@"
    fi
}

function debug-command() {
    debug "${COLOR_COMMAND}[$1]${STYLE_RESET}: ${@:2}"
}

function debug-timer() {
    if [ "$DEBUG_TIMER" = 1 ]; then
        debug-command timer $@
    fi
}

function debug-install() {
    if [ "$DEBUG_INSTALL" = 1 ]; then
        debug-command install $@
    fi
}

function debug-function() {
    if [ "$DEBUG_FUNCTION" = 1 ]; then
        debug-command $@
    fi
}

function debug-function-verbose() {
    if [ "$DEBUG_FUNCTION_VERBOSE" = 1 ]; then
        debug-command $@
    fi
}

function debug-error() {
    if [ "$DEBUG_ENABLED" = 1 ]; then
        echo-error "DEBUG: $@"
    fi
}