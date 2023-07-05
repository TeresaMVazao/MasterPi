# MasterPi

The MasterPi is the process that was designed, in the context of my master thesis, to communicate with the [InteractionPi]() processes running on Raspberry Pi's. This process has the main responsability of orchestrating the InteractionPi's in order to create a game composed of the several interactions running on the InteractionPi's. The MasterPi also allows the management of the several InteractionPi's and get access to their interfaces without the need to directly connecting to the Raspberry Pi's where the InteractionPi process's are running.

When talking about the games that were developed for this infrastructure, the MasterPi allows to configure the game setup and monitor its progress when its ongoing. It is also from here that actions on the game can be made. These actions go from starting, stopping and pausing the game as well as getting a more detailed view of what are the generated solutions for the game and the status of it in real time.

# Setup Instructions

1. Install docker and docker-compose in your computer.
    - Check the [vendor site](https://docs.docker.com/engine/install/) for more information
2. You can check docker is properly installed by running:
    `docker version`
3. Ensure you have `java` installed (1.8 is the minimum version) in your computer.

# How to run

There is a Makefile with instructions to run specific actions. E.g. running a local version of the web server with a MySQL database can be accomplish by running: `make launch_server`

# Relevant Notes

## Hardcoded variables

The user and password are hardcoded in two places:
    
- In the docker-compose file
- In the `src/main/resources/application.properties`

At this moment, if you want to change any of the credentials (user and/or password) you will need to update both files and restart the application.

## Database operations

The database is running in a docker container. You can attach your current shell to the container by running the following command:

    docker exec -it $(docker ps | grep masterpi-db | awk '{print $1}') /bin/bash