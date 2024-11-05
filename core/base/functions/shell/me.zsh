shell-me() {
    _meV1() {
        cat /etc/os-release
    }
    _meV2() {
        neofetch
    }
    
    case $1 in
        1)
            _meV1
            ;;
        2)
            _meV2
            ;;
        all)
            _meV1
            _meV2
            ;;
        *)
            echo "1: /etc/os-release"
            echo "2: neofetch"
            echo "all: all"
            ;;
    esac
}