# Simple git pair. Like "hitch" but simpler/less buggy for me. WiP.
# Also see prompt.sh.

alias pair='echo "Committing as: ${GIT_AUTHOR_NAME:-`git config user.name`} <${GIT_AUTHOR_EMAIL:-`git config user.email`}>"'
alias unpair="unset GIT_PAIR GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL; echo Unpaired.; pair"
alias pairj="export GIT_PAIR='HN+JK' GIT_AUTHOR_NAME='Henrik Nyh and Joakim Kolsjö' GIT_AUTHOR_EMAIL='all+henrik+jocke@barsoom.se'; pair"
