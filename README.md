# docker-adminer
Create a Docker container for running adminer (with mongo extensions)

The docker-compose.yml in this directory gives an idea how to link it with a Mongo database.

Launch an instance of the docker-adminer container, then navigate to the port it is running on.

To view a mongo database, you need to enter the container

    docker exec -it docker_adminer_instance bash

then, execute something

    root@a7b4e2b500e3:/# env | grep DB_PORT=
    DB_PORT=tcp://172.17.0.20:27017

to get the IP address of the linked container.  Put this ip:port number into the adminer interface, and you'll see your Mongo DB structure.
