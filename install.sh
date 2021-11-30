read -p "Did you created an ssh key and added it to all services? press 'Y' or 'y' to continue " -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]; then
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [ -f /etc/debian_version ] ; then
      source ./debian.sh
    fi
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    source ./macos.sh
  fi
fi
