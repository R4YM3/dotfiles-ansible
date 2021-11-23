
# Enable aliases to be sudo’ed
alias sudo='sudo '

# Clear completly
alias clr="clear && printf '\e[3J']'"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ~="cd ~" # `cd` is probably faster to type though

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

alias emptytrash="rm -rf ~/.local/share/Trash/*"
