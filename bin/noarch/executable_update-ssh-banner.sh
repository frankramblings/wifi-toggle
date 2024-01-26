#!/bin/bash
# Get random quote, format and update /etc/issue.net for SSH banner
# Written 19 Jan 2024

## TODO

#QUOTE_URL="http://172.16.1.42:5173/api/random/quote"
QUOTE_URL="https://adam.nz/api/quote?id=random"
BANNER_FILE="/etc/issue.net"

if [ "$1" == "debug" ]; then
  DEBUG="yes"
  echo "DEBUG: on" 1>&2
fi

# sets final exit code as failure if any step in pipeline fails
set -o pipefail
if ! QUOTE=$(curl --silent --fail "$QUOTE_URL" | \
    # decoding entites in api now #python3 -c "import html, sys; print(html.unescape(sys.stdin.read()))" | \
    fmt -w 60 | \
    boxes -p h2v1 -d stone -a r); then
  echo "error: downloading and formatting quote" 1>&2
  exit 1
fi

if [ ! -w "$BANNER_FILE" -a -z "$DEBUG" ]; then
  echo "error: can't write to $BANNER_FILE" 1>&2
  exit 1
fi

if [ -n "$DEBUG" ]; then
  echo -e "\n$QUOTE\n"
else
  echo -e "\n$QUOTE\n" > $BANNER_FILE
fi
