# Simple git pair. Like "hitch" but simpler/less buggy for me.
# Also see prompt.sh.

getpair() { echo "`git config user.name` <`git config user.email`>"; }

alias pair='echo Committing as: `getpair`'
alias unpair="git config --remove-section user 2> /dev/null; echo Unpaired.; pair"

# Amend the last commit with the current pair (when you forget to set the pair until after committing.)
alias pair!='git commit --amend -C HEAD --author="`getpair`"; git show --format="Author: %an <%ae>" --quiet'

setpair() { git config user.pair "$1" && git config user.email "$2" && git config user.name "$3"; pair; }

# Add one of these for every pair. Each pair should be in alphabetical order by first name.
alias pairj='setpair  HN+JK  all+henrik+jocke@barsoom.se   "Henrik Nyh and Joakim Kolsjö"'
alias pairk='setpair  HN+KP  all+henrik+kim@barsoom.se     "Henrik Nyh and Kim Persson"'
alias pairt='setpair  HN+TS  all+henrik+tomas@barsoom.se   "Henrik Nyh and Tomas Skogberg"'
alias pairv='setpair  HN+VA  all+henrik+victor@barsoom.se  "Henrik Nyh and Victor Arias"'
