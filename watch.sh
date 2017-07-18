#!/bin/sh
set -e
#function watcher with inotify
if [ "$ENV" = 'watch' ]; then
		echo "Running watch script for sass"
		MONITORDIR="/app/"
		inotifywait -m -r -e modify,close_write,move,create,delete --format '%w%f' "/app/" | while read FILE_CHANGED

	do
			exec sass /app/style.scss /app/css/style.css --style compressed
	done
# exec sass with params
else
	exec sass $@
fi
