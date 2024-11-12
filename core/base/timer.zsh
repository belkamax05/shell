typeset -gA shell_timer_list

s-timer-get-time() {
    s-is linux && date +%s.%N
    s-is darwin && date +%s
}
s-timer-start() {
    local name="$1"
    shell_timer_list[$name]=$(s-timer-get-time)
}
s-timer-get-diff() {
    local name=$1
    local startTime=${shell_timer_list[$name]}
    local endTime=$(s-timer-get-time)
    local diffTime=$((endTime - startTime))
    local diffRounded="$(echo $diffTime | cut -c1-5)"
    echo $diffRounded
}
s-timer-stop() {
    local name=$1
    local preffix=$2
    local suffix=$3
    local startTime=${shell_timer_list[$name]}
    local diffRounded="$(s-timer-get-diff $name)"
    echo-info "$preffix${COLOR_ARGUMENT}$diffRounded${STYLE_RESET}$suffix"
}

s-timer() {
    case $1 in
        start)
            s-timer-start ${@:2}
            ;;
        stop)
            s-timer-stop ${@:2}
            ;;
        diff)
            s-timer-get-diff ${@:2}
            ;;
        *)
            echo "Usage: s-timer start|stop <name>"
            ;;
    esac
}