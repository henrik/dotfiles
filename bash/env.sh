if test -n "$SSH_CONNECTION"; then
  # Over SSH.
  export EDITOR='vim'
  export GIT_EDITOR='vim'
else
  # Not over SSH.
  export EDITOR='mate_wait'
  export GIT_EDITOR='mate -wl1'
fi
