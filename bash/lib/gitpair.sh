# Simple git pair. Like "hitch" but simpler/less buggy for me. WiP.
# Also see prompt.sh.

alias pair='echo "Committing as: `git config user.name` <`git config user.email`>"'
alias unpair="git config --remove-section user 2> /dev/null; echo Unpaired.; pair"

alias pairj="git config user.pair 'HN+JK' && git config user.name 'Henrik Nyh and Joakim Kolsjö' && git config user.email 'all+henrik+jocke@barsoom.se'; pair"
alias pairk="git config user.pair 'HN+KP' && git config user.name 'Henrik Nyh and Kim Persson' && git config user.email 'all+henrik+kim@barsoom.se'; pair"
alias pairt="git config user.pair 'HN+TS' && git config user.name 'Henrik Nyh and Tomas Skogberg' && git config user.email 'all+henrik+tomas@barsoom.se'; pair"
