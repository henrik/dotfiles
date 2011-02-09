if test -n "$SSH_CONNECTION"; then
  # Over SSH.
  export EDITOR='vim'
  export GIT_EDITOR='vim'
  export RAILS_ENV='production'
else
  # Not over SSH.
  export EDITOR='mvim -f'
  export GIT_EDITOR='vim'
fi
