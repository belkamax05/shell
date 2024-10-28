shell-git() {
    case $1 in
        me) s-run git-me ${@:2} ;;
        gho) s-run git-gho ${@:2} ;;
        current-branch) s-run git-current-branch ${@:2} ;;
        current-commit) s-run git-current-commit ${@:2} ;;
        current-user) s-run git-current-user ${@:2} ;;
        current-user-name) s-run git-current-user-name ${@:2} ;;
        current-user-email) s-run git-current-user-email ${@:2} ;;
        set-email) s-run git-set-email ${@:2} ;;
        merge-squash-reset) s-run git-merge-squash-reset ${@:2} ;;
        fast-commit) s-run git-fast-commit ${@:2} ;;
        fast-push) s-run git-fast-push ${@:2} ;;
        dialog-commit) s-run git-dialog-commit ${@:2} ;;
        hard-reset) s-run git-hard-reset ${@:2} ;;
        soft-reset) s-run git-soft-reset ${@:2} ;;
        stage-all) s-run git-stage-all ${@:2} ;;
        stage-modified) s-run git-stage-modified ${@:2} ;;
        zsh) echo-error "Empty params for shell-git command: $1" ;;
        *) echo-error "Invalid shell-git command: $1" ;;
    esac
}