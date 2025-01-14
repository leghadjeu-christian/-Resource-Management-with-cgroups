#!/bin/bash
cat << EOF > Dockerfile
FROM  ubuntu:latest

RUN apt update
RUN apt install  procps
RUN apt install stress

CMD [ "vmstat" ]
EOF

docker build -t cgroupss .

docker run -itd --rm --name cgroups --memory="512M" --cpus .25  cgroupss bash
. ./script2.sh &
docker exec cgroups stress --cpu 1 --io 1 --vm 1 --vm-bytes 600M --timeout 60s --verbose 
. ./script2.sh &

