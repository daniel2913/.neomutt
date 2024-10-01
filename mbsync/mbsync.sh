#!/usr/bin/bash

killall mbsync &>/dev/null

for i in $(find $HOME/.config/mbsync/accounts -type f -not -name 'example'); do
	mbsync -c $i -a &
done
wait

for i in $(find $HOME/.mail/ -maxdepth 1 -mindepth 1 -type d); do
	echo $i
	new="$(find $i/INBOX/new -type f | wc -l)"
	if [ "$new" -gt 0 ]; then
		notify-send -a "Mail" "$(printf "$(basename $i): $new")" 
	fi
done
