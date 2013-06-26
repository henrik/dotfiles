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
  [ -z "$1" ] && git commit -v || git commit -m "$1"
}


# "git commit all"
# Commits all changes, deletions and additions.
# When given an argument, uses that for a message.
# With no argument, opens an editor that also shows the diff (-v).

function gca {
  git add --all && gco "$1"
}


# cd gem
#
#     henrik@Nyx ~$ cdgem thor
#     henrik@Nyx ~/.rvm/gems/ree-1.8.7-2010.02/gems/thor-0.14.6$

function cdgem {
  cd `rvm gemdir`/gems; cd `ls|grep $1|sort|tail -1`
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

# Open the .xcodeproj file from the working directory (typically in Xcode).
# These are equivalent:
#
#     henrik@Nyx ~/MyApp$ open MyApp.xcodeproj
#     henrik@Nyx ~/MyApp$ xc

function xc {
  open `ls | grep .xcodeproj`
}
