# OS X only:
# "o file.txt" = open file in default app.
# "o http://example.com" = open URL in default browser.
# "o" = open pwd in Finder.
function o {
  open ${@:-'.'}
}

# cd gem
#
#     henrik@Nyx ~$ cdgem thor
#     henrik@Nyx ~/.rvm/gems/ree-1.8.7-2010.02/gems/thor-0.14.6$

#
function cdgem {
  cd `rvm gemdir`/gems; cd `ls|grep $1|sort|tail -1`
}


# Print working file.
#
#     henrik@Henrik ~/.dotfiles[master]$ pwf ackrc 
#     /Users/henrik/.dotfiles/ackrc
#
function pwf {
  echo "$PWD/$1"
}


# Create directory and cd to it.
#
#     henrik@Nyx /tmp$ mcd foo/bar/baz
#     henrik@Nyx /tmp/foo/bar/baz$
#
function mcd {
  mkdir -p "$1" && cd "$1"
}


# SSH to the given machine and add your id_rsa.pub or id_dsa.pub to authorized_keys.
#
#     henrik@Nyx ~$ sshkey hyper
#     Password:
#     sshkey done.

function sshkey {
  ssh $1 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys" < ~/.ssh/id_?sa.pub
  echo "sshkey done."
}

# "SCP home". Lets you scp to a remote server, then do e.g. "cd /sub/dir; scph file.txt" to the same
# effect as switching to your local machine and running "scp remote:/sub/dir/file.txt ~/Downloads/".
#
# The remote must, of course, define this function, and must forward its port 2222 to your local 22,
# e.g. with this at the top of your local ~/.ssh/config:
#
#   RemoteForward 2222 localhost:22

function scph {
  scp -P2222 $@ henrik@localhost:Downloads/
}


# Open the .xcodeproj file from the working directory (typically in Xcode).
#
#     henrik@Nyx ~/Code/iPhone/MyApp$ xc
#     # equivalent to:
#     open ~/Code/iPhone/MyApp/MyApp.xcodeproj
#
function xc {
  open `ls | grep .xcodeproj`
}
