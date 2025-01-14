# -Resource-Management-with-cgroups
## prerequisites:
- The user needs to have docker installed and working on his/her machine.

Steps to run the solution
1. clone this repository.
2. Run the `script.sh` making sure you have the necessary permissions.
3. Then analyse the performance results in the `stats.log` file as specified in the ananlyze section of this README file.
     
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
3. Analysing the results
  After running  script.sh the file `stats.log` was created which contains details on the performance of the container before during and after being under  resource-intensive stress which needed extreme resource consumption.
  - From the report below shows the resource usage(cpu and memory) before the container is beign stressed.
  ![stats before the container is stressed](https://github.com/Leghadjeu-Christian/-Resource-Management-with-cgroups/blob/main/Screenshot%20from%202025-01-14%2010-38-35.png)
  - The report below now shows the resources consumption of the container under and after being under stress.
- ![stats after the container is stressed](https://github.com/Leghadjeu-Christian/-Resource-Management-with-cgroups/blob/main/Screenshot%20from%202025-01-14%2010-39-05.png)
  we see that while beign under stress, the cpu resource percentage do not exceeds 25% which is the limit we initially set for the cpu percentage usage and the memory resource usage do not exceeds 528M which is the limit we initially set for the memory  usage.
