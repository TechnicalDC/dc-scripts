#!/usr/bin/env bash

TEMPFILE=/tmp/helpme.tmp
NOTIFY_SUMMARY="Help Me"
NOTIFY_BODY=""

grep bind.\*exec $HOME/.config/hypr/hyprland.conf | cut -d= -f2 | column -t -s ',' -o ' |' | tr ' ' '_' > $TEMPFILE

# NOTE: IFS= is not working to preventing from trimming the text
while IFS= read -r LINE; do
	NOTIFY_BODY="$NOTIFY_BODY\n$( echo $LINE | tr '_' ' ' )"
done < "$TEMPFILE"

notify-send "$NOTIFY_SUMMARY" "$NOTIFY_BODY"
