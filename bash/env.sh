export EDITOR='vim'

# For e.g. "bundle open activerecord"
export BUNDLER_EDITOR='mvim'

if test -n "$SSH_CONNECTION"; then
  # Over SSH.
  export RAILS_ENV='production'
fi
