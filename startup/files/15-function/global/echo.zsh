function echo-error() {
    echo "$SHELL_PREFFIX_ERROR $@"
}

function echo-success() {
    echo "$SHELL_PREFFIX_SUCCESS $@"
}

function echo-debug() {
    echo "$SHELL_PREFFIX_DEBUG $@"
}

function echo-info() {
    echo "$SHELL_PREFFIX_INFO  $@"
    #? extra space added due tu issue with emoji width
}