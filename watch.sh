#!/bin/sh
set -e
#function watcher with inotify
if [ $@ = 'watch' ]; then
		echo "Running watch script for sass"
		if [  $( ls -d /app/*/  | grep sass | wc -l) 2>/dev/null = 0 ]; then
			echo "/sass/style.scss was created"
			cd /app/ && mkdir sass && cd sass && touch style.scss && chmod 751 -R /app/sass
		else	
			echo "styles.scss was detected in sass directory"
		fi
		if [ $(  ls  /app/sass/style.scss  | grep /app/sass/style.scss | wc -l) 2>/dev/null = 0 ];then
			echo "style.scss was created"
			cd /app/sass/ && touch style.scss && chmod 751 /app/sass/style.scss
		else
			echo "styles.scss was detected in sass directory"
		fi
		if [  $(ls  -d /app/*/ l | grep css | wc -l) 2>/dev/null = 0 ]; then
			echo "css directory was created"
			cd /app/ && mkdir css && chmod 751 -R /app/css
		else
			echo "css directory was detected"
		fi
                
		MONITORDIR="/app/"
		inotifywait -m -r -e modify,close_write,move,create,delete --format '%w%f' "/app/sass/" | while read FILE_CHANGED

	do
			exec sass /app/sass/style.scss /app/css/style.css --style compressed
	done
# exec sass with params
else
	exec sass $@
fi
