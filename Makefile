SHELL:=/bin/bash



back-run:
	docker-compose -f compose.yml -f compose.dev.yml up backend

back-build:
	docker-compose -f compose.yml -f compose.dev.yml build backend

back-build-base:
	docker build -t holms/musichub_back_base:latest -f back/Dockerfile.dev.base back/
	docker login
	docker push holms/musichub_back_base:latest

destroy:
	-docker kill $(shell docker ps -q)
	-docker rm $(shell docker ps -a -q)
	-docker rmi -f $(shell docker images -q -f dangling=true)
	-docker rmi -f $(shell docker images -q)
	-docker volume ls -qf dangling=true | xargs docker volume rm
	-docker system prune -f

clean:
	-docker system prune -f

kill:
	-docker kill $(shell docker ps -q)

