Usage:

```
ln -s ~/.dotfiles/bin/launchd/com.user.ssh-sound-server.plist ~/Library/LaunchAgents/com.user.ssh-sound-server.plist
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.user.ssh-sound-server.plist

# Restart.
launchctl kickstart -k gui/$(id -u)/com.user.ssh-sound-server

# Disable.
launchctl bootout gui/$(id -u)/com.user.claude-sound-server
```
