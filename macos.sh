#  Apple's command-line tools
xcode-select --install

which -s brew
if [[ $? != 0 ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
