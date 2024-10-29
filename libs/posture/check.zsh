shell-posture-check() {
  # Check if UFW is active
  ufw_status=$(sudo ufw status | grep "Status: active")
  if [ -n "$ufw_status" ]; then
    echo "UFW Firewall: Active"
  else
    echo "UFW Firewall: Inactive"
  fi

  # Check if firewalld is active
  firewalld_status=$(sudo systemctl is-active firewalld)
  if [ "$firewalld_status" = "active" ]; then
    echo "firewalld: Active"
  else
    echo "firewalld: Inactive"
  fi

  # Check for LUKS encryption on partitions
  encrypted_partitions=$(lsblk -o NAME,FSTYPE | grep crypt)
  if [ -n "$encrypted_partitions" ]; then
    echo "LUKS Encryption: Active"
  else
    echo "LUKS Encryption: Not found"
  fi
}