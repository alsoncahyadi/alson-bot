build:
	docker build -t alson-bot .

push:
	heroku container:push web

release:
	heroku container:release web

all:
	make build && make push && make release

run:
	docker run --name alson-bot -p 5000:5000 -e PORT=5000 --rm alson-bot:latest