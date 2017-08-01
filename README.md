# docker-sass

Two ways to use this docker image from command line:

sass command help

docker run -d --rm sass -h

1- Working like sass -watch, will create two directories sass and css also will create a main file called style.scss if you haven't in your path. style.scss will be project's main file for scss:

docker run -d  --name sass -v $PWD:/app/  pablofelix/sass watch

if you are a mac user-> $PWD must begin in /Users/ directory


2- Using image as a sass command

docker run --rm -v $(pwd):$(pwd) -w $(pwd) pablofelix/sass <<whatever.scss>>

maybe you want to save the css file:

docker run --rm -v $(pwd):$(pwd) -w $(pwd) pablofelix/sass whatever.scss  > whatever.css

or

docker run --rm -v $(pwd):$(pwd) -w $(pwd) pablofelix/sass whatever.scss whatever.css
