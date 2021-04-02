# OS X only:
# "o file.txt" = open file in default app.
# "o http://example.com" = open URL in default browser.
# "o" = open pwd in Finder.

function o {
  open ${@:-'.'}
}


# "git commit only"
# Commits only what's in the index (what's been "git add"ed).
# When given an argument, uses that for a message.
# With no argument, opens an editor that also shows the diff (-v).

function gco {
  if [ -z "$1" ]; then
    git commit -v
  else
    git commit -m "$1"
  fi
}


# "git commit all"
# Commits all changes, deletions and additions.
# When given an argument, uses that for a message.
# With no argument, opens an editor that also shows the diff (-v).

function gca {
  git add --all && gco "$1"
}


# "git get"
# Clones the given repo and then cd:s into that directory.
function gget {
  git clone $1 && cd $(basename $1 .git)
}


# Print working file.
#
#     henrik@Henrik ~/.dotfiles[master]$ pwf ackrc
#     /Users/henrik/.dotfiles/ackrc

function pwf {
  echo "$PWD/$1"
}


# Create directory and cd to it.
#
#     henrik@Nyx /tmp$ mcd foo/bar/baz
#     henrik@Nyx /tmp/foo/bar/baz$

function mcd {
  mkdir -p "$1" && cd "$1"
}


# SSH to the given machine and add your id_rsa.pub or id_dsa.pub to authorized_keys.
#
#     henrik@Nyx ~$ sshkey hyper
#     Password:
#     sshkey done.

function sshkey {
  ssh $1 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys" < ~/.ssh/id_?sa.pub  # '?sa' is a glob, not a typo!
  echo "sshkey done."
}


# Attach or create a tmux session.
#
# You can provide a name as the first argument, otherwise it defaults to the current directory name.
# The argument tab completes among existing tmux session names.
#
# Example usage:
#
#   tat some-project
#
#   tat s<tab>
#
#   cd some-project
#   tat
#
# Based on https://github.com/thoughtbot/dotfiles/blob/master/bin/tat
# and http://krauspe.eu/r/tmux/comments/25mnr7/how_to_switch_sessions_faster_preferably_with/

function tat() {
  session_name=`basename ${1:-$PWD}`
  session_name=${session_name/auctionet_/an_}
  session_name=${session_name//\./_}
  tmux new-session -As "$session_name"
}

function _tmux_complete_session() {
  local IFS=$'\n'
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( ${COMPREPLY[@]:-} $(compgen -W "$(tmux -q list-sessions | cut -f 1 -d ':')" -- "${cur}") )
}
complete -F _tmux_complete_session tat
