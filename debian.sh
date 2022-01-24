# TODO: refactor

sudo apt --fix-broken install -y
sudo dpkg --configure -a

sudo apt update -y
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y

sudo apt install python3 -y
sudo apt install software-properties-common -y

sudo add-apt-repository -y --update ppa:ansible/ansible
sudo apt install ansible -y

ansible-playbook init.yml

function post_install {
  # Set CAPS as ESC
  gnome-tweaks

  # Make google default browser
  sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/bin/google-chrome 500
  sudo update-alternatives --set x-www-browser /usr/bin/google-chrome

  1password
  # chrome will be installed on login
  firefox https://addons.mozilla.org/en-US/firefox/addon/1password-x-password-manager

  # Open default browser and go to websites we need to add as app
  sensible-browser http://www.tidal.com
  sensible-browser http://www.notion.so
  sensible-browser https://office.live.com/start/MyAccount.aspx
  sensible-browser https://web.whatsapp.com/

  # Install games
  sensible-browser https://lutris.net/games/overwatch/

  # Open apps to configure
  slack
  teams-for-linux

  # Install terminal theme
  ./.config/terminal-themes/dracula/install.sh
}
