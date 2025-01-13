# -Resource-Management-with-cgroups
## 1. Running a Container with Resource Limits.
While launching a Docker container using the `docker run` command, you can specify resource constraints(cpu and memory limits) directly.  
In order to simulate  heavy CPU and memory usage, we use the `polinux/stress` Docker image  which provides a pre-built environment for running stress tests.
The following command 
```sh
 docker run -itd --name cgroups --memory="512M" --cpus .25  polinux/stress bash

```
To have an interactive shell we run the command 
```sh
 docker exec -it cgroups bash
```
## 2.Simulating heavy CPU and MEMORY usage using the stress utility in the docker container.

let’s stress our system using the stress utility. We'll simulate CPU usage to 50% ,then memory usage to 1GB, during 1 minute .
```
stress --cpu 1 --io 1 --vm 1 --vm-bytes 600M --timeout 60s --verbose > h &
```
- CPU Stress: The --cpu 1 option specifies that one  CPU core should be stressed.
- I/O Stress: The --io 1 option specifies that one I/O-bound process should be stressed.
- Virtual Memory Stress: The --vm 1 option specifies that one virtual memory allocator process should be stressed, with --vm-bytes 1024M allocating 1024 megabytes of virtual memory for the test.
- Timeout: The --timeout 60s option sets the test duration to 60 seconds.
- Verbose Output: The --verbose option enables detailed output during the test, providing more information about the stress test’s progress and results.
﻿
3. A
