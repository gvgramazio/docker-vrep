# docker-vrep
A docker image with V-REP simulator.

## Prerequisites
Docker on your host.

## Start the container
You could launch the container with `docker run -it --name vrep gvgramazio/vrep`.
Lanching V-REP without screen would fail even if in headless mode.
To avoid this, launch V-REP through `xvfb-run`.
