typeset -gA shell_timer_list
s-timer() {
    _timerStart() {
        local name="$1"
        s-is linux && local startTime=$(date +%s.%N)
        s-is darwin && local startTime=$(date +%s)
        shell_timer_list[$name]=$startTime
    }
    _timerGetDiff() {
        local name=$1
        local startTime=${shell_timer_list[$name]}
        s-is linux && local endTime=$(date +%s.%N)
        s-is darwin && local endTime=$(date +%s)
        local diffTime=$((endTime - startTime))
        local diffRounded="$(echo $diffTime | cut -c1-5)"
        echo $diffRounded
    }
    _timerStop() {
        local name=$1
        local preffix=$2
        local suffix=$3
        local startTime=${shell_timer_list[$name]}
        local diffRounded="$(_timerGetDiff $name)"
        echo-info "$preffix${COLOR_ARGUMENT}$diffRounded${STYLE_RESET}$suffix"
    }
    case $1 in
        start)
            _timerStart ${@:2}
            ;;
        stop)
            _timerStop ${@:2}
            ;;
        diff)
            _timerGetDiff ${@:2}
            ;;
        *)
            echo "Usage: s-timer start|stop <name>"
            ;;
    esac
}