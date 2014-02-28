# Simple git pair. Like "hitch" but simpler/less buggy for me.
# Also see prompt.sh.

getpair() { echo "`git config user.name` <`git config user.email`>"; }

alias pair='echo "Committing as: `getpair`"'
alias unpair="git config --remove-section user 2> /dev/null; echo Unpaired.; pair"

# Amend the last commit with the current pair (when you forget to set the pair until after committing.)
alias pairamend='git commit --amend -C HEAD --author="`getpair`"'

setpair() { git config user.pair "$1" && git config user.name "$2" && git config user.email "$3"; pair; }

# Add one of these for every pair.
alias pairj='setpair  "HN+JK"  "Henrik Nyh and Joakim Kolsjö"   "all+henrik+jocke@barsoom.se"'
alias pairk='setpair  "HN+KP"  "Henrik Nyh and Kim Persson"     "all+henrik+kim@barsoom.se"'
alias pairt='setpair  "HN+TS"  "Henrik Nyh and Tomas Skogberg"  "all+henrik+tomas@barsoom.se"'
alias pairv='setpair  "HN+VA"  "Henrik Nyh and Victor Arias"    "all+henrik+victor@barsoom.se"'
