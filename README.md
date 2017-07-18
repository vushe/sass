# docker-sass

Two ways to use this docker image from command line:

 sass command help
docker run -d --rm sass -h

1- Working like sass -watch:

docker run -d -e "ENV=watch" --name sass -v $PWD:/app/  pablofelix/sass

requirements -> to have a file called style.scss and a directory called css

if you are a mac user-> $PWD must begin with /Users/


2- Using image as a sass command

docker run --rm -v $(pwd):$(pwd) -w $(pwd) pablofelix/sass <<whatever.scss>>

maybe you want to save the css file:

docker run --rm -v $(pwd):$(pwd) -w $(pwd) pablofelix/sass whatever.scss  > whatever.css
