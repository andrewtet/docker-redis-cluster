#!/bin/bash

# This file is a modified version of create-cluster.sh from the official Redis repo
# Original file can be found here https://github.com/antirez/redis/blob/unstable/utils/create-cluster/create-cluster

# Settings
START_PORT=6379
PORT=$START_PORT
TIMEOUT=2000
NODES=6
REPLICAS=1

# Computed vars
ENDPORT=$((PORT+NODES))
HOSTS=""

# Loop to create individual redises
while [ $((PORT < ENDPORT)) != "0" ]; do
    echo "Starting $PORT"
    redis-server --port $PORT --cluster-enabled yes --cluster-config-file nodes-${PORT}.conf --cluster-node-timeout $TIMEOUT --appendonly yes --appendfilename appendonly-${PORT}.aof --dbfilename dump-${PORT}.rdb --logfile ${PORT}.log --daemonize yes
    HOSTS="$HOSTS 127.0.0.1:$PORT"
    PORT=$((PORT+1))
done

# Uses redis cli to link the redis created above into a cluster
echo "yes" | redis-cli --cluster create $HOSTS --cluster-replicas $REPLICAS

# Prints some info about the cluster
redis-cli --cluster check 127.0.0.1:$START_PORT

# Tails logs for all the redises
tail -f *.log
