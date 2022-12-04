PORT=5000

all: run

build:
	docker build -t nginx-git .

run: build
	docker run -p ${PORT}:80 -v ${PWD}/git:/git nginx-git
