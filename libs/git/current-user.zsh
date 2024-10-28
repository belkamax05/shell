shell-git-current-user-name() {
    git config --global user.name
}
shell-git-current-user-email() {
    git config --global user.email
}
shell-git-current-user() {
    echo "$(s-run git current-user-name) <$(s-run git current-user-email)>"
}