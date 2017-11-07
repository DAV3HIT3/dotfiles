
# ---------------------------------------------
# GIT aliases and shortcuts
# ---------------------------------------------

# Gba - List all (local & remote) branches
alias Gb='git branch -a'

# Gd - git diff
alias Gd='git diff'

# Gl - Show git log (current branch) with tags
alias Gl='git log --decorate'

# Glcf - Git log commit files - list all files in a commit 
# INTPUT $!: hash
function Glcf(){
    git diff-tree --no-commit-id --name-only -r $1
}

# Glg - git log graph
alias Glg='git log --graph --oneline --decorate --all'

# Gld - git log date
alias Gld='git log --pretty=format:"%h %ad %s" --date=short --all --decorate'

# Gs - git status
alias Gs='git status'

# Gt - Show "current" tag
alias Gt='git describe --tags'

alias Gta='git log --tags --decorate --simplify-by-decoration --oneline'

alias Gtg='git log --graph --decorate --simplify-by-decoration --oneline --all'
