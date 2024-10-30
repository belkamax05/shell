s-git-current-user-name() {
    git config --global user.name
}
s-git-current-user-email() {
    git config --global user.email
}
s-git-current-user() {
    echo "$(s-git current-user-name) <$(s-git current-user-email)>"
}