# cd gem
#
#     henrik@Nyx ~$ cdgem activerecord
#     henrik@Nyx /Library/Ruby/Gems/1.8/gems/activerecord-3.0.0.beta$
#
function cdgem {
  cd /Library/Ruby/Gems/1.8/gems/; cd `ls|grep $1|sort|tail -1`
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
#     henrik@Nyx /tmp$ mkcd foo/bar/baz
#     henrik@Nyx /tmp/foo/bar/baz$
#
function mkcd {
  mkdir -p "$1" && cd "$1"
}

# Open the .xcodeproj file that is in the working directory (typically in Xcode).
#
#     henrik@Nyx ~/Code/iPhone/MyApp$ xc
#     # equivalent to:
#     open ~/Code/iPhone/MyApp/MyApp.xcodeproj
#
function xc {
  open `ls | grep .xcodeproj`
}
