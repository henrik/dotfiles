[[ -s ~/.profile ]] && source ~/.profile

# Work environment: https://github.com/barsoom/bs
[[ -s "$HOME/.bs/profile" ]] && source "$HOME/.bs/profile"
# Expected by https://github.com/barsoom/devbox: https://auctionet.slack.com/archives/CF9SAN79V/p1552987988719300, https://auctionet.slack.com/archives/CF9SAN79V/p1553006327787000?thread_ts=1552987988.719300&cid=CF9SAN79V
[[ -s "$HOME/.shell_local" ]] && source "$HOME/.shell_local"

# Fuzzy file finder used by Vim: https://github.com/junegunn/fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

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
  . $(brew --prefix asdf)/asdf.sh
fi

export WMSJAVA_HOME="/Library/WowzaStreamingEngine-4.7.0/java"

# Stop macOS from saying zsh is the new default.
export BASH_SILENCE_DEPRECATION_WARNING=1

# nvm (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
