echo "";

#  Apple's command-line tools
if type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
   test -d "${xpath}" && test -x "${xpath}" ; then
   echo 'Apple Command-line tools already installed'
else
   xcode-select --install
   # Enable command line tools
   sudo xcode-select --switch /Library/Developer/CommandLineTools
fi


# Install rosetta
/usr/bin/pgrep -q oahd && echo 'Rosetta already installed' || /usr/sbin/softwareupdate --install-rosetta --agree-to-license

# install homebrew
which -s brew
if [[ $? != 0 ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

    brew update && brew upgrade

    # install required dependecies
    brew install python ansible
fi

# install ansible
which -s ansible
if [[ $? != 0 ]] ; then
    brew install ansible
fi

# use installed python (not default from OS)
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

ansible-playbook init.yml
