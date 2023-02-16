# Bash completion for git commands and branch names.
. ~/.dotfiles/bash/lib/git-completion.sh

# Rake task completion.
complete -C ~/.bash/lib/rake-completion.rb -o default rake
