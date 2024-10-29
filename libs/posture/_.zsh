shell-posture() {
    case $1 in
        check) s-run posture-check ${@:2} ;;
        disable-ufw) s-run posture-disable-ufw ${@:2} ;;
        install-firewalld) s-run posture-install-firewalld ${@:2} ;;
        install-ufw) s-run posture-install-ufw ${@:2} ;;
        install-luks) s-run posture-install-luks ${@:2} ;;
        *) echo-error "Invalid shell-posture command: $1" ;;
    esac
}