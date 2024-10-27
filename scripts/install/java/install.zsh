#? prevents error in java installation
sudo add-apt-repository --remove ppa:linuxuprising/java

#? https://ubuntu.com/tutorials/install-jre#2-installing-openjdk-jre
sudo apt install default-jre
sudo apt install openjdk-11-jdk
#? sudo apt install openjdk-17-jdk
#? sudo apt install oracle-java17-installer oracle-java17-set-default
#? sudo apt install oracle-java20-installer oracle-java20-set-default