source ~/.bash/path.sh
source ~/.bash/env.sh

# Create/reattach a tmux session.
if [[ "$TERM" != "screen-256color" ]]; then
  tmux attach-session -t "$USER" || tmux new-session -s "$USER"
  exit
fi

source ~/.bash/aliases.sh
source ~/.bash/functions.sh
source ~/.bash/prompt.sh
