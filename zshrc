# vim:ft=zsh:fdm=marker

# Path to your oh-my-zsh installation.
export ZSH=/Users/jason/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
PATH="/usr/local/mysql/bin/:/usr/local/sbin/:/usr/local/opt/go/libexec/bin/:/Library/Frameworks/Python.framework/Versions/3.5/bin/:$PATH"
# Homebrew GNU utils override default BSD utils 
PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/gnu-tar/libexec:$PATH"

# DCSS alias
[ -f '/Applications/Dungeon\ Crawl\ Stone\ Soup\ -\ Console.app/Contents/Resources/crawl' ] && alias crawl='/Applications/Dungeon\ Crawl\ Stone\ Soup\ -\ Console.app/Contents/Resources/crawl'

source ~/Projects/c3e/zsh/c3e-zsh.sh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
