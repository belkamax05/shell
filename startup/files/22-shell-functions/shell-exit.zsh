
function shell-hard-exit() {
    shell-clear-cache
    exit 0
}

function shell-soft-exit() {
    shell-clear-startup
    shell-clear-setup
    exit 0
}