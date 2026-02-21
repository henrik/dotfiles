Usage:

```
ln -s ~/.dotfiles/bin/launchd/com.user.ssh-sound-server.plist ~/Library/LaunchAgents/com.user.ssh-sound-server.plist
launchctl load ~/Library/LaunchAgents/com.user.ssh-sound-server.plist

launchctl stop com.user.ssh-sound-server   # Restart (KeepAlive brings it back),
launchctl unload ~/Library/LaunchAgents/com.user.ssh-sound-server.plist  # Disable.
launchctl load ~/Library/LaunchAgents/com.user.ssh-sound-server.plist    # Re-enable.
```
