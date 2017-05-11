# docker-training

git clone git@github.com:naseath-asia/docker-training.git ~/dev/docker/projects/docker-training

cd ~/dev/docker/projects/docker-training/

docker-compose build

docker-compose up -d

docker-compose run --rm db /usr/bin/mysql -h db -u root -proot training   < mysql-dump.sql

vim /etc/hosts
0.0.0.0 training.cs.docker

http://training.cs.docker
