#!/bin/sh
set -e
# get the current path
if [ "$ENV" = 'watch' ]; then
		echo "Running watch script for sass"
		MONITORDIR="/app/"
		echo "${MONITORDIR}"
	inotifywait -m -r -e modify,close_write,move,create,delete --format '%w%f' "/app/" | while read FILE_CHANGED 

	do


					exec sass /app/style.scss /app/css/style.css --style compressed

			echo "style.css modificado"


	done
else
	exec sass -h
	echo "do nothing with sass"
fi
