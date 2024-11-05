s-posture-install-firewalld() {
    #? Installing and Using firewalld 
    sudo apt install firewalld
    sudo systemctl enable firewalld
    sudo systemctl start firewalld
}