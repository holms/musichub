SHELL:=/bin/bash


install:
	sudo port -v install curl curl-ca-bundle wget python27 py27-pip gnupg
	sudo port -v install openssh +ssh_copy_id
	sudo port select --set python python27
	sudo port select --set pip pip27
	sudo pip -v install --upgrade pip
	sudo pip -v install docker-compose pyyaml

install_xenial:
	sudo apt-get install -y --no-install-recommends linux-image-extra-$(uname -r) linux-image-extra-virtual apt-transport-httpsi \
	   	ca-certificates curl software-properties-common git wget python2.7 python-dev python-pip gnupg
	curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -
	sudo add-apt-repository "deb https://apt.dockerproject.org/repo/ ubuntu-$(lsb_release -cs) main"
	sudo apt-get update
	sudo apt-get -y install docker-engine
	sudo service docker start
	-sudo groupadd docker
	-sudo gpasswd -a ${USER} docker
	sudo service docker restart
	sudo pip install --upgrade pip
	sudo pip install docker-compose

install_jessie:
	sudo apt install -y curl git wget python2.7 python-dev python-pip gnupg apt-transport-https ca-certificates
	sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
	sudo bash -c 'echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list'
	sudo apt-get update
	sudo apt-get install -y docker-engine
	sudo service docker start
	-sudo groupadd docker
	-sudo gpasswd -a ${USER} docker
	sudo service docker restart
	sudo pip install --upgrade pip
	sudo pip install docker-compose

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

