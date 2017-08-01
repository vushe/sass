#!/bin/sh
set -e
#function watcher with inotify
if [ $@ = 'watch' ]; then
		echo "Running watch script for sass"
		if [  $( $( ls -d /app/*/ 2>/dev/null) | grep scss | wc -l) = 0 ]; then
			cd /app/ && mkdir scss && cd scss && touch style.scss
		fi
		if [ $( $( ls  /app/style.scss 2>/dev/null) | grep scss | wc -l) = 0 ];then
			touch style.scss
		fi
		if [ $( $(ls  -d /app/*/ 2>/dev/null) | grep css | wc -l) = 0 ]; then
			cd /app/ && mkdir css && cd css && touch style.css
		fi
                
		MONITORDIR="/app/"
		inotifywait -m -r -e modify,close_write,move,create,delete --format '%w%f' "/app/scss/" | while read FILE_CHANGED

	do
			exec sass /app/sass/style.scss /app/css/style.css --style compressed
	done
# exec sass with params
else
	exec sass $@
fi
