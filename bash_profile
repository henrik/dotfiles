[[ -s ~/.profile ]] && source ~/.profile

# Work environment: https://github.com/barsoom/bs
[[ -s "$HOME/.bs/profile" ]] && source "$HOME/.bs/profile"

source ~/.bash/path.sh
source ~/.bash/env.sh
source ~/.bash/completion.sh

source ~/.bash/aliases.sh
source ~/.bash/functions.sh
source ~/.bash/prompt.sh

source ~/.bash/lib/gitpair.sh

# For the "asdf" extendable version manager (https://github.com/asdf-vm/asdf).
. ~/.asdf/asdf.sh
. ~/.asdf/completions/asdf.bash
