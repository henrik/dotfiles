#!/usr/bin/env bash

# Opens URLs (e.g. auth URLs) automagically when they show up in iTerm2, via triggers: https://iterm2.com/triggers.html
# Only open unique URLs once since the detection can trigger multiple times otherwise.
#
# iTerm setup:
# - Go to Preferences > Profiles > (select profile) > Advanced > Triggers
# - Add a new trigger with:
#  - Regular expression: Here's your code: (https://my\.exampleauth\.com/auth\?code=\S+)
#  - Action: Run Command
#  - Parameters: ~/.bin/iterm_trigger_open_url.sh "\1"
#  - Don't check "Instant"

url="$1"
[ -z "$url" ] && exit 0

script_name=$(basename "$0" .sh)
cache_dir="/tmp/${script_name}"
mkdir -p "$cache_dir"

# Use a hash of the URL as the filename to avoid path-character issues.
key=$(echo -n "$url" | md5sum | cut -d' ' -f1)

[ -f "$cache_dir/$key" ] && exit 0

touch "$cache_dir/$key"
open "$url"
