export EDITOR='vim'

if test -n "$SSH_CONNECTION"; then
  # Over SSH.
  export RAILS_ENV='production'
fi
