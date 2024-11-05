s-git-current-user-name() {
    # if $@ contains "--global" then run --global variant, otherwise local
    if [[ "$@" == *"--global"* ]]; then
        git config --global user.name
    else
        git config user.name
    fi   
}
s-git-current-user-email() {
    if [[ "$@" == *"--global"* ]]; then
        git config --global user.email
    else
        git config user.email
    fi
}
s-git-current-user() {
    echo "$(s-git-current-user-name $@) <$(s-git-current-user-email $@)>"
}