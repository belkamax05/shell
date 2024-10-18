#? Configure Automatic Security Updates: Set up automatic updates for security patches:
sudo dpkg-reconfigure --priority=low unattended-upgrades

#? Enable Full-Disk Encryption on Additional Drives (If Needed): If you add new drives and want to encrypt them, you can use cryptsetup to encrypt the partitions:
# sudo cryptsetup luksFormat /dev/sdX
# sudo cryptsetup open /dev/sdX encrypted_partition

#? Enable UFW Logging: You can enable firewall logging for more visibility into what’s being blocked:
sudo ufw logging on
