#? prevents error in java installation
sudo add-apt-repository --remove ppa:linuxuprising/java

#? https://ubuntu.com/tutorials/install-jre#2-installing-openjdk-jre
sudo apt install default-jre
sudo apt install openjdk-11-jdk
#? or: sudo apt install openjdk-17-jdk