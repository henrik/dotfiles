Usage:

```
ln -s ~/.dotfiles/bin/launchd/com.user.ssh-action-server.plist ~/Library/LaunchAgents/com.user.ssh-action-server.plist
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.user.ssh-action-server.plist

# Restart.
launchctl kickstart -k gui/$(id -u)/com.user.ssh-action-server

# Disable.
launchctl bootout gui/$(id -u)/com.user.ssh-action-server
```
