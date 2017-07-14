FROM alpine

RUN		apk --update add --no-cache git build-base libstdc++\
      && git clone https://github.com/sass/sassc
      && exec /sassc/git clone https://github.com/sass/libsass
      && SASS_LIBSASS_PATH=/sassc/libsass make \
      && mv bin/sassc /usr/bin/sass
      && rm -rf /sassc
      && apk del git build-base

      ENTRYPOINT [ "sass", "--watch" ]
