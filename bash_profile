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

if [[ "$DEVBOX" ]]; then
  # Auctionet's "Devbox" tool is quite coupled to RVM currently.
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
else
  # For the "asdf" extendable version manager (https://github.com/asdf-vm/asdf).
  . ~/.asdf/asdf.sh
  . ~/.asdf/completions/asdf.bash
fi

export WMSJAVA_HOME="/Library/WowzaStreamingEngine-4.7.0/java"
