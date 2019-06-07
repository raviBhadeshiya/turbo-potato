[![Build Status](https://travis-ci.org/raviBhadeshiya/turbo-potato.svg?branch=master)](https://travis-ci.org/raviBhadeshiya/turbo-potato)
# turbo-potato

### Dependency:
[![ubuntu](https://img.shields.io/badge/ubuntu-16.06%20or%20Higher-blue)]()
[![docker](https://img.shields.io/badge/docker%20version-19.03%20or%20Higher-yellowgreen)]()

[![nvidia](https://img.shields.io/badge/nvidia%20driver-318.xx%20or%20Higher-important)]()
[![docker](https://img.shields.io/badge/nvidia--container--toolkit%20version-2.2.2%20or%20Higher-critical)](https://github.com/NVIDIA/nvidia-docker)

To automatically install of dependency follow this
```
$ cd ~/turbo_potato/docker
$ ./install.sh
```
---
---
## Standard build/run via command-line

To build docker image:
```
$ cd ~/turbo_potato/docker
$ ./build.sh
$ ./setup.sh # aliasis will be setup for ease
```
>NOTE: For customized build/run modify the [option.sh](option.sh)
---
Start the container:
```
$ cd ~/turbo_potato/docker
$ ./start.sh
```
or
```
$ rosStart
```
----
Bash in container:
```
$ cd ~/turbo_potato/docker
$ ./bash.sh
```
or
```
$ rosBash
```
----
Stop container:
```
$ cd ~/turbo_potato/docker
$ ./stop.sh
```
or
```
$ rosStop
```
