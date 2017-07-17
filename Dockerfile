FROM alpine

RUN		apk update \
      && apk add --no-cache git build-base libstdc++ inotify-tools\
      && git clone https://github.com/sass/sassc\
      && cd /sassc/ \
      && git clone https://github.com/sass/libsass\
      && SASS_LIBSASS_PATH=/sassc/libsass make \
      && mv bin/sassc /usr/bin/sass\
      && rm -rf /sassc\
      && apk del git build-base

LABEL maintainer="pablofelix@coomars.com"\
      version="2.0"\
      description="sass image with shell watcher"

COPY $PWD/watch.sh /usr/bin/watch

CMD [ "watch"]
