

if dpkg-query -W -f='${Status}' displaylink-driver 2>/dev/null | grep -q "install ok installed"; then
    echo "displaylink-driver is installed."
  else
    echo "displaylink-driver is not installed."
  fi