

function me() {
    _v1() {
        cat /etc/os-release
    }
    _v2() {
        neofetch
    }
    
    case $1 in
        1)
            _v1
            ;;
        2)
            _v2
            ;;
        all)
            _v1
            _v2
            ;;
        *)
            echo "1: /etc/os-release"
            echo "2: neofetch"
            echo "all: all"
            ;;
    esac
}