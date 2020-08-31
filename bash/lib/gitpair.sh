# Simple git pair. Like "hitch" but simpler/less buggy for me.
# Also see prompt.sh.

getpair() { echo "`git config user.name` <`git config user.email`>"; }

alias pair='echo Committing as: `getpair`'
alias unpair="git config --remove-section user 2> /dev/null; echo Unpaired.; pair"

# Amend the last commit with the current pair (when you forget to set the pair until after committing.)
alias pair!='git commit --amend -C HEAD --author="`getpair`"; git show --format="Author: %an <%ae>" --quiet'

setpair() { git config user.pair "$1" && git config user.email "$2" && git config user.name "$3"; pair; }

# Add one of these for every pair.
# For pair commits, use plus addressing with the exact GitHub username. Our review tool relies on this.
# Each pair should be in alphabetical order: by username in the email, and by first name in the name string.
# (The order of the abbreviated names shown in the prompt is completely up to you.)
alias paira='setpair  AR+HN  devs+henrik+soma@auctionet.com  "Albert Ramstedt and Henrik Nyh"'
alias pairap='setpair  AR+HN+PW  devs+henrik+peter+soma@auctionet.com   "Albert Ramstedt and Henrik Nyh and Peter Wall"'
alias pairj='setpair  HN+JK  devs+henrik+joakimk@auctionet.com   "Henrik Nyh and Joakim Kolsjö"'
alias pairp='setpair  HN+PW  devs+henrik+p-wall@auctionet.com   "Henrik Nyh and Peter Wall"'
alias pairpt='setpair  HN+PW+TS  devs+henrik+p-wall+tskogberg@auctionet.com   "Henrik Nyh and Peter Wall and Tomas Skogberg"'
alias pairjt='setpair  HN+JK+TS  devs+henrik+joakimk+tskogberg@auctionet.com   "Henrik Nyh and Joakim Kolsjö and Tomas Skogberg"'
alias pairt='setpair  HN+TS  devs+henrik+tskogberg@auctionet.com   "Henrik Nyh and Tomas Skogberg"'
alias pairl='setpair  HN+LF  devs+devl+henrik@auctionet.com  "Henrik Nyh and Lennart Fridén"'
alias pairc='setpair  CE+HN  devs+calleerlandsson+henrik@auctionet.com  "Calle Erlandsson and Henrik Nyh"'
alias pairo='setpair  HN+OJ  devs+henrik+olleolleolle@auctionet.com  "Henrik Nyh and Olle Jonsson"'
alias pairop='setpair  HN+OJ+PW  devs+henrik+olleolleolle+p-wall@auctionet.com  "Henrik Nyh and Olle Jonsson and Peter Wall"'
alias pairmob='setpair MOB devs@auctionet.com "Mob"'
