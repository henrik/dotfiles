# A little server to run on a Mac host and play sound on request e.g. from Claude via a port-forwarding SSH session like:
# ssh -R 19998:localhost:19998 some-server
#
# Inspired by https://www.peonping.com/.

echo "Starting SSH sound server on port 19998..."

while true; do
  request=$(echo -e "HTTP/1.1 200 OK\r\n" | nc -l 19998)
  if echo "$request" | grep -q "GET /done"; then
    echo "done"
    afplay -v 0.5 /Users/henrik/.claude/sounds/SND01_sine/transition_up.wav &
  elif echo "$request" | grep -q "GET /ask"; then
    echo "ask"
    afplay -v 0.5 /Users/henrik/.claude/sounds/SND01_sine/transition_down.wav &
  else
    echo "Unknown request: $request"
  fi
done

