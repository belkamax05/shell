s-posture() {
    if [ $# -eq 0 ]; then
        echo-error "s-posture: Missing argument"
        return 1
    fi
    s-posture-$1 ${@:2}
}