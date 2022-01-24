#  Apple's command-line tools
xcode-select --install

# Install rosetta
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

which -s brew
if [[ $? != 0 ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    
    brew update && brew upgrade
    brew install python ansible
fi

which -s ansible
if [[ $? != 0 ]] ; then
    brew install ansible
fi

# use installed python (not default from OS)
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

ansible-playbook init.yml
