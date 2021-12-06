# dotfiles-ansible

The script will check if host Debian or Mac Os and setup it accordingly to my personal taste.
It will install and config all my favorite apps and command interfaces. To finish it all off Ubuntu and multiple apps will get Dracula theme (see `./config`).

## Screenshot
![Mac OS Iterm2 with nvim and tmux screenshot](https://raw.githubusercontent.com/R4YM3/dotfiles-ansible-refactor/main/screenshot.png)


## How to install

_Before install first setup SSH keys._

To install clone  repository
```
$ git clone git@github.com:R4YM3/dotfiles-ansible-refactor.git
```
cd into repository:
```
$ ./install.sh
```

## Shell
Files in the below mentioned folders are sourced in order of writing.

- ~/.config/exports
- ~/.config/config
- ~/.config/aliases
- ~/.config/plugins

_This makes it easy to add and maintain_

## Post install on MacOs
- Start nvim to which will automatically install plugins
- Iterm2: Import Dracula theme (~/.config/dracula)
- Iterm2: Set FireCode Nerd Font Mono as font
