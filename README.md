[![Build Status](https://travis-ci.org/raviBhadeshiya/turbo-potato.svg?branch=master)](https://travis-ci.org/raviBhadeshiya/turbo-potato)
# turbo-potato

## Dependency:
ubuntu 16.04 or higher
nvidia driver - 318.xx or higher

## Standard install via command-line
To install docker, nvidia docker 2 and setup follow this
```
$ cd ~/turbo_potato/docker
$ ./install.sh
```

To separately build:
```
$ cd ~/turbo_potato/docker
$ ./build.sh
```
>NOTE: For customized build modify the option.sh

Start the container:
```
$ cd ~/turbo_potato/docker
$ ./start.sh
```
or
```
$ rosStart
```

Bash in container:
```
$ cd ~/turbo_potato/docker
$ ./bash.sh
```
or
```
$ rosBash
```

Stop container:
```
$ cd ~/turbo_potato/docker
$ ./stop.sh
```
or
```
$ rosStop
```
>NOTE: Alias can found under docker/external/setup.sh