#!/bin/bash

DIR=$(pwd)

rm_containers() 
{
	# remove all containers
	docker stop $(docker ps -a -q)
	docker rm -f $(docker ps -a -q)
}

rm_images()
{
	# Delete all images
	docker rmi $(docker images -q)
}

golang() 
{
	cd $DIR/services/go && docker build --rm -t teamplatform/go .
}

mysql() 
{
	# manbearpiglet on 6666
	cd $DIR/services/dbs/mysql

	MYSQL_ID=$(docker build --rm -t mysql .)
	MYSQL_IP=`echo $(docker inspect $MYSQL_IP) | python -c 'import json,sys;obj=json.load(sys.stdin);print obj[0]["NetworkSettings"]["IPAddress"]'`

	docker run --name mysql -d -p 3306:3306 mysql

	#mysql -u admin -p -h $IP
}

rabbitmq()
{
	docker pull networld/rabbitmq
	RABBIT_ID=$(docker run --name rabbitmq -d -p 5672:5672 -p 15672:15672 networld/rabbitmq)
	RABBIT_IP=`echo $(docker inspect $RABBIT_IP) | python -c 'import json,sys;obj=json.load(sys.stdin);print obj[0]["NetworkSettings"]["IPAddress"]'`
}

memcached()
{
	docker pull tatum/memcached
	MEMCACHED_ID=$(docker run --name memcached -d -p 11211:11211 tutum/memcached)
	MEMCACHED_IP=`echo $(docker inspect $MEMCACHED_IP) | python -c 'import json,sys;obj=json.load(sys.stdin);print obj[0]["NetworkSettings"]["IPAddress"]'`

}

mongodb()
{
	# Mongodb on 27017
	docker pull dockerfile/mongodb
	MONGO_ID=$(docker run --name mongodb -d -p 27017:27017 -p 28017:28017 dockerfile/mongodb --rest)
	MONGO_IP=`echo $(docker inspect $MONGO_ID) | python -c 'import json,sys;obj=json.load(sys.stdin);print obj[0]["NetworkSettings"]["IPAddress"]'`

	# cli
	docker run -i --rm -t --entrypoint="mongo" dockerfile/mongodb

	# persist
	#docker run -d -p 27017:27017 -v <data-dir>:/data dockerfile/mongodb
}

redis() 
{
	# Redis on 6379
	docker pull dockerfile/redis
	REDIS_ID=$(docker run -d --name redis -p 6379:6379 dockerfile/redis)
	REDIS_IP=`echo $(docker inspect $REDIS_ID) | python -c 'import json,sys;obj=json.load(sys.stdin);print obj[0]["NetworkSettings"]["IPAddress"]'`

	# with persistent data dir
	#docker run -d -p 6379:6379 -v <data-dir>:/data --name redis dockerfile/redis
	# cli
	docker run -i -t --rm --link redis:redis dockerfile/redis bash -c 'redis-cli -h $REDIS_PORT_6379_TCP_ADDR'
}

jenkins()
{
	# Jenkins on 8080
	docker pull orchardup/jenkins
	JENKINS_ID=$(docker run --name jenkins -p 8080:8080 orchardup/jenkins)
	JENKINS_IP=`echo $(docker inspect $JENKINS_ID) | python -c 'import json,sys;obj=json.load(sys.stdin);print obj[0]["NetworkSettings"]["IPAddress"]'`
}

influxdb() 
{
	docker pull fujin/influxdb
}
