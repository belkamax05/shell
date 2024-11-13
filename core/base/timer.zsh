#!/bin/zsh
typeset -gA shell_timer_list

s-timer-get-time() {
    s-is linux && date +%s.%N
    s-is darwin && gdate +%s.%N
}
s-timer-start() {
    local name="$1"
    shell_timer_list[$name]=$(s-timer-get-time)
}
s-timer-get-diff() {
    local name=$1
    local startTime=${shell_timer_list[$name]}
    if [[ -z $startTime ]]; then
        echo-error "Timer $name not started"
        return
    fi
    local endTime=$(s-timer-get-time)
    local diffTime=$((endTime - startTime))
    # echo "startTime: $startTime"
    # echo "endTime: $endTime"
    # echo "diffTime: $diffTime"
    # local diffTime=$(( endTime - startTime ))
    # echo "$diffTime" | awk '{printf "%.2f", $1}'
    # local diffTime=$(echo "$endTime - $startTime" | bc)
    local diffRounded="$(echo $diffTime | cut -c1-5)"
    # local diffRounded=$(printf "%.2f" $diffTime)
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