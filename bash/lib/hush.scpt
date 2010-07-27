#!/usr/bin/env osascript

if appIsRunning("iTunes") then
  tell app "iTunes" to pause
end if

if appIsRunning("Spotify") then
  tell app "Spotify" to quit -- since we can't pause it, only play/pause.
end

if appIsRunning("Airfoil") then
  tell app "Airfoil" to disconnect from every speaker
end

on appIsRunning(appName)
	tell application "System Events" to (name of processes) contains appName
end appIsRunning
