# Fix "Sorry, command-not-found has crashed!" on Ubuntu in Vagrant.
# http://superuser.com/a/468792
unset command_not_found_handle

source ~/.bash/path.sh
source ~/.bash/env.sh
source ~/.bash/completion.sh

source ~/.bash/aliases.sh
source ~/.bash/functions.sh
source ~/.bash/prompt.sh
