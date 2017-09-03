# vim:ft=zsh:fdm=marker

# Path to your oh-my-zsh installation.
export ZSH=/Users/jason/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
PATH="/usr/local/mysql/bin/:/usr/local/sbin/:/usr/local/opt/go/libexec/bin/:/Library/Frameworks/Python.framework/Versions/3.5/bin/:$PATH"
# Homebrew GNU utils override default BSD utils
PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

# MANPATH: path for the man command to search.
# Look at the manpath command's output and prepend
# my own manual paths manually (ahem).
if [[ ${+MANPATH} -eq 0 ]]
then
  # Only do this if the MANPATH variable isn't already set.
  if whence manpath >/dev/null 2>&1
  then
    # Get the original manpath, then modify it.
    MANPATH="`manpath`"
    manpath=(
      "$HOME/man"
      "$manpath[@]"
    )
  else
    # This list is out of date, but it will suffice.
    manpath=(
      "$HOME/man"
      /usr/local/opt/coreutils/libexec/gnuman
      /usr/local/opt/findutils/libexec/gnuman
      /usr/local/opt/gnu-sed/libexec/gnuman
      /usr/local/opt/gnu-tar/libexec/gnuman
    )
    rationalize-path manpath
  fi
  # And, as always, no duplicate entries are needed.
  typeset -U manpath
  export MANPATH
fi

# DCSS alias
[ -f '/Applications/Dungeon\ Crawl\ Stone\ Soup\ -\ Console.app/Contents/Resources/crawl' ] && alias crawl='/Applications/Dungeon\ Crawl\ Stone\ Soup\ -\ Console.app/Contents/Resources/crawl'

# [TODO] Don't load the bash prompt one.
source ~/Projects/c3e/zsh/c3e-zsh.sh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
