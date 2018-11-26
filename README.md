# docker-redis-cluster

`docker-redis-cluster` is a docker image containing a 6 node redis cluster. There will be three master nodes running on ports `6379`, `6380`, and `6381` and three slave nodes running on ports `6382`, `6383`, and `6384`.

The docker image that this creates has only been tested in low traffic environments. Currently, I have no idea how this will hold up in a production environment.

**This image can be found on Dockerhub [here](https://hub.docker.com/r/atetnowski/redis-cluster/)**
<!-- TODO: More README coming soon -->
