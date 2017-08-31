# Source user bashrc (if present)
# shellcheck disable=SC1090
[[ -f ~/.bashrc ]] && . ~/.bashrc

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
